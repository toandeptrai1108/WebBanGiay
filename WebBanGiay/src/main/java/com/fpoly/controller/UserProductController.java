package com.fpoly.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;
import java.util.OptionalDouble;
import java.util.Set;
import java.util.stream.Collectors;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.dao.AnhSanPhamDAO;
import com.fpoly.dao.ChiTietSanPhamDAO;
import com.fpoly.dao.DanhGiaDAO;
import com.fpoly.dao.DanhMucDAO;
import com.fpoly.dao.HangDAO;
import com.fpoly.dao.SanPhamDAO;
import com.fpoly.entity.AnhSanPham;
import com.fpoly.entity.ChiTietSanPham;
import com.fpoly.entity.DanhGia;
import com.fpoly.entity.DanhMuc;
import com.fpoly.entity.Hang;
import com.fpoly.entity.SanPham;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/userproduct")
public class UserProductController {

	@Autowired
	SanPhamDAO sanPhamDAO;
	@Autowired
	DanhMucDAO danhMucDAO;
	@Autowired
	HangDAO hangDAO;
	@Autowired
	ChiTietSanPhamDAO chiTietSanPhamDAO;
	@Autowired
	AnhSanPhamDAO anhSanPhamDAO;
	@Autowired
	DanhGiaDAO danhGiaDAO;

	@GetMapping("")
	public String hienThiSanPham(Model model, @RequestParam("sort") Optional<String> sortParam,
			@RequestParam("page") Optional<Integer> page, @RequestParam("min") Optional<Integer> min,
			@RequestParam("max") Optional<Integer> max, @RequestParam("tenDanhMuc") Optional<String> tenDanhMuc,
			@RequestParam("tenHang") Optional<String> tenHang,
			@ModelAttribute("dathangthanhcong") String dathangthanhcong) {
		// Kiểm tra nếu nó không có giá trị hoặc rỗng thì set lại bên input
		if (!tenDanhMuc.equals(Optional.empty()) && !tenDanhMuc.equals("")) {
			model.addAttribute("tenDanhMuc", tenDanhMuc.get());
		} else {
			model.addAttribute("tenDanhMuc", "");
		}
		if (!tenHang.equals(Optional.empty()) && !tenHang.equals("")) {
			model.addAttribute("tenHang", tenHang.get());
		} else {
			model.addAttribute("tenHang", "");
		}
		if (!sortParam.equals(Optional.empty()) && !sortParam.equals("")) {
			model.addAttribute("sortParam", sortParam.get());
		} else {
			model.addAttribute("sortParam", "");
		}
		if (!min.equals(Optional.empty()) && !min.equals("")) {
			model.addAttribute("min", min.get());
		} else {
			model.addAttribute("min", "");
		}
		if (!max.equals(Optional.empty()) && !max.equals("")) {
			model.addAttribute("max", max.get());
		} else {
			model.addAttribute("max", "");
		}
		Pageable pageable = PageRequest.of(page.orElse(0), 9);
		Page<SanPham> dsSP = sanPhamDAO.findAll(pageable);
		dsSP = sanPhamDAO.findByHangAndDanhMucAndPriceRange(tenHang.orElse(""), tenDanhMuc.orElse(""), min.orElse(0),
				max.orElse(1000000000), pageable);
		if (!sortParam.isEmpty()) {
			Sort sort = Sort.by(Direction.ASC, "gia");// Mặc định sắp xếp giá tăng dần
			if (sortParam.get().equals("gia-desc")) {
				sort = Sort.by(Direction.DESC, "gia");// Sắp xếp giảm dần
			}
			pageable = PageRequest.of(page.orElse(0), 9, sort);
			dsSP = sanPhamDAO.findByHangAndDanhMucAndPriceRange(tenHang.orElse(""), tenDanhMuc.orElse(""),
					min.orElse(0), max.orElse(1000000000), pageable);
		}

		model.addAttribute("dsSP", dsSP);
		return "userproduct/sanpham";
	}

	@GetMapping("/danhmuc/{maDanhMuc}")
	public String hienThiSanPhamTheoDanhMuc(@PathVariable("maDanhMuc") int maDanhMuc, Model model,
			@RequestParam(value = "page", defaultValue = "0") int page) {
		Pageable pageable = PageRequest.of(page, 9);
		Page<SanPham> dsSP = sanPhamDAO.findByIdCategory(maDanhMuc, pageable);
		model.addAttribute("dsSP", dsSP);
		model.addAttribute("currentCategory", maDanhMuc);
		return "userproduct/sanpham";
	}

	@GetMapping("/flashSale")
	public String hienThiSanPhamTheoFlashSale(Model model, @RequestParam(value = "page", defaultValue = "0") int page) {
		Pageable pageable = PageRequest.of(page, 12);
		Page<SanPham> dsSP = sanPhamDAO.findFlashSale(pageable);
		System.out.println(dsSP.getTotalElements());
		model.addAttribute("dsSP", dsSP);
		model.addAttribute("flashSale", true);
		return "userproduct/sanpham";
	}

	@GetMapping("/chitietsanpham/{masanpham}")
	public String hienThiChiTietSanPham(Model model, @PathVariable("masanpham") Integer masanpham,
			HttpServletRequest request) {
		SanPham sanpham = sanPhamDAO.getById(masanpham);
		List<ChiTietSanPham> chiTietSanPham = chiTietSanPhamDAO.findBySanPham(sanpham);
		List<AnhSanPham> anhSanPham = anhSanPhamDAO.findBySanPham(sanpham);
		if (anhSanPham != null) {
			model.addAttribute("anhSanPham", anhSanPham);
		}

		// Giá thấp và cao nhất trong danh sách chi tiết sản phẩm
		Optional<Float> maxGia;
		maxGia = chiTietSanPham.stream().map(ChiTietSanPham::getGiatien).max((a, b) -> Float.compare(a, b));
		Optional<Float> minGia;
		minGia = chiTietSanPham.stream().map(ChiTietSanPham::getGiatien).min((a, b) -> Float.compare(a, b));
		Float giaCaoNhat = 0f;
		Float giaThapNhat = 0f;
		giaThapNhat = maxGia.orElse(0f);
		giaCaoNhat = minGia.orElse(0f);
		model.addAttribute("giaThapNhat", giaThapNhat);
		model.addAttribute("giaCaoNhat", giaCaoNhat);

		// Tạo các tập hợp để lưu trữ các giá trị duy nhất
		Set<String> mausacs = new HashSet<>();
		Set<String> sizes = new HashSet<>();
		// Vòng lặp duyệt để lấy danh sách màu và size
		for (ChiTietSanPham chiTiet : chiTietSanPham) {
			mausacs.add(chiTiet.getMausac());
			sizes.add(chiTiet.getSize());
		}
		List<String> listMausac = new ArrayList<>(mausacs);
		List<String> listSize = new ArrayList<>(sizes);
		// Lấy size và màu được chọn
		String mausac = request.getParameter("mausac");
		String size = request.getParameter("size");
	    List<String> availableMausacs = new ArrayList<>();
	    List<String> availableSizes = new ArrayList<>();
	    if (mausac!= null) {
	        availableSizes = chiTietSanPham.stream()
	               .filter(ct -> ct.getMausac().equals(mausac))
	               .map(ChiTietSanPham::getSize)
	               .distinct()
	               .collect(Collectors.toList());
	    } else if (size!= null) {
	        availableMausacs = chiTietSanPham.stream()
	               .filter(ct -> ct.getSize().equals(size))
	               .map(ChiTietSanPham::getMausac)
	               .distinct()
	               .collect(Collectors.toList());
	    } else {
	        availableMausacs = chiTietSanPham.stream()
	               .map(ChiTietSanPham::getMausac)
	               .distinct()
	               .collect(Collectors.toList());
	        availableSizes = chiTietSanPham.stream()
	               .map(ChiTietSanPham::getSize)
	               .distinct()
	               .collect(Collectors.toList());
	    }
	    model.addAttribute("availableMausacs", availableMausacs);
	    model.addAttribute("availableSizes", availableSizes);
	    
		Boolean trangThaiHang = false;
		Boolean trangThaiHangMuaHang = false;
		// Nếu size
		if (mausac != null && size != null) {
			ChiTietSanPham chiTietSanPhamEntity = chiTietSanPhamDAO.findSanPhamBangMaSanPhamMauSacVaSize(sanpham,
					mausac, size);
			if (chiTietSanPhamEntity == null) {
				// Không có chi tiết nào hết thì nó không còn hàng
				trangThaiHang = false;
			} else {
				trangThaiHang = true;
				trangThaiHangMuaHang = true;
				model.addAttribute("maChiTietSanPham", chiTietSanPhamEntity.getMachitietsanpham());
				model.addAttribute("soLuongSanPhamCon", chiTietSanPhamEntity.getSoluong());
				// Nó có giá riêng
				model.addAttribute("giaThapNhat", 0);
				model.addAttribute("giaCaoNhat", 0);
				model.addAttribute("giaChiTietSanPham", chiTietSanPhamEntity.getGiatien());
			}
		}

		// Set đánh giá
		List<DanhGia> listDanhGia = danhGiaDAO.findBySanpham(sanpham);
		float tongsosao = 0;
		float soLuongDanhGia = 0;
		for (DanhGia danhGia : listDanhGia) {
			tongsosao += danhGia.getSosao();
			soLuongDanhGia += 1;
		}
		float soSaoTrungBinh = tongsosao / soLuongDanhGia;

		// Set SanPham cùng danh mục
		List<SanPham> listSanPhamTuongTu = sanPhamDAO.findTop10ProductsByDanhMucAndHang(sanpham.getDanhmuc(),
				sanpham.getHang());

		// Set model cần chia sẻ cho JSP
		model.addAttribute("listSanPhamTuongTu", listSanPhamTuongTu);
		model.addAttribute("soSaoTrungBinh", soSaoTrungBinh);
		model.addAttribute("listDanhGia", listDanhGia);
		model.addAttribute("trangThaiHangMuaHang", trangThaiHangMuaHang);
		model.addAttribute("mausac", mausacs);// Sản phẩm này có những màu nào
		model.addAttribute("mauHienTaiDuocChon", mausac);// cif có thì active nó, cif không thì bình thường
		model.addAttribute("size", sizes);// Sản phẩm này có những size nào
		model.addAttribute("sizeHienTaiDuocChon", size);// cif có thì active nó, cif không thì bình thường
		model.addAttribute("sanpham", sanpham);// Lấy id
		model.addAttribute("trangThaiHang", trangThaiHang);// Trạng thái còn hàng hay khôn
		return "userproduct/chitietsanpham";
	}

	// Lấy một ds danhmuc
	@ModelAttribute("listDanhMuc")
	public List<DanhMuc> getDanhMuc() {
		List<DanhMuc> listDanhMuc = danhMucDAO.findAll();
		return listDanhMuc;
	}

	// Lấy một ds danhmuc
	@ModelAttribute("listHang")
	public List<Hang> getHang() {
		List<Hang> listHang = hangDAO.findAll();
		return listHang;
	}

}
