package com.fpoly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fpoly.dao.HangDAO;
import com.fpoly.entity.Hang;

@Controller
public class QuanLiHang {
	@Autowired
	HangDAO hang;

	@RequestMapping("/hang")
	public String getHang(Model model) {
		List<Hang> listHang = hang.findAll();
		Hang han = new Hang();
		model.addAttribute("han", han);
		model.addAttribute("listHang", listHang);
		return "admin/hang";
	}

	@RequestMapping("/createhang")
	public String createHang(Model model, Hang item) {
		
		// Kiểm tra xem hãng đã tồn tại hay chưa
		Hang existingHang = hang.findByTenhang(item.getTenhang());
		boolean check = true;
		if (existingHang != null) {
			// Nếu hãng đã tồn tại, có thể xử lý lỗi ở đây, ví dụ:
			model.addAttribute("error", "Tên hãng đã tồn tại!");
			check = false;
		}
		if (item.getTenhang() == null || item.getTenhang().equals("")) {
			model.addAttribute("error", "Tên hãng không được bỏ trống!");
			check = false;
		}
		System.out.println(check);
		if (check == false) {
			List<Hang> listHang = hang.findAll();
			Hang han = new Hang();
			model.addAttribute("han", han);
			model.addAttribute("listHang", listHang);
			return "admin/hang";
		} else {
			// Nếu hãng chưa tồn tại, lưu hãng vào cơ sở dữ liệu
			hang.save(item);
			return "redirect:/hang";
		}
	}
	@RequestMapping("/updatehang")
	public String updateHang(Hang item) {
		hang.save(item);
		return "redirect:/hang";
	}
	
	@RequestMapping("/hang/edithang/{idHang}")
	public String editHang(Model model, @PathVariable("idHang") int idHang) {
		Hang han = hang.findByMahang(idHang);
		model.addAttribute("han", han);
		model.addAttribute("listHang", hang.findAll());
		return "admin/hang";
	}
}
