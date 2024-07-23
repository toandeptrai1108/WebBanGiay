package com.fpoly.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.Remove;
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

import com.fpoly.dao.ChiTietSanPhamDAO;
import com.fpoly.dao.DanhMucDAO;
import com.fpoly.dao.HangDAO;
import com.fpoly.dao.SanPhamDAO;
import com.fpoly.entity.AnhDanhGia;
import com.fpoly.entity.AnhSanPham;
import com.fpoly.entity.ChiTietDonHang;
import com.fpoly.entity.ChiTietSanPham;
import com.fpoly.entity.DanhGia;
import com.fpoly.entity.DanhMuc;
import com.fpoly.entity.DonHang;
import com.fpoly.entity.Hang;
import com.fpoly.entity.SanPham;
import com.fpoly.entity.User;

@Controller
public class ProductManagerController {
	@Autowired
	SanPhamDAO spDAO;
	@Autowired
	SanPhamDAO sanphamdao;

	@RequestMapping("/productmanager")
	public String productManager(Model model) {
		List<SanPham> listSP = spDAO.findAll();
		SanPham sp = new SanPham();
		model.addAttribute("sp", sp);
		model.addAttribute("listSP", listSP);
		return "admin/productmanager";
	}

	@Autowired
	ChiTietSanPhamDAO ctspDAO;

	@GetMapping("productmanager/editsanpham/{idSP}")
	public String editSanPham(@PathVariable("idSP") int idSP, Model model) {
		SanPham sp = new SanPham();
		sp = spDAO.findByMasanpham(idSP);
		model.addAttribute("sp", sp);
		model.addAttribute("listSP", spDAO.findAll());
		return "productManager";
	}

	@RequestMapping("/createproduct")
	public String create(SanPham item) {
		spDAO.save(item);
		return "redirect:/productmanager";
	}

	@RequestMapping("/createdetailproduct")
	public String createdetailproduct(ChiTietSanPham item) {
		SanPham sp = item.getSanpham();
		ChiTietSanPham existingDetail = ctspDAO.findBySanphamAndMausacAndSize(sp, item.getMausac(), item.getSize());
		if (existingDetail != null) {
			// Nếu đã tồn tại, cập nhật số lượng
			existingDetail.setSoluong(existingDetail.getSoluong() + item.getSoluong());
			ctspDAO.save(existingDetail);
		} else {
			// Nếu chưa tồn tại, thêm mới chi tiết sản phẩm
			ctspDAO.save(item);
		}
		return "redirect:/productmanager/chitietsanpham/" + sp.getMasanpham();
	}

	@GetMapping("/productmanager/chitietsanpham/{idSP}")
	public String hienThiTrangChiTietSanPham(@PathVariable("idSP") int idSP, Model model) {
		SanPham sp = spDAO.findByMasanpham(idSP);
		List<ChiTietSanPham> ctsp = ctspDAO.findBySanPham(sp);
		ChiTietSanPham entity = new ChiTietSanPham();
//		entity.setSanpham(sp);
		model.addAttribute("entity", entity);
		model.addAttribute("ctsp", ctsp);
		return "admin/detailproductmanager";
	}

	// ChiTietSanPham
	@GetMapping("/productmanager/chitietsanpham/edit/{maChiTietSanPham}")
	public String editChiTietSanPham(@PathVariable("maChiTietSanPham") int maChiTietSanPham, Model model) {
		ChiTietSanPham chiTietSanPham = ctspDAO.findByMachitietsanpham(maChiTietSanPham);
		List<ChiTietSanPham> ctsp = ctspDAO.findBySanPham(chiTietSanPham.getSanpham());
		model.addAttribute("entity", chiTietSanPham);
		model.addAttribute("ctsp", ctsp);
		return "admin/detailproductmanager";
	}

	@GetMapping("/productmanager/chitietsanpham/delete/{maChiTietSanPham}")
	public String xoaChiTietSanPham(@PathVariable("maChiTietSanPham") int maChiTietSanPham, Model model) {
		ChiTietSanPham chiTietSanPhamCanXoa = ctspDAO.findByMachitietsanpham(maChiTietSanPham);
		List<ChiTietSanPham> ctsp = ctspDAO.findBySanPham(chiTietSanPhamCanXoa.getSanpham());
		ChiTietSanPham chiTietSanPhamMoi = new ChiTietSanPham();
		chiTietSanPhamMoi.setSanpham(chiTietSanPhamCanXoa.getSanpham());
		ctspDAO.delete(chiTietSanPhamCanXoa);
		model.addAttribute("entity", chiTietSanPhamMoi);
		model.addAttribute("ctsp", ctsp);
		return "redirect:/productmanager/chitietsanpham/" + chiTietSanPhamMoi.getSanpham().getMasanpham();
	}

	@RequestMapping("/update/detailproduct")
	public String capNhatChiTietSanPham(ChiTietSanPham item) {
		ctspDAO.save(item);
		return "redirect:/productmanager/chitietsanpham/edit/" + item.getMachitietsanpham();
	}

	@RequestMapping("/reset/detailproduct")
	public String detailProductManager(ChiTietSanPham item, Model model) {
		SanPham sp = spDAO.findByMasanpham(item.getSanpham().getMasanpham());
		List<ChiTietSanPham> ctsp = ctspDAO.findBySanPham(sp);
		ChiTietSanPham entity = new ChiTietSanPham();
		entity.setSanpham(sp);
		model.addAttribute("entity", entity);
		model.addAttribute("ctsp", ctsp);
		return "admin/detailproductmanager";
	}

	// End ChiTietSanPham

	// Ảnh sản phẩm
//	@GetMapping("/themanhdanhgia/{maSanPham}")
//	public String moFormThemAnhSanPham(Model model, @PathVariable("maSanPham") int maSanPham) {
//		AnhSanPham anhSanPham = new AnhSanPham();
//		SanPham sanPham = new SanPham();	
//		sanPham = sanphamdao.findByMasanpham(maSanPham);
//		
//		model.addAttribute("sanpham", sanPham);
//		model.addAttribute("anhsanpham", anhSanPham);
//		return "admin/themanhsanpham";
//	}
//
//	@PostMapping("/themanhsanpham/{masanpham}")
//	public String themAnhSanPham(@ModelAttribute("anhSanPham") AnhSanPham anhSanPham,
//			@RequestParam("anhSanPham") MultipartFile[] listAnhSanPham, @PathVariable("maSanPham") int maSanPham) {
//
//		// Set AnhSanPham
//		SanPham sanpham = sanphamdao.findByMasanpham(maSanPham);
//		// Create the directory if it doesn't exist
//		String uploadDir = "src/main/webapp/assets/img/danhgia/";
//		File uploadFolder = new File(uploadDir);
//		if (!uploadFolder.exists()) {
//			uploadFolder.mkdirs();
//		}
//		// Save File
//		for (MultipartFile file : anhDanhGia) {
//			String fileName = file.getOriginalFilename();
//			String uploadsDir = req.getServletContext().getRealPath("/assets/img/danhgia/");
//			Path path = Paths.get(uploadsDir + fileName);
//			try {
//				Files.write(path, file.getBytes());
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			AnhDanhGia anhDanhGiaEntity = new AnhDanhGia();
//			anhDanhGiaEntity.setNguonanh(fileName);
//			anhDanhGiaEntity.setDanhgia(danhGia);
//			anhDanhGiaDAO.save(anhDanhGiaEntity);
//		}
//		DonHang donHangUpdate = donhangdao.findByMadonhang(maDonHang);
//		donHangUpdate.setTrangthaidanhgia(true);
//		donhangdao.save(donHangUpdate);
//		return "redirect:/lichsuthanhtoan";
//	}

	// End ảnh sản phẩm
	@RequestMapping("/detailproductmanager")
	public String lamMoiChiTietSanPham(Model model) {
		ChiTietSanPham entity = new ChiTietSanPham();
		model.addAttribute("entity", entity);
		return "detailProductManager";
	}

	@Autowired
	DanhMucDAO danhMucDAO;

	@ModelAttribute("listDanhMuc")
	public List<DanhMuc> getDanhMuc() {
		List<DanhMuc> listDanhMuc = danhMucDAO.findAll();
		return listDanhMuc;
	}

	@Autowired
	HangDAO hangDAO;

	@ModelAttribute("listHang")
	public List<Hang> getHang() {
		List<Hang> listHang = hangDAO.findAll();
		return listHang;
	}

}
