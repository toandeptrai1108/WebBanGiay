package com.fpoly.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.fpoly.classes.DonHangClass;
import com.fpoly.dao.ChiTietDonHangDAO;
import com.fpoly.dao.ChiTietSanPhamDAO;
import com.fpoly.dao.DiaChiGiaoHangDAO;
import com.fpoly.dao.DonHangDAO;
import com.fpoly.dao.KhuyenMaiDAO;
import com.fpoly.dao.ThanhToanDAO;
import com.fpoly.dao.UserDAO;
import com.fpoly.entity.ChiTietDonHang;
import com.fpoly.entity.DiaChiGiaoHang;
import com.fpoly.entity.DonHang;
import com.fpoly.entity.KhuyenMai;
import com.fpoly.entity.ThanhToan;
import com.fpoly.entity.User;
import com.fpoly.service.DonHangService;
import com.fpoly.service.EmailService;
import com.fpoly.service.SessionService;

import demo.classes.MailInfo;

@Controller
@RequestMapping("thanhtoan")
public class PaymentController {
	@Autowired
	SessionService ss;
	@Autowired
	ChiTietSanPhamDAO chiTietSanPhamDAO;
	@Autowired
	UserDAO userdao;
	@Autowired
	DiaChiGiaoHangDAO diachidao;
	@Autowired
	KhuyenMaiDAO khuyenmaidao;
	@Autowired
	DonHangDAO donhangdao;
	@Autowired
	ChiTietDonHangDAO chitietdonhangdao;
	@Autowired
	ThanhToanDAO thanhtoandao;

	@Autowired
	DonHangService donHangService;

	@Autowired
	EmailService emailService;

	@Autowired
	JavaMailSender mailSender;

	@GetMapping("")
	public String thanhToan(Model model, @RequestParam("phuongthucthanhtoanstring") String phuongThucThanhToan,
			@RequestParam("chiPhiVanChuyen") float chiPhiVanChuyen,
			RedirectAttributes redirectAttributes) {
		User user = ss.docDuLieu("user");
		if (user == null) {
			return "redirect:/account/dangnhap";
		}
		// Kiểm tra thông tin
		List<DonHangClass> listDonHangClass = donHangService.getList();
		String thanhtoan = phuongThucThanhToan;
		float chiPhiGiaoHang = chiPhiVanChuyen;
		for (DonHangClass item : listDonHangClass) {
			item.setChiPhiGiaoHang(chiPhiGiaoHang);
		}
		boolean kiemTraDonHang = true;
		if (thanhtoan.equals("null")) {
			kiemTraDonHang = false;
		}
		if (kiemTraDonHang == false) {
			return "redirect:/donhang";
		}
		String phuongThucThanhToanString = "";
		// Thanh toán khi nhận hàng
		if (thanhtoan.equals("thanhtoankhinhanhang")) {
			// Set phương thức thanh toán cho DonHangClass
			phuongThucThanhToanString = "Thanh toán khi nhận hàng";
			List<DonHangClass> listDonHang = donHangService.getList();
			for (DonHangClass item : listDonHang) {
				donHangService.update(item.getChiTietSanPham(), chiPhiGiaoHang, phuongThucThanhToanString,
						item.getMaDiaChiGiaoHang(), item.getSoluong(), item.getMaKhuyenMai());
			}
			// Set thông tin cho đơn hàng
			List<DonHangClass> donHang = donHangService.getList();
			int magiamgia = 0;
			int tongsosanpham = 0;
			float tonggiamgia = 0;
			float tongtien = 0;
			DiaChiGiaoHang diaChiGiaoHang = new DiaChiGiaoHang();
			for (DonHangClass item : donHang) {
				magiamgia = item.getMaKhuyenMai();
				diaChiGiaoHang = diachidao.findByMadiachigiaohang(item.getMaDiaChiGiaoHang());
				tongsosanpham += item.getSoluong();
				tongtien += item.getChiTietSanPham().getGiatien() * item.getSoluong();
			}
			KhuyenMai khuyenMai = khuyenmaidao.findByMakhuyenmai(magiamgia);
			if (khuyenMai != null) {
				tonggiamgia = tongtien - (tongtien * khuyenMai.getPhantramkhuyenmai() / 100);
				if (tonggiamgia > khuyenMai.getSotientoida()) {
					tonggiamgia = khuyenMai.getSotientoida();
				}
			}
			// Thêm đơn hàng mới
			DonHang donhangmoi = new DonHang();
			donhangmoi.setUser(user);
			donhangmoi.setTrangthaidonhang(0);// Chờ xác nhận đơn hàng
			donhangmoi.setTrangthaivanchuyen(0);// Chờ xác nhận đơn hàng
			donhangmoi.setGhichu("");
			donhangmoi.setNgaydathang(new Date());
			donhangmoi.setTongsosanpham(tongsosanpham);
			donhangmoi.setTonggiamgia(tonggiamgia);
			donhangmoi.setTongtien(tongtien - tonggiamgia + chiPhiGiaoHang);
			donhangmoi.setTrangthaidanhgia(false);
			donhangmoi.setDiachigiaohang(diaChiGiaoHang);
			donhangdao.save(donhangmoi);

			// Thêm chi tiết đơn hàng
			// User user = userdao.timKiemNguoiDungBangID(4);// Tìm kiếm user
			List<DonHang> listDonHangMoi = donhangdao.findByUser(user);// Tìm kiếm đơn hàng của user

			DonHang donhangmax = listDonHangMoi.get(0);// Lấy đơn hàng đầu tiền
			List<DonHangClass> listChiTietDonHang = donHangService.getList();
			for (DonHangClass item : new ArrayList<>(listChiTietDonHang)) {
				// Thêm chi tiết đơn hàng
				ChiTietDonHang chitietdonhangEntity = new ChiTietDonHang();
				chitietdonhangEntity.setDonhang(donhangmax);
				chitietdonhangEntity.setChitietsanpham(item.getChiTietSanPham());
				chitietdonhangEntity.setGia(item.getChiTietSanPham().getGiatien());
				chitietdonhangEntity.setSoluong(item.getSoluong());
				chitietdonhangEntity.setTongtien(item.getChiTietSanPham().getGiatien() * item.getSoluong());
				chitietdonhangdao.save(chitietdonhangEntity);
				// Xóa chi tiết đơn hàng
				donHangService.remove(item.getChiTietSanPham().getMachitietsanpham());
			}
			// Gửi mai
			String htmlContent = "<!DOCTYPE html>\r\n" + "<html lang=\"en\">\r\n" + "<head>\r\n"
					+ "    <meta charset=\"UTF-8\">\r\n"
					+ "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n"
					+ "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n"
					+ "    <title>Đặt hàng thành công</title>\r\n" + "    <style>\r\n" + "        body {\r\n"
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
					+ "            padding: 10px 20px;\r\n" + "            background-color: #33CCFF;\r\n"
					+ "            color: #000000;\r\n" + "            text-decoration: none;\r\n"
					+ "            border-radius: 5px;\r\n" + "            border: 1px solid #000000;\r\n"
					+ "        }\r\n" + "        .btn:hover {\r\n" + "            background-color: #f4f4f4;\r\n"
					+ "            color: #000000;\r\n" + "        }\r\n" + "    </style>\r\n" + "</head>\r\n"
					+ "<body>\r\n" + "    <div class=\"container\">\r\n"
					+ "        <h4> Đặt hàng thành công tại <span class=\"text-success\">HK2T</span></h4>\r\n"
					+ "        <p>Vui lòng theo dõi lịch sử đơn hàng của bạn</p>\r\n"
					+ "<p>Nếu bạn có bất kỳ câu hỏi nào, đừng ngần ngại liên hệ với chúng tôi qua email: <a href=\"mailto:your@email.com\">khoatdpc07807@fpt.edu.vn</a></p>\r\n"
					+ "        <p>Nếu bạn có bất kỳ câu hỏi hoặc yêu cầu nào, đừng ngần ngại liên hệ với chúng tôi.</p>\r\n"
					+ "		   <p><a href=\"http://localhost:8080/lichsuthanhtoan\" class=\"btn\">Lịch sử đặt hàng</a></p>\r\n"
					+ "        <p>Xin chân thành cảm ơn,</p>\r\n" + "        <p>Đội ngũ của HK2T</p>\r\n"
					+ "    </div>\r\n" + "</body>\r\n" + "</html>";

			emailService.send(new MailInfo(user.getEmail(), "Đặt hàng thành công đơn hàng", htmlContent));
			return "userproduct/thanhtoanthanhcong";
		}

		// Thanh toán VNPay
		if (thanhtoan.equals("thanhtoanvnpay")) {
			// Thêm phương thức thanh toán cho đơn hàng
			phuongThucThanhToanString = "Thanh toán VNPay";
			List<DonHangClass> listDonHang = donHangService.getList();
			for (DonHangClass item : listDonHang) {
				donHangService.update(item.getChiTietSanPham(), item.getChiPhiGiaoHang(), phuongThucThanhToanString,
						item.getMaDiaChiGiaoHang(), item.getSoluong(), item.getMaKhuyenMai());
			}

			// Lấy tổng tiền để thanh toán vnpay
			List<DonHangClass> donHang = donHangService.getList();
			int maGiamGia = 0;
			float tongGiamGia = 0;
			float thanhTien = 0;
			for (DonHangClass item : donHang) {
				maGiamGia = item.getMaKhuyenMai();
				;
				thanhTien += item.getChiTietSanPham().getGiatien() * item.getSoluong();
			}
			KhuyenMai khuyenMai = khuyenmaidao.findByMakhuyenmai(maGiamGia);
			if (khuyenMai != null) {
				tongGiamGia = thanhTien - (thanhTien * khuyenMai.getPhantramkhuyenmai() / 100);
				if (tongGiamGia > khuyenMai.getSotientoida()) {
					tongGiamGia = khuyenMai.getSotientoida();
				}
			}
			float tienCanThanhToan = thanhTien - tongGiamGia + chiPhiGiaoHang;
			model.addAttribute("tongTienCanThanhToan", tienCanThanhToan);
			return "payment/vnpay_pay";
		}
		return "userproduct/donhang";
	}

	@GetMapping("/thanhtoanvnpaythanhcong")
	public String thanhToanThanhCong() {
		// User user = userdao.timKiemNguoiDungBangID(4);
		User user = ss.docDuLieu("user");
		if (user == null) {
			return "redirect:/account/dangnhap";
		}

		// Set đơn hàng
		List<DonHangClass> donHang = donHangService.getList();
		int magiamgia = 0;
		int maDiaChiGiaoHang = 0;
		int tongsosanpham = 0;
		float tonggiamgia = 0;
		float tongtien = 0;
		float chiPhiGiaoHang = 0;// Thay đổi thành chi phí giao hàng

		// Use a foreach loop to avoid ConcurrentModificationException
		for (DonHangClass item : new ArrayList<>(donHang)) {
			magiamgia = item.getMaKhuyenMai();
			chiPhiGiaoHang = item.getChiPhiGiaoHang();
			maDiaChiGiaoHang = item.getMaDiaChiGiaoHang();
			tongsosanpham += item.getSoluong();
			tongtien += item.getChiTietSanPham().getGiatien() * item.getSoluong();
		}

		KhuyenMai khuyenMai = khuyenmaidao.findByMakhuyenmai(magiamgia);
		if (khuyenMai != null) {
			tonggiamgia = tongtien - (tongtien * khuyenMai.getPhantramkhuyenmai() / 100);
			if (tonggiamgia > khuyenMai.getSotientoida()) {
				tonggiamgia = khuyenMai.getSotientoida();
			}
		}

		// Thêm đơn hàng mới
		DonHang donhangmoi = new DonHang();
		donhangmoi.setUser(user);
		donhangmoi.setTrangthaidonhang(3);// Đã thanh toán
		donhangmoi.setTrangthaivanchuyen(0);// Đang chờ xác nhận đơn hàng
		donhangmoi.setGhichu("");
		donhangmoi.setNgaydathang(new Date());
		// donhangmoi.setChitietdonhang(chiPhiGiaoHang);
		donhangmoi.setTongsosanpham(tongsosanpham);
		donhangmoi.setTonggiamgia(tonggiamgia);
		donhangmoi.setTongtien(tongtien - tonggiamgia + chiPhiGiaoHang);
		donhangmoi.setDiachigiaohang(diachidao.findByMadiachigiaohang(maDiaChiGiaoHang));
		donhangmoi.setTrangthaidanhgia(false);
		donhangdao.save(donhangmoi);

		// Thêm chi tiết đơn hàng
		List<DonHang> listDonHangMoi = donhangdao.findByUser(user);
		DonHang donHangMaxCuaNguoiDung = listDonHangMoi.get(0);// Lấy đơn hàng đầu tiền
		List<DonHangClass> listChiTietDonHang = donHangService.getList();
		int soLuongSanPham = 0;
		for (DonHangClass item : new ArrayList<>(listChiTietDonHang)) {
			ChiTietDonHang chitietdonhangEntity = new ChiTietDonHang();
			chitietdonhangEntity.setDonhang(donHangMaxCuaNguoiDung);
			chitietdonhangEntity.setChitietsanpham(item.getChiTietSanPham());
			chitietdonhangEntity.setGia(item.getChiTietSanPham().getGiatien());
			chitietdonhangEntity.setSoluong(item.getSoluong());
			chitietdonhangEntity.setTongtien(item.getChiTietSanPham().getGiatien() * item.getSoluong());
			chitietdonhangdao.save(chitietdonhangEntity);
			soLuongSanPham += item.getSoluong();
		}

		// Xóa DonHangClass
		for (DonHangClass item : new ArrayList<>(listChiTietDonHang)) {
			donHangService.remove(item.getChiTietSanPham().getMachitietsanpham());// Xóa DonHangClass
		}

		// Thêm thanh toán
		ThanhToan thanhToan = new ThanhToan();
		thanhToan.setUser(user);
		thanhToan.setDonhang(donHangMaxCuaNguoiDung);
		thanhToan.setPhuongthucthanhtoan("Thanh toán bằng VNPay");
		thanhToan.setTongtien(donHangMaxCuaNguoiDung.getTongtien());
		thanhtoandao.save(thanhToan);
		// Gửi mai
		String htmlContent = "<!DOCTYPE html>\r\n" + "<html lang=\"en\">\r\n" + "<head>\r\n"
				+ "    <meta charset=\"UTF-8\">\r\n"
				+ "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n"
				+ "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n"
				+ "    <title>Thanh toán thành công đơn hàng</title>\r\n" + "    <style>\r\n" + "        body {\r\n"
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
				+ "            padding: 10px 20px;\r\n" + "            background-color: #33CCFF;\r\n"
				+ "            color: #000000;\r\n" + "            text-decoration: none;\r\n"
				+ "            border-radius: 5px;\r\n" + "            border: 1px solid #000000;\r\n" + "        }\r\n"
				+ "        .btn:hover {\r\n" + "            background-color: #f4f4f4;\r\n"
				+ "            color: #000000;\r\n" + "        }\r\n" + "    </style>\r\n" + "</head>\r\n"
				+ "<body>\r\n" + "    <div class=\"container\">\r\n" + "        <h4> Thanh toán thành công đơn hàng "
				+ donHangMaxCuaNguoiDung.getTongtien() + "VND tại <span class=\"text-success\">HK2T</span></h4>\r\n"
				+ "        <p>" + soLuongSanPham + " sản phẩm</p>\r\n"
				+ "<p>Nếu bạn có bất kỳ câu hỏi nào, đừng ngần ngại liên hệ với chúng tôi qua email: <a href=\"mailto:your@email.com\">khoatdpc07807@fpt.edu.vn</a></p>\r\n"
				+ "        <p>Nếu bạn có bất kỳ câu hỏi hoặc yêu cầu nào, đừng ngần ngại liên hệ với chúng tôi.</p>\r\n"
				+ "		   <p><a href=\"http://localhost:8080/lichsuthanhtoan\" class=\"btn\">Lịch sử đặt hàng</a></p>\r\n"
				+ "        <p>Xin chân thành cảm ơn,</p>\r\n" + "        <p>Đội ngũ của HK2T</p>\r\n" + "    </div>\r\n"
				+ "</body>\r\n" + "</html>";

		emailService.send(new MailInfo(user.getEmail(), "Thanh toán thành công đơn hàng", htmlContent));
		return "userproduct/thanhtoanthanhcong";
	}
}
