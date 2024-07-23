package com.fpoly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fpoly.dao.HangDAO;
import com.fpoly.dao.UserDAO;
import com.fpoly.entity.DanhMuc;
import com.fpoly.entity.Hang;
import com.fpoly.entity.User;

@Controller
public class UserController {
	@Autowired
	UserDAO usDAO;

	@RequestMapping("/usermanager")
	public String userManager(Model model) {
		List<User> listuser = usDAO.findAll();
		User user = new User();
		model.addAttribute("user", user);
		model.addAttribute("listuser", listuser);
		return "admin/usermanager";
	}

	@RequestMapping("/deleteuser/{id}")
	public String delete(@PathVariable("id") Integer id) {
		usDAO.deleteById(id);
		return "redirect:/usermanager";
	}

	@RequestMapping("/usermanager/edit/{idUser}")
	public String editUserManager(@PathVariable("idUser") Integer idUser, Model model) {
		User us = usDAO.findByManguoidung(idUser);
		model.addAttribute("user", us);
		model.addAttribute("listus", usDAO.findAll());
		return "admin/userdetail";
	}

	@RequestMapping("/usermanager/update")
	public String updateUser(User item, Model model) {
		User user = new User();
		model.addAttribute("listuser", user);
		usDAO.save(item);
		return "redirect:/usermanager";
	}

}
