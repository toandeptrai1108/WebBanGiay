package com.fpoly.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fpoly.dao.AnhDanhGiaDAO;
import com.fpoly.dao.ChiTietDonHangDAO;
import com.fpoly.dao.ChiTietSanPhamDAO;
import com.fpoly.dao.DanhGiaDAO;
import com.fpoly.dao.DonHangDAO;
import com.fpoly.dao.SanPhamDAO;
import com.fpoly.dao.UserDAO;
import com.fpoly.entity.AnhDanhGia;
import com.fpoly.entity.ChiTietDonHang;
import com.fpoly.entity.ChiTietSanPham;
import com.fpoly.entity.DanhGia;
import com.fpoly.entity.DonHang;
import com.fpoly.entity.SanPham;
import com.fpoly.entity.User;
import com.fpoly.service.SessionService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
@RequestMapping("/lichsuthanhtoan")
public class UserHistoryOrderController {
	@Autowired
	DonHangDAO donhangdao;
	@Autowired
	UserDAO userdao;
	@Autowired
	DanhGiaDAO danhGiaDAO;
	@Autowired
	AnhDanhGiaDAO anhDanhGiaDAO;
	@Autowired
	ChiTietDonHangDAO chiTietDonHangDAO;
	@Autowired
	SanPhamDAO sanPhamDAO;
	@Autowired
	ChiTietSanPhamDAO chiTietSanPhamDAO;

	@Autowired
	SessionService ss;
	@Autowired
	HttpServletRequest req;
	@Autowired
	HttpServletResponse resp;

	@GetMapping("")
	public String hienThiLichSu(Model model) {
		//User user = userdao.findByManguoidung(4);
		User user = ss.docDuLieu("user");
		if (user == null) {
			return "redirect:/account/dangnhap";
		}
		List<DonHang> listDonHang = donhangdao.findByUser(user);
		model.addAttribute("list", listDonHang);
		return "userprofile/historyorder";
		// return "index";
	}

	@GetMapping("/huydon/{maDonHang}")
	public String huyDon(Model model, @PathVariable("maDonHang") int maDonHang) {
		DonHang donHangHuy = donhangdao.findByMadonhang(maDonHang);
		donHangHuy.setTrangthaidonhang(2);// 2 = Đơn hàng đã hủy
		donhangdao.save(donHangHuy);
		return "redirect:/lichsuthanhtoan";
	}

	@GetMapping("/xacnhandonhang/{maDonHang}")
	public String daNhanHang(Model model, @PathVariable("maDonHang") int maDonHang) {
		DonHang donHangXanNhan = donhangdao.findByMadonhang(maDonHang);
		donHangXanNhan.setTrangthaidonhang(3);// 6 = Đã nhận và xác nhận đơn hàng
		donHangXanNhan.setTrangthaivanchuyen(6);
		donhangdao.save(donHangXanNhan);
		return "redirect:/lichsuthanhtoan";
	}

	@GetMapping("/danhgia/{maDonHang}")
	public String moFormDanhGia(Model model, @PathVariable("maDonHang") int maDonHang) {
		DanhGia danhGia = new DanhGia();
		DonHang donHang = new DonHang();
		SanPham sanPham = new SanPham();
		try {
			// Đơn hàng -> Chi tiết đơn hàng
			donHang = donhangdao.findByMadonhang(maDonHang);
			// Chi tiết đơn hnagf -> Chi tiết sản phẩm
			List<ChiTietDonHang> list = chiTietDonHangDAO.findByDonhang(donHang);
			for (ChiTietDonHang item : list) {
				// Chi tiết sản phẩm -> Sản phẩm
				ChiTietSanPham ChiTietSanPham = chiTietSanPhamDAO
						.findByMachitietsanpham(item.getChitietsanpham().getMachitietsanpham());
				sanPham = ChiTietSanPham.getSanpham();
				model.addAttribute("sanPham", sanPham);

			}
		} catch (

		Exception e) {
			// TODO: handle exception
		}
		model.addAttribute("danhgia", danhGia);
		model.addAttribute("maDonHang", maDonHang);
		return "userprofile/danhgia";
	}

	@PostMapping("/danhgia/{maDonHang}")
	public String submitDanhGia(@ModelAttribute("danhgia") DanhGia danhGia,
			@RequestParam("anhDanhGia") MultipartFile[] anhDanhGia, @PathVariable("maDonHang") int maDonHang) {
		//User user = userdao.findByManguoidung(4);
		User user = ss.docDuLieu("user");
		if (user == null) {
			return "redirect:/account/dangnhap";
		}
		// Set DanhGia
		try {
			DonHang donHang = donhangdao.findByMadonhang(maDonHang);
			List<ChiTietDonHang> listChiTietDonHang = chiTietDonHangDAO.findByDonhang(donHang);
			int maSanPham = 0;
			for (ChiTietDonHang chiTietDonHang : listChiTietDonHang) {
				maSanPham = chiTietDonHang.getChitietsanpham().getSanpham().getMasanpham();
			}
			danhGia.setNgaydanhgia(new Date());
			danhGia.setSanpham(sanPhamDAO.findByMasanpham(maSanPham));
			danhGia.setUser(user);
			danhGiaDAO.save(danhGia);
		} catch (Exception e) {
			return "redirect:/lichsuthanhtoan";
		}

		// Create the directory if it doesn't exist
		String uploadDir = "src/main/webapp/assets/img/danhgia/";
		File uploadFolder = new File(uploadDir);
		if (!uploadFolder.exists()) {
			uploadFolder.mkdirs();
		}
		// Save File
		for (MultipartFile file : anhDanhGia) {
			String fileName = file.getOriginalFilename();
			String uploadsDir = req.getServletContext().getRealPath("/assets/img/danhgia/");
			Path path = Paths.get(uploadsDir + fileName);
			try {
				Files.write(path, file.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
			AnhDanhGia anhDanhGiaEntity = new AnhDanhGia();
			anhDanhGiaEntity.setNguonanh(fileName);
			anhDanhGiaEntity.setDanhgia(danhGia);
			anhDanhGiaDAO.save(anhDanhGiaEntity);
		}
		DonHang donHangUpdate = donhangdao.findByMadonhang(maDonHang);
		donHangUpdate.setTrangthaidanhgia(true);
		donhangdao.save(donHangUpdate);
		return "redirect:/lichsuthanhtoan";
	}

}
