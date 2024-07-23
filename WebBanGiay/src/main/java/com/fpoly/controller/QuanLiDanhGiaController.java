package com.fpoly.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.hpsf.Array;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fpoly.classes.DonHangClass;
import com.fpoly.dao.AnhDanhGiaDAO;
import com.fpoly.dao.DanhGiaDAO;
import com.fpoly.dao.PhanHoiDAO;
import com.fpoly.dao.SanPhamDAO;
import com.fpoly.dao.UserDAO;
import com.fpoly.entity.AnhDanhGia;
import com.fpoly.entity.ChiTietDonHang;
import com.fpoly.entity.DanhGia;
import com.fpoly.entity.PhanHoi;
import com.fpoly.entity.Slide;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/quanlidanhgia")
public class QuanLiDanhGiaController {
	@Autowired
	SanPhamDAO sanphamDAO;
	@Autowired
	UserDAO userDAO;
	@Autowired
	PhanHoiDAO phanhoidao;
	@Autowired
	AnhDanhGiaDAO anhdanhgiadao;

	@Autowired
	private HttpServletRequest req;
	@Autowired
	private HttpServletResponse resp;
	@Autowired
	private DanhGiaDAO danhgiaDAO;

	@GetMapping("/listDanhGia")
	public String getAllDanhGia(Model model) {
		List<DanhGia> danhgia = danhgiaDAO.findAll();
		model.addAttribute("DSDanhGia", danhgia);
		return "admin/quanlydanhgia";
	}

	@GetMapping("/delete/{maDanhGia}")
	public String deleteDanhGia(@PathVariable("maDanhGia") int maDanhGia) {
		DanhGia danhGia = danhgiaDAO.findById(maDanhGia).orElse(null);
		if (danhGia != null) {
			List<PhanHoi> listPhanHoi = danhGia.getPhanhoi();
			for (PhanHoi item : new ArrayList<>(listPhanHoi)) {
				phanhoidao.delete(item);
			}
			List<AnhDanhGia> listAnhDanhGia = danhGia.getAnhdanhgia();
			for (AnhDanhGia item : new ArrayList<>(listAnhDanhGia)) {
				anhdanhgiadao.delete(item);
			}
			danhgiaDAO.delete(danhGia);
		}
		return "redirect:/quanlidanhgia/listDanhGia";
	}

	@GetMapping("/phanhoi/{maDanhGia}")
	public String phanHoi(@PathVariable("maDanhGia") int maDanhGia, Model model) {
		DanhGia danhGia = danhgiaDAO.findById(maDanhGia).orElse(null);
		if (danhGia != null) {
			model.addAttribute("danhGia", danhGia);
		}
		return "quanlidanhgia/phanHoiDanhGia";
	}

	@PostMapping("/updatePhanHoi")
	public String updatePhanHoi(@ModelAttribute("danhGia") DanhGia danhGia) {
		DanhGia existingDanhGia = danhgiaDAO.findById(danhGia.getMadanhgia()).orElse(null);
		if (existingDanhGia == null) {
			return "redirect:/error";
		}
		existingDanhGia.setPhanhoi(danhGia.getPhanhoi());
		PhanHoi phanHoi = new PhanHoi();
		danhgiaDAO.save(existingDanhGia);

		return "redirect:/quanlidanhgia/listDanhGia";
	}
}
