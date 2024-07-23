package com.fpoly.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fpoly.dao.SlideDAO;
import com.fpoly.entity.KhuyenMai;
import com.fpoly.entity.Slide;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;




@Controller
@RequestMapping("/quanlislide")
public class SlideController {

    @Autowired
    private HttpServletRequest req;

    @Autowired
    private HttpServletResponse resp;

    @Autowired
    private SlideDAO slideDAO;

    @GetMapping("/listSlide")
    public String getAllSlides(Model model) {
        List<Slide> slides = slideDAO.findAll();
        model.addAttribute("DSSlide", slides);
        return "quanlislide/listslidemanager";
    }

    @GetMapping("/detail/{id}")
    public String getSlideDetail(@PathVariable("id") int id, Model model) {
        Slide slide = slideDAO.findById(id).orElse(null);
        model.addAttribute("slide", slide);
        return "quanlislide/detailsSlide";
    }

    @GetMapping("/edit/{maSlide}")
    public String edit(@PathVariable("maSlide") int maSlide, Model model) {
        Slide slide = slideDAO.findById(maSlide).orElse(null);
        if (slide != null) {
            model.addAttribute("slide", slide);
            model.addAttribute("imageName", slide.getAnhdaidien());
        }
        return "quanlislide/editslidemanager";
    }

    @PostMapping("/update")
    public String update(@Validated @ModelAttribute("slide") Slide updatedSlide, BindingResult bindingResult, @RequestParam("file") MultipartFile file, Model model) {
        if (bindingResult.hasErrors()) {
            return "quanlislide/editslidemanager";
        }

        if (!file.isEmpty()) {
            String fileName = file.getOriginalFilename();
            try {
                String uploadsDir = req.getServletContext().getRealPath("/assets/img/slide/");
                Path path = Paths.get(uploadsDir + fileName);
                Files.write(path, file.getBytes());
                updatedSlide.setAnhdaidien(fileName);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        // Kiểm tra nếu slide đã tồn tại thì cập nhật
        Slide existingSlide = slideDAO.findById(updatedSlide.getMaslide()).orElse(null);
        if (existingSlide != null) {
            existingSlide.setLink(updatedSlide.getLink());
            existingSlide.setTrangthai(updatedSlide.getTrangthai());
            existingSlide.setAnhdaidien(updatedSlide.getAnhdaidien());
            slideDAO.save(existingSlide);
        } else {
            // Nếu không tồn tại, có thể thêm mới
            slideDAO.save(updatedSlide);
        }

        return "redirect:/quanlislide/listSlide";
    }

    @RequestMapping("/delete/{maSlide}")
    public String delete(@PathVariable("maSlide") int maSlide) {
        slideDAO.deleteById(maSlide);
        return "redirect:/quanlislide/listSlide";
    }

    @ModelAttribute("listTrangThai")
    public String[] getTrangThai() {
        return new String[] { "true", "false" };
    }

    @GetMapping("/create")
    public String create(Model model) {
        model.addAttribute("slide", new Slide());
        return "quanlislide/themslide";
    }

    @PostMapping("/create")
    public String save(@Validated @ModelAttribute("slide") Slide newSlide, BindingResult bindingResult, @RequestParam("file") MultipartFile file, Model model) {
        if (bindingResult.hasErrors()) {
            return "quanlislide/themslide";
        }

        if (!file.isEmpty()) {
            String fileName = file.getOriginalFilename();
            try {
                String uploadsDir = req.getServletContext().getRealPath("/assets/img/slide/");
                Path path = Paths.get(uploadsDir + fileName);
                Files.write(path, file.getBytes());
                newSlide.setAnhdaidien(fileName);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        slideDAO.save(newSlide);
        return "redirect:/quanlislide/listSlide";
    }
}

	
		

