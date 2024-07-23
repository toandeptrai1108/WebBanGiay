package com.fpoly.controller;

import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.classes.CartItem;
import com.fpoly.dao.ChiTietSanPhamDAO;
import com.fpoly.entity.ChiTietSanPham;
import com.fpoly.service.CartService;
import com.fpoly.service.DonHangService;
import com.fpoly.service.SessionService;

@Controller
public class CartController {

	@Autowired
	SessionService ss;
	@Autowired
	ChiTietSanPhamDAO chiTietSanPhamDAO;
	@Autowired
	CartService cartService;
	@Autowired
	DonHangService donHangService;

	@GetMapping("/add-cart/{maChiTietSanPham}")
	public String themSanPhamVaoGioHang(@PathVariable("maChiTietSanPham") int id) {
		List<ChiTietSanPham> listChiTietSanPham = chiTietSanPhamDAO.findAll();
		for (ChiTietSanPham item : listChiTietSanPham) {
			if (item.getMachitietsanpham() == id) {
				cartService.add(item);
			}
		}
		return "redirect:/userproduct";
	}

	@GetMapping("/cart")
	public String moTrangGioHang(Model model) {
		// model.addAttribute("user", ss.docDuLieu("user"));
		model.addAttribute("dsGioHang", cartService.getList());
		return "userproduct/giohang";
	}

	@GetMapping("/cart-remove/{maChiTietSanPham}")
	public String xoaChiTietSanPhamKhoiGioHang(@PathVariable("maChiTietSanPham") int maChiTietSanPham) {
		cartService.remove(maChiTietSanPham);
		return "redirect:/cart";
	}

	@GetMapping("/cart-clear")
	public String clearGioHang() {
		cartService.clear();
		return "redirect:/cart";
	}

	@GetMapping("/cart-increase/{maChiTietSanPham}")
	public String tangSoLuongSanPham(@PathVariable("maChiTietSanPham") int maChiTietSanPham) {
		cartService.increase(maChiTietSanPham);
		return "redirect:/cart";
	}

	@GetMapping("/cart-decrease/{idSP}")
	public String giamSoLuongSanPham(@PathVariable("idSP") int idSP) {
		cartService.decrease(idSP);
		return "redirect:/cart";
	}

	@GetMapping("/orderInCart")
	public String orderInCart(@RequestParam("list") String listId) {
		String decodedListId = URLDecoder.decode(listId, StandardCharsets.UTF_8);
		List<Integer> listIds = Arrays.stream(decodedListId.split(",")).map(Integer::parseInt)
				.collect(Collectors.toList());
		for (Integer item : listIds) {
			System.out.println(item);
		}
		List<CartItem> listGioHang = cartService.getList();
		try {
			for (CartItem cartItem : listGioHang) {
				for (Integer item : listIds) {
					if (cartItem.getChiTietSanPham().getMachitietsanpham() == (int) item) {
						System.out.println(cartItem.getSoluong());
						donHangService.add(cartItem.getChiTietSanPham(), 0, null, 0, cartItem.getSoluong(), 0);
						cartService.remove(item);
					}
				}
			}
		} catch (Exception e) {
			System.out.println("Lỗi không thể lấy dữ liệu");
			System.out.println(e);
		}

		return "redirect:/donhang";
		// return "";
	}
}
