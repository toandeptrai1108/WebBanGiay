package com.fpoly.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fpoly.entity.DiaChiGiaoHang;
import com.fpoly.entity.User;
import com.fpoly.service.SessionService;

import com.fpoly.WebBanGiayApplication;
import com.fpoly.dao.DiaChiGiaoHangDAO;
import com.fpoly.dao.UserDAO;

@Controller
@RequestMapping("/diachi")
public class QuanLiDiaChiController {
	@Autowired
	DiaChiGiaoHangDAO dao;
	@Autowired
	UserDAO userDAO;
	@Autowired
	SessionService ss;

	/*
	 * @RequestMapping("/diaChi") public String tableDiaChi(Model model) { //Lấy
	 * user User user = userDAO.findByManguoidung(4);
	 * 
	 * //Lấy danh sách địa chị theo user List<DiaChiGiaoHang> diachigiaohang =
	 * dao.findByUser(user); model.addAttribute("diachigiaohang", diachigiaohang);
	 * 
	 * DiaChiGiaoHang diachi = new DiaChiGiaoHang(); model.addAttribute("item",
	 * diachi); return "diachi/diaChi"; }
	 */
	@GetMapping("/diaChi")
	public String tableDiaChi(Model model) {
		DiaChiGiaoHang diachi = new DiaChiGiaoHang();
		model.addAttribute("diachigiaohang", diachi);

		// Lấy danh sách địa chị theo user
		User user = ss.docDuLieu("user");
		if (user == null) {
			return "redirect:/account/dangnhap";
		}
		List<DiaChiGiaoHang> diachigiaohang = dao.findByUser(user);
		model.addAttribute("diachigiaohangList", diachigiaohang);

		// return "diachi/diaChi";
		return "userprofile/diachiuser";
	}

	@GetMapping("/edit/{madiachigiaohang}")
	public String edit(Model model, @PathVariable("madiachigiaohang") Integer madiachigiaohang) {
		DiaChiGiaoHang diachi = new DiaChiGiaoHang();
		diachi = dao.findByMadiachigiaohang(madiachigiaohang);
		model.addAttribute("diachigiaohang", diachi);

		// Lấy danh sách địa chị theo user
		User user = ss.docDuLieu("user");
		if (user == null) {
			return "redirect:/account/dangnhap";
		}
		List<DiaChiGiaoHang> diachigiaohang = dao.findByUser(user);
		model.addAttribute("diachigiaohangList", diachigiaohang);

		// return "diachi/diaChi";
		return "userprofile/diachiuser";
	}

	@RequestMapping("/create")
	public String create(DiaChiGiaoHang item) {
		// Thiết lập User
		User user = ss.docDuLieu("user");
		if (user == null) {
			return "redirect:/account/dangnhap";
		}
		item.setUser(user);

		dao.save(item);
		return "redirect:/diachi/diaChi";
	}

	@RequestMapping("/update")
	public String update(DiaChiGiaoHang diachigiaohang) {

		User user = ss.docDuLieu("user");
		if (user == null) {
			return "redirect:/account/dangnhap";
		}
		// User user = ss.docDuLieu("user");
		diachigiaohang.setUser(user);

		dao.save(diachigiaohang);
		return "redirect:/diachi/edit/" + diachigiaohang.getMadiachigiaohang();
	}

	@RequestMapping("/delete/{id}")
	public String create(@PathVariable("id") Integer id) {
		dao.deleteById(id);
		return "redirect:/diachi/diaChi";
	}

	@RequestMapping("/reset")
	public String resetForm(Model model) {
		DiaChiGiaoHang diachi = new DiaChiGiaoHang();
		model.addAttribute("diachigiaohang", diachi);
		return "redirect:/diachi/diaChi";
	}

}
