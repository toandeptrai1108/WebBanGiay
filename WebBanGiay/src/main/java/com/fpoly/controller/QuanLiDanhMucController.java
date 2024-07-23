package com.fpoly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fpoly.dao.DanhMucDAO;
import com.fpoly.entity.DanhMuc;
import com.fpoly.entity.DiaChiGiaoHang;
import com.fpoly.entity.Hang;
import com.fpoly.entity.User;

@Controller
public class QuanLiDanhMucController {
	@Autowired
	DanhMucDAO dmDAO;
	@RequestMapping("/danhmuc")
	public String getDanhMuc(Model model) {
		List<DanhMuc> listDM = dmDAO.findAll();
		DanhMuc dm = new DanhMuc();
		model.addAttribute("danhmuc", dm);
		model.addAttribute("listdm", listDM);
		return "admin/danhmuc";
	}
	
	@RequestMapping("/createdanhmuc")
	public String createdanhmuc(Model model, DanhMuc item) {
		DanhMuc existingDM = dmDAO.findByTendanhmuc(item.getTendanhmuc());
		boolean check = true;
		if (existingDM != null) {
			// Nếu hãng đã tồn tại, có thể xử lý lỗi ở đây, ví dụ:
			model.addAttribute("error", "Tên danh mục đã tồn tại!");
			check = false;
		}
		if (item.getTendanhmuc() == null || item.getTendanhmuc().equals("")) {
			model.addAttribute("error", "Tên danh mục không được bỏ trống!");
			check = false;
		}
		System.out.println(check);
		if (check == false) {
			List<DanhMuc> listDM = dmDAO.findAll();
			DanhMuc dm = new DanhMuc();
			model.addAttribute("danhmuc", dm);
			model.addAttribute("listdm", listDM);
			return "admin/danhmuc";
		} else {
			// Nếu hãng chưa tồn tại, lưu hãng vào cơ sở dữ liệu
			dmDAO.save(item);
			return "redirect:/danhmuc";
		}
	}
	@RequestMapping("/updatedanhmuc")
	public String update(DanhMuc item) {
		dmDAO.save(item);
		return "redirect:/danhmuc";
	}
	@RequestMapping("/danhmuc/editdanhmuc/{idDM}")
	public String editDanhMuc(Model model, @PathVariable("idDM") int idDM){
		DanhMuc dm = dmDAO.findByMadanhmuc(idDM);
		model.addAttribute("danhmuc", dm);
		model.addAttribute("listdm", dmDAO.findAll());
		return "admin/danhmuc";
	}
	
}
