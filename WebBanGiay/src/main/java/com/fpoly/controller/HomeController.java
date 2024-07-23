package com.fpoly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fpoly.dao.ChiTietSanPhamDAO;
import com.fpoly.dao.SanPhamDAO;
import com.fpoly.dao.UserDAO;
import com.fpoly.entity.ChiTietSanPham;
import com.fpoly.entity.DiaChiGiaoHang;
import com.fpoly.entity.SanPham;
import com.fpoly.entity.User;

@Controller
public class HomeController {

	@RequestMapping("/home")
	public String moTrangChu() {
		return "index";
	}

	@RequestMapping("/product")
	public String product() {
		return "product";
	}

	@Autowired
	UserDAO dao;

	@RequestMapping("/edituser")
	public String editUser(Model model) {
		String tentaikhoan = "levanc";
		User user = dao.findByTenTaiKhoan(tentaikhoan);
		model.addAttribute("users", user);
		return "edit-user";
	}

}
