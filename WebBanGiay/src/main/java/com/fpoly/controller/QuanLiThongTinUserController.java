package com.fpoly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.dao.ThanhToanDAO;
import com.fpoly.dao.UserDAO;
import com.fpoly.entity.DiaChiGiaoHang;
import com.fpoly.entity.ThanhToan;
import com.fpoly.entity.User;
import com.fpoly.service.SessionService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/quanlithongtin")
public class QuanLiThongTinUserController {

	@Autowired
	UserDAO userDAO;
	@Autowired
	ThanhToanDAO ttDAO;
	@Autowired
	SessionService ss;

	@GetMapping("/indexQLTT")
	public String formThongTin(Model model, HttpSession session) {
		User user = ss.docDuLieu("user");
		if (user == null) {
			return "redirect:/account/dangnhap";
		}
		model.addAttribute("user", user);
		List<ThanhToan> lstt = ttDAO.findByUser(user);
		model.addAttribute("lstt", lstt);
		return "userprofile/profile";
	}

	@PostMapping("/updateUser")
	public String updateUser(@ModelAttribute("user") User user) {
		User User = ss.docDuLieu("user");
		user.setManguoidung(User.getManguoidung());
		user.setPassword(User.getPassword());
		user.setTrangthai(User.isTrangthai());
		user.setTrangthai(User.isRole());
		userDAO.save(user);
		ss.xoaDuLieu("user");
		ss.luuDuLieu("user", user);
		return "redirect:/quanlithongtin/indexQLTT";
	}

}
