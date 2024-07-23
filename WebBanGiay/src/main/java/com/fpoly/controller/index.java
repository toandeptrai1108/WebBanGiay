package com.fpoly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.fpoly.dao.SanPhamDAO;
import com.fpoly.entity.SanPham;

@Controller
public class index {

	@Autowired
	SanPhamDAO spDao;

	@GetMapping("/index")
	public String index(Model model) {
	    List<SanPham> topSellingProducts = spDao.findTop6BestSellingProducts();
	    model.addAttribute("topSellingProducts", topSellingProducts);
	    return "index";
	}
	
	@GetMapping("/userproduct/map")
	public String moMap() {
		return "/userproduct/map";
	}

}
