package com.fpoly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fpoly.dao.DiaChiGiaoHangDAO;
import com.fpoly.dao.KhuyenMaiDAO;
import com.fpoly.entity.DiaChiGiaoHang;
import com.fpoly.entity.KhuyenMai;
import com.fpoly.entity.User;







@Controller
@RequestMapping("/khuyenmai")
public class QuanLyKhuyenMaiController {
	@Autowired
	KhuyenMaiDAO khuyenmaiDAO;
	
	@RequestMapping("/indexKhuyenMai")
	public String index(Model model) {
		KhuyenMai item = new KhuyenMai();
		model.addAttribute("item", item);
		List<KhuyenMai> items = khuyenmaiDAO.findAll();
		model.addAttribute("items", items);
		return "admin/quanlykhuyenmai";
	}
	
	@RequestMapping("/edit/{makhuyenmai}")
	public String edit(Model model, @PathVariable("makhuyenmai") int makhuyenmai) {
		KhuyenMai item = khuyenmaiDAO.findById(makhuyenmai);
		model.addAttribute("item", item);
		List<KhuyenMai> items = khuyenmaiDAO.findAll();
		model.addAttribute("items", items);
		return "admin/quanlykhuyenmai";
	}
	
	@RequestMapping("/create")
	public String create(KhuyenMai item) {
		khuyenmaiDAO.save(item);
		return "redirect:/khuyenmai/indexKhuyenMai";
	}

	@RequestMapping("/update")
	public String update(KhuyenMai item) {
		khuyenmaiDAO.save(item);
		return "redirect:/khuyenmai/edit/" + item.getMakhuyenmai();
	}

	@RequestMapping("/delete/{makhuyenmai}")
	public String create(@PathVariable("makhuyenmai") int makhuyenmai) {
		khuyenmaiDAO.deleteById(makhuyenmai);
		return "redirect:/khuyenmai/indexKhuyenMai";
	}
	
}
