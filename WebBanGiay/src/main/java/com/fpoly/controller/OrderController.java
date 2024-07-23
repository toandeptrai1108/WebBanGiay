package com.fpoly.controller;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import com.fpoly.classes.DonHangClass;
import com.fpoly.dao.ChiTietSanPhamDAO;
import com.fpoly.dao.DiaChiGiaoHangDAO;
import com.fpoly.dao.KhuyenMaiDAO;
import com.fpoly.dao.UserDAO;
import com.fpoly.entity.ChiTietSanPham;
import com.fpoly.entity.DiaChiGiaoHang;
import com.fpoly.entity.KhuyenMai;
import com.fpoly.entity.User;
import com.fpoly.service.DonHangService;
import com.fpoly.service.SessionService;

@Controller
public class OrderController {

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
	DonHangService donHangService;
	@Autowired
	DonHangService doViService;

	@GetMapping("/taithutrangdonhang")
	public String test(Model model) {
		return "userproduct/donhang";
	}

	@GetMapping("/donhang")
	public String moTrangGioHang(Model model, @RequestParam("madiachigiaohangmoi") Optional<Integer> maDiaChiGiaoHang) {
		User user = ss.docDuLieu("user");
		if (user == null) {
			return "redirect:/account/dangnhap";
		}
		// Check DiaChiGiaoHang
		DiaChiGiaoHang diachimacdinh = diachidao.timKiemDiaChiMacDinhCuaUser(user);
		int maDiaChiGiaoHangMoi = 0;
		model.addAttribute("diachimacdinh", diachimacdinh);

		// Khuyến mãi và giá
		List<DonHangClass> donHangClass = donHangService.getList();
		float tienChuaApGiamGia = 0;
		float tienKhuyenMai = 0;
		int maKhuyenMai = 0;
		int soLuongGiay = 0;
		for (DonHangClass item : donHangClass) {
			soLuongGiay += item.getSoluong();
			tienChuaApGiamGia += item.getChiTietSanPham().getGiatien() * item.getSoluong();
			maKhuyenMai = item.getMaKhuyenMai();
			maDiaChiGiaoHangMoi = item.getMaDiaChiGiaoHang();
			// Kiểm tra có Địa chỉ mới không
			if (diachimacdinh.getMadiachigiaohang() != item.getMaDiaChiGiaoHang() && item.getMaDiaChiGiaoHang() != 0) {
				model.addAttribute("diachimacdinh", diachidao.findByMadiachigiaohang(item.getMaDiaChiGiaoHang()));
			}
		}

		// Check maKhuyenMai
		if (maKhuyenMai == -1) {// -1 là đang sai, còn 0 là chưa được áp dụng mã
			model.addAttribute("maKhuyenMai", 0);// -1 lỗi, 0 chưa nhập, khác là đúng mã
			model.addAttribute("loiMaKhuyenMai", "Khuyến mãi không tồn tại hoặc đã hết hạn sử dụng");
		}
		KhuyenMai khuyenmai = khuyenmaidao.findByMakhuyenmai(maKhuyenMai);
		if (khuyenmai != null) {
			tienKhuyenMai = tienChuaApGiamGia - (tienChuaApGiamGia * khuyenmai.getPhantramkhuyenmai() / 100);
			if (tienKhuyenMai > khuyenmai.getSotientoida()) {
				tienKhuyenMai = khuyenmai.getSotientoida();
			}
			model.addAttribute("maKhuyenMai", khuyenmai.getMakhuyenmai());
			model.addAttribute("khuyenMai", khuyenmai);
		}

		// Dữ liệu cần hiển thị
		model.addAttribute("soLuongGiay", soLuongGiay);
		model.addAttribute("dsDonHang", donHangClass);
		model.addAttribute("tienGiam", tienKhuyenMai);
		model.addAttribute("tienDaGiamGia", tienChuaApGiamGia - tienKhuyenMai);
		model.addAttribute("tienChuaApGiamGia", tienChuaApGiamGia);
		return "userproduct/donhang";
	}

	@GetMapping("/add-donhang/{maChiTietSanPham}")
	public String hienThiDonHang(@PathVariable("maChiTietSanPham") int id) {
		ChiTietSanPham chiTietEntity = chiTietSanPhamDAO.findByMachitietsanpham(id);
		List<ChiTietSanPham> listChiTietSanPham = chiTietSanPhamDAO.findAll();
		for (ChiTietSanPham item : listChiTietSanPham) {
			if (item.getMachitietsanpham() == id) {
				donHangService.add(chiTietEntity, 0, null, 0, 0, 0);// Ban đầu không có các giá trị khác nên cho null
																	// hoặc 0
			}
		}
		return "redirect:/donhang";
	}

	@GetMapping("/donhang-increase/{maChiTietSanPham}")
	public String tangSoLuongSanPham(@PathVariable("maChiTietSanPham") int maChiTietSanPham) {
		donHangService.increase(maChiTietSanPham);
		return "redirect:/donhang";
	}

	@GetMapping("/donhang-decrease/{idSP}")
	public String giamSoLuongSanPham(@PathVariable("idSP") int idSP) {
		donHangService.decrease(idSP);
		return "redirect:/donhang";
	}

	// Áp khuyến mãi
	@GetMapping("/apgiamgia")
	public String apMaGiamGia(Model model, @RequestParam("khuyenmai") Optional<Integer> makhuyenmai) {
		boolean checkKhuyenMai = true;
		// Check tồn tại
		KhuyenMai khuyenmai = khuyenmaidao.findByMakhuyenmai(makhuyenmai.orElse(0));
		if (khuyenmai == null) {
			checkKhuyenMai = false;
		}
		// Set KhuyenMai Fail
		if (checkKhuyenMai == false) {
			List<DonHangClass> listDonHang = donHangService.getList();
			for (DonHangClass item : listDonHang) {
				donHangService.update(item.getChiTietSanPham(), item.getChiPhiGiaoHang(), item.getPhuongthucthanhtoan(),
						item.getMaDiaChiGiaoHang(), item.getSoluong(), -1);
			}
			return "redirect:/donhang";
		}
		// Check ngày đặt hàng
		Date ngayNhap = new Date(); // ngày nhập hiện tại
		Date ngayBatDau = khuyenmai.getNgaybatdau(); // ngày bắt đầu của khuyến mãi
		Date ngayKetThuc = khuyenmai.getNgayketthuc(); // ngày kết thúc của khuyến mãi
		if (ngayNhap.before(ngayBatDau) || ngayNhap.after(ngayKetThuc)) {
			checkKhuyenMai = false;
		}

		if (checkKhuyenMai == false) {// Set Fail
			List<DonHangClass> listDonHang = donHangService.getList();
			for (DonHangClass item : listDonHang) {
				donHangService.update(item.getChiTietSanPham(), item.getChiPhiGiaoHang(), item.getPhuongthucthanhtoan(),
						item.getMaDiaChiGiaoHang(), item.getSoluong(), -1);// -1 == sai khuyến mãi
			}
			return "redirect:/donhang";
		} else { // Set True
			List<DonHangClass> listDonHang = donHangService.getList();
			for (DonHangClass item : listDonHang) {
				donHangService.update(item.getChiTietSanPham(), item.getChiPhiGiaoHang(), item.getPhuongthucthanhtoan(),
						item.getMaDiaChiGiaoHang(), item.getSoluong(), makhuyenmai.orElse(0));// Set khuyến mãi nếu đúng
			}
			return "redirect:/donhang";
		}
	}

	// Chọn địa chỉ giao hàng
	@GetMapping("/donhang/hienthidiachigiaohang")
	public String hienThiDiaChiGiaoHang(Model model) {
		User user = ss.docDuLieu("user");
		if (user == null) {
			return "redirect:/account/dangnhap";
		}
		List<DiaChiGiaoHang> list = diachidao.timKiemTatCaDiaChiGiaoHangCuaUser(user);
		model.addAttribute("list", list);
		return "userproduct/diachigiaohang";
	}

	@GetMapping("/donhang/chondiachigiaohang/{madiachigiaohang}")
	public String chonDiaChiGiaoHang(Model model, @PathVariable("madiachigiaohang") int madiachigiaohang) {
		DiaChiGiaoHang diachigiaohang = diachidao.findByMadiachigiaohang(madiachigiaohang);

		List<DonHangClass> donHangClass = donHangService.getList();
		for (DonHangClass item : donHangClass) {
			item.setMaDiaChiGiaoHang(madiachigiaohang);
		}
		// model.addAttribute("madiachigiaohangmoi", diachigiaohang);
		return "redirect:/donhang?madiachigiaohangmoi=" + madiachigiaohang;
	}
	// Kết thúc chọn địa chỉ giao hàng

}
