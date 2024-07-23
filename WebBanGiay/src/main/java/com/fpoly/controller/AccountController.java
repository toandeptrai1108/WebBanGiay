package com.fpoly.controller;

import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.dao.SanPhamDAO;
import com.fpoly.dao.UserDAO;
import com.fpoly.entity.OtpRequest;
import com.fpoly.entity.SanPham;
import com.fpoly.entity.User;
import com.fpoly.service.EmailService;
import com.fpoly.service.SessionService;

import demo.classes.MailInfo;
import jakarta.mail.Session;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/account")
public class AccountController {

	@GetMapping("dangky")
	public String moTrangDangKy() {
		return "dangky";
	}

	@GetMapping("dangnhap")
	public String moTrangDangNhap() {
		return "dangnhap";
	}

	@Autowired
	SessionService ss;

	@Autowired
	UserDAO userDao;

	@PostMapping("/dangnhap")
	public String submitForm(@RequestParam("username") String username, @RequestParam("password") String password,
			Model model, HttpSession session) {
		// Tìm kiếm người dùng trong cơ sở dữ liệu dựa trên tên người dùng
		User user = userDao.findByTenTaiKhoan(username);

		if (user != null) {
			// Kiểm tra mật khẩu
			if (user.getPassword().equals(password)) {
				session.setAttribute("user", user); // Lưu thông tin người dùng vào session
				if (user.isRole()) {
					// Nếu là admin, chuyển hướng đến trang quản lý admin
					return "redirect:/thongke/dashboard";
				} else {
					// Nếu không phải admin, chuyển hướng đến trang chủ
					System.out.println(username);
					return "redirect:/index";
				}
			} else {
				// Nếu mật khẩu không đúng, hiển thị thông báo lỗi
				model.addAttribute("message1", "Mật khẩu không đúng");
				return "dangnhap";
			}
		} else {
			// Nếu không tìm thấy người dùng, hiển thị thông báo lỗi
			model.addAttribute("message", "Tài khoản không tồn tại");
			return "dangnhap";
		}
	}

	@GetMapping("/dangxuat")
	public String logout(HttpSession session) {
		// Invalidate the session
		ss.xoaDuLieu("user");
		// Redirect to login page
		return "redirect:/index";
	}

	@PostMapping("/dangky")
	public String submitForm(
	        @RequestParam("username") String username, @RequestParam("fullname") String fullname,
	        @RequestParam("password") String password, @RequestParam("email") String email,
	        @RequestParam("phonenumber") String phonenumber, @RequestParam("gender") boolean gender, 
	        Model model, HttpSession session) {

	    boolean check = true;
	    if (username.isEmpty() || fullname.isEmpty() || password.isEmpty() || email.isEmpty() || phonenumber.isEmpty()) {
	        model.addAttribute("message", "Vui lòng nhập đầy đủ thông tin");
	        model.addAttribute("success", false);
	        return "dangky";
	    }

	    User existingUser = userDao.findByTenTaiKhoan(username);
	    if (existingUser != null) {
	        model.addAttribute("messageName", "Tài khoản đã tồn tại");
	        check = false;
	    }

	    existingUser = userDao.findByEmail(email);
	    if (existingUser != null) {
	        model.addAttribute("messageEmail", "Email đã tồn tại");
	        check = false;
	    }

	    if (!phonenumber.matches("^0\\d{9}$")) {
	        model.addAttribute("messagePhone", "Số điện thoại không hợp lệ. Số điện thoại phải có 10 chữ số và bắt đầu bằng số 0");
	        check = false;
	    }

	    if (!password.matches("^.{8,}$")) {
	        model.addAttribute("messagePass", "Password phải có ít nhất 8 kí tự.");
	        check = false;
	    }

	    if (check) {
	        try {
	            User newUser = new User();
	            newUser.setUsername(username);
	            newUser.setTen(fullname);
	            newUser.setPassword(password);
	            newUser.setEmail(email);
	            newUser.setSodienthoai(phonenumber);
	            newUser.setGioitinh(gender);

	            userDao.save(newUser);
	            User user = userDao.findByTenTaiKhoan(username);
	            session.setAttribute("user", user); // Lưu thông tin người dùng vào session
	            model.addAttribute("message1", "Đã đăng ký thành công");
	            model.addAttribute("success", true);

	            String htmlContent = "<!DOCTYPE html>\r\n" + "<html lang=\"en\">\r\n" + "<head>\r\n" + "    <meta charset=\"UTF-8\">\r\n"
	                    + "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n"
	                    + "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n"
	                    + "    <title>Chúc mừng bạn đến với HK2T</title>\r\n" + "    <style>\r\n" + "        body {\r\n"
	                    + "            font-family: Arial, sans-serif;\r\n" + "            margin: 0;\r\n"
	                    + "            padding: 0;\r\n" + "            background-color: #f4f4f4;\r\n" + "        }\r\n"
	                    + "        .container {\r\n" + "            max-width: 600px;\r\n"
	                    + "            margin: 20px auto;\r\n" + "            padding: 20px;\r\n"
	                    + "            background-color: #fff;\r\n" + "            border-radius: 8px;\r\n"
	                    + "            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\r\n" + "        }\r\n" + "        h1 {\r\n"
	                    + "            color: #333;\r\n" + "            text-align: center;\r\n" + "        }\r\n"
	                    + "        p {\r\n" + "            color: #666;\r\n" + "            font-size: 16px;\r\n"
	                    + "            line-height: 1.6;\r\n" + "            margin-bottom: 20px;\r\n" + "        }\r\n"
	                    + "        .btn {\r\n" + "            display: inline-block;\r\n" + "            padding: 10px 20px;\r\n"
	                    + "            background-color: #33CCFF;\r\n" + "            color: #000000;\r\n"
	                    + "            text-decoration: none;\r\n" + "            border-radius: 5px;\r\n"
	                    + "            border: 1px solid #000000;\r\n" + "        }\r\n" + "        .btn:hover {\r\n"
	                    + "            background-color: #f4f4f4;\r\n" + "            color: #000000;\r\n" + "        }\r\n"
	                    + "    </style>\r\n" + "</head>\r\n" + "<body>\r\n" + "    <div class=\"container\">\r\n"
	                    + "        <h4> Chào mừng đến với <span class=\"text-success\">HK2T</span></h4>\r\n"
	                    + "        <p>Bạn đã trở thành thành viên của HK2T. Chúng tôi rất vui mừng khi chào đón bạn.</p>\r\n"
	                    + "<p>Nếu bạn có bất kỳ câu hỏi nào, đừng ngần ngại liên hệ với chúng tôi qua email: <a href=\"mailto:your@email.com\">khoatdpc07807@fpt.edu.vn</a></p>\r\n"
	                    + "        <p>Nếu bạn có bất kỳ câu hỏi hoặc yêu cầu nào, đừng ngần ngại liên hệ với chúng tôi.</p>\r\n"
	                    + "		   <p><a href=\"http://localhost:8080/account/dangnhap\" class=\"btn\">Truy cập tài khoản</a></p>\r\n"
	                    + "        <p>Xin chân thành cảm ơn,</p>\r\n" + "        <p>Đội ngũ của HK2T</p>\r\n"
	                    + "    </div>\r\n" + "</body>\r\n" + "</html>";

	            emailService.send(new MailInfo(email, "Chào mừng bạn đến với HK2T", htmlContent));
	        } catch (Exception e) {
	            model.addAttribute("message", "Đã xảy ra lỗi, vui lòng thử lại");
	            model.addAttribute("success", false);
	        }
	    } else {
	        model.addAttribute("success", false);
	    }
	    return "dangky";
	}

	@RequestMapping("index")
	public String moIndex(){
		return "/index";
	}
	
	@Autowired
	SanPhamDAO spDao;
	
	@GetMapping("/index")
	public String index(Model model) {
	    List<SanPham> topSellingProducts = spDao.findTop6BestSellingProducts();
	    model.addAttribute("topSellingProducts", topSellingProducts);
	    return "index";
	}

	// Quên mật khẩu
	@GetMapping("quenmatkhau")
	public String hienThiFormQuenMatKhau() {
		return "/quenmatkhau/quenmatkhau";
	}

	@Autowired
	UserDAO usersDao;

	@Autowired
	EmailService emailService;

	@Autowired
	JavaMailSender mailSender;

	@SuppressWarnings("unused")
	@PostMapping("/quenmatkhau")
	public String kiemTraEmailVaGuiMaXacNhan(Model model, @RequestParam("email") String email, HttpSession session) {
		if (email == null || email.trim().isEmpty()) {
			model.addAttribute("loiEmail", "Email không được bỏ trống!");
			return "quenmatkhau";
		}

		User user = userDao.findByEmail(email);
		if (user == null) {
			model.addAttribute("loiEmail", "Email chưa được đăng ký!");
			return "quenmatkhau";
		}

		Random random = new Random();
		int codeInt = 100000 + random.nextInt(900000);
		String code = String.valueOf(codeInt);

		session.setAttribute("email", email);
		session.setAttribute("verificationCode", code);
		String htmlContent = "<!DOCTYPE html>\r\n" + "<html lang=\"en\">\r\n" + "<head>\r\n"
				+ "    <meta charset=\"UTF-8\">\r\n"
				+ "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n"
				+ "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n"
				+ "    <title>Đặt lại mật khẩu</title>\r\n" + "    <style>\r\n" + "        body {\r\n"
				+ "            font-family: Arial, sans-serif;\r\n" + "            margin: 0;\r\n"
				+ "            padding: 0;\r\n" + "            background-color: #f4f4f4;\r\n" + "        }\r\n"
				+ "        .container {\r\n" + "            max-width: 600px;\r\n"
				+ "            margin: 20px auto;\r\n" + "            padding: 20px;\r\n"
				+ "            background-color: #fff;\r\n" + "            border-radius: 8px;\r\n"
				+ "            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\r\n" + "        }\r\n" + "        h1 {\r\n"
				+ "            color: #333;\r\n" + "            text-align: center;\r\n" + "        }\r\n"
				+ "        p {\r\n" + "            color: #666;\r\n" + "            font-size: 16px;\r\n"
				+ "            line-height: 1.6;\r\n" + "            margin-bottom: 20px;\r\n" + "        }\r\n"
				+ "        .btn {\r\n" + "            display: inline-block;\r\n"
				+ "            padding: 10px 20px;\r\n" + "            background-color: #f4f4f4;\r\n"
				+ "            color: #000000;\r\n" + "            text-decoration: none;\r\n"
				+ "            border-radius: 5px;\r\n" + "            border: 1px solid #000000;\r\n" + "        }\r\n"
				+ "        .button-like {\r\n" + "            display: inline-block;\r\n"
				+ "            padding: 10px 20px;\r\n" + "            font-size: 16px;\r\n"
				+ "            color: white;\r\n" + "            background-color: #007BFF; /* Màu nền xanh lam */\r\n"
				+ "            border: none;\r\n" + "            border-radius: 5px;\r\n"
				+ "            text-align: center;\r\n" + "            text-decoration: none;\r\n"
				+ "            cursor: pointer;\r\n" + "            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\r\n"
				+ "            transition: background-color 0.3s ease;\r\n" + "        }\r\n"
				+ "        .button-like:hover {\r\n"
				+ "            background-color: #0056b3; /* Màu nền khi hover */\r\n" + "        }\r\n"
				+ "    </style>\r\n" + "</head>\r\n" + "<body>\r\n" + "    <div class=\"container\">\r\n"
				+ "        <h1>Đặt lại mật khẩu</h1>\r\n"
				+ "        <p>Vui lòng không chia mã xác nhận ra bên ngoài</p>\r\n"
				+ "        <p>Nếu bạn không yêu cầu đặt lại mật khẩu, vui lòng bỏ qua email này.</p>\r\n"
				+ "<p>Mã xác nhận của bạn là: </p>\r\n" + "        <p class=\"button-like\"> " + code + "</p>\r\n"
				+ "        <p>Xin cảm ơn,</p>\r\n" + "        <p>Đội ngũ của chúng tôi</p>\r\n" + "    </div>\r\n"
				+ "</body>\r\n" + "</html>";

		emailService.send(new MailInfo(email, "Đặt lại mật khẩu", htmlContent));

		return "nhapma";
	}

	@RequestMapping("/doimatkhau")
	public String doiMatKhau(Model model) {
		User user = ss.docDuLieu("user");
		System.out.println(user.getUsername() + "abc");
		model.addAttribute("username", user.getUsername());
		return "doimatkhau";

	}

	@PostMapping("/doimatkhau")
	public String submitForm(@RequestParam("oldPassword") String oldPassword,
			@RequestParam("newPassword") String newPassword, @RequestParam("confirmNewPassword") String confirmPassword,
			Model model) {
		// Lấy thông tin người dùng từ cơ sở dữ liệu
		User user = ss.docDuLieu("user");
		System.out.println(user.getUsername() + "abc");
		model.addAttribute("username", user.getUsername());
		// Kiểm tra xem mật khẩu mới và xác nhận mật khẩu có khớp nhau không
		// Kiểm tra mật khẩu cũ
		String storedPassword = user.getPassword();
		if (!storedPassword.equals(oldPassword)) {
			model.addAttribute("error", "Mật khẩu cũ không đúng");
			return "doimatkhau";
		}
		if (storedPassword.equals(newPassword)) {
			model.addAttribute("errorNew", "Mật khẩu mới không được trùng mật khẩu cũ");
			return "doimatkhau";
		}
		// Cập nhật mật khẩu mới trong cơ sở dữ liệu
		user.setPassword(newPassword);
		userDao.save(user);

		model.addAttribute("message", "Mật khẩu đã được cập nhật thành công");
		return "doimatkhau"; // Chuyển đến trang đăng nhập hoặc trang chính sau khi cập nhật mật khẩu thành
								// công
	}
	
	
	@PostMapping("/doimatkhau1")
	public String doiMatKhau(Model model, @RequestParam("password") String password, HttpSession session) {
		String email = (String) session.getAttribute("email");
		if (email == null) {
			return "redirect:/quenmatkhau";
		}

		User user = userDao.findByEmail(email);
		user.setPassword(password); // Remember to encode the password using a PasswordEncoder
		userDao.save(user);
		session.setAttribute("user", user); // Lưu thông tin người dùng vào session
		return "doimatkhau1";
	}

	@PostMapping("/nhapma")
	public String NhapMa(Model model, @RequestParam("code") String code, HttpSession session) {
		String storedCode = (String) session.getAttribute("verificationCode");
		boolean check = true;
		System.out.println(storedCode);
		if (code == null || code.trim().isEmpty()) {
			model.addAttribute("loiMa", "Mã xác nhận không được bỏ trống!");
			return "nhapma";
		}
		if (!storedCode.equals(code)) {
			model.addAttribute("loiMa", "Mã xác nhận không chính xác!");
			return "nhapma";
		} else {
			// Xác nhận mã thành công, tiến hành đổi mật khẩu ở đây
			// Nếu đổi mật khẩu thành công, chuyển hướng đến trang đăng nhập
			// Nếu không, bạn có thể xử lý bằng cách thêm thông báo lỗi và trở lại trang đổi
			// mật khẩu

			return "doimatkhau1";
		}
	}
}