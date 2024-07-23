package com.fpoly.controller;

import java.io.File;
import java.io.IOException;
import java.net.http.HttpRequest;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFClientAnchor;
import org.apache.poi.xssf.usermodel.XSSFDrawing;
import org.apache.poi.xssf.usermodel.XSSFPicture;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.classes.ReportDTO;
import com.fpoly.dao.DanhGiaDAO;
import com.fpoly.dao.DonHangDAO;
import com.fpoly.dao.ReportDAO;
import com.fpoly.dao.SanPhamDAO;
import com.fpoly.entity.ChiTietDonHang;
import com.fpoly.entity.DanhGia;
import com.fpoly.entity.DonHang;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFDrawing;
import org.apache.poi.xssf.usermodel.XSSFClientAnchor;
import org.apache.poi.xssf.usermodel.XSSFPicture;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

@Controller
@RequestMapping("thongke")
public class ReportController {

	@Autowired
	DonHangDAO donHangDAO;
	@Autowired
	DanhGiaDAO danhGiaDAO;
	@Autowired
	ReportDAO reportDAO;

	@Autowired
	HttpServletRequest req;

	@GetMapping("/dashboard")
	public String moFormThongKe(Model model, @RequestParam("ngayBatDau") Optional<String> ngayBatDauParam,
			@RequestParam("ngayKetThuc") Optional<String> ngayKetThucParam) {
		// Set dashboard
		List<DonHang> listDonHangTong = donHangDAO.findAll();
		int tongDonHang = 0;
		int tongSoLuongBanRa = 0;
		float tongDoanhThu = 0;
		int tongDanhGia = 0;
		for (DonHang item : listDonHangTong) {
			tongDonHang += 1;
			tongDoanhThu += item.getTongtien();
			List<ChiTietDonHang> listChiTietDonHangTong = item.getChitietdonhang();
			for (ChiTietDonHang item2 : listChiTietDonHangTong) {
				tongSoLuongBanRa += item2.getSoluong();
			}
		}
		List<DanhGia> listDanhGia = danhGiaDAO.findAll();
		for (DanhGia item : listDanhGia) {
			tongDanhGia += 1;
		}
		model.addAttribute("tongDonHang", tongDonHang);
		model.addAttribute("tongSoLuongBanRa", tongSoLuongBanRa);
		model.addAttribute("tongDoanhThu", tongDoanhThu);
		model.addAttribute("tongDanhGia", tongDanhGia);
		model.addAttribute("tongDanhGia", tongDanhGia);

		// Set Table
		Date ngayBatDau = ngayBatDauParam.map(value -> {
			LocalDate localDate = LocalDate.parse(value);
			ZonedDateTime zonedDateTime = localDate.atStartOfDay(ZoneId.systemDefault());
			Instant instant = zonedDateTime.toInstant();
			return Date.from(instant);
		}).orElse(null);
		Date ngayKetThuc = ngayKetThucParam.map(value -> {
			LocalDate localDate = LocalDate.parse(value);
			ZonedDateTime zonedDateTime = localDate.atStartOfDay(ZoneId.systemDefault());
			Instant instant = zonedDateTime.toInstant();
			return Date.from(instant);
		}).orElse(null);
		// System.out.println(ngayBatDau + " - " + ngayKetThuc);
		// Wed May 01 00:00:00 ICT 2024 - Sun Jun 16 00:00:00 ICT 2024
		// Check Date
		boolean checkNgay = true;
		String loiNgayBatDau1 = "";// Không được bỏ trống
		String loiNgayBatDau2 = "";// Không được lớn hơn ngày kết thúc
		String loiNgayBatDau3 = "";// Không được lớn hơn ngày hiện tại
		String loiNgayKetThuc1 = "";// Không được lớn hơn ngày hiện tại
		String loiNgayKetThuc2 = "";// Không được nhỏ hơn ngày bắt đầu
//		if (ngayBatDau == null) {
//			// throw exception or return error message: "Ngày bắt đầu không được bỏ trống"
//			loiNgayBatDau1 = "Vui lòng chọn ngày bắt đầu";
//			checkNgay = false;
//		}
//		if (ngayBatDau != null && ngayKetThuc != null && ngayBatDau.after(ngayKetThuc)) {
//			// throw exception or return error message: "Ngày bắt đầu không được lớn hơn
//			// ngày kết thúc"
//			loiNgayBatDau2 = "Ngày bắt đầu không được lớn hơn ngày kết thúc";
//			checkNgay = false;
//		}
//		if (ngayBatDau != null && ngayBatDau.after(new Date())) {
//			// throw exception or return error message: "Ngày bắt đầu không được lớn hơn
//			// ngày hiện tại"
//			loiNgayBatDau3 = "Ngày bắt đầu không được lớn hơn ngày hiện tại";
//			checkNgay = false;
//		}
//		if (ngayKetThuc != null && ngayKetThuc.after(new Date())) {
//			// throw exception or return error message: "Ngày kết thúc không được lớn hơn
//			// ngày hiện tại"
//			loiNgayKetThuc1 = "Ngày kết thúc không được lớn hơn ngày hiện tại";
//			checkNgay = false;
//		}
//		if (ngayKetThuc != null && ngayKetThuc.before(new Date())) {
//			// throw exception or return error message: "Ngày kết thúc không được nhỏ hơn
//			// ngày hiện tại"
//			loiNgayKetThuc2 = "Ngày kết thúc không được nhỏ hơn ngày hiện tại";
//			checkNgay = false;
//		}
		if (checkNgay) {
			List<ReportDTO> listThongKeDoanhThuSanPhams = reportDAO.thongKeDoanhThuTheoSanPham(ngayBatDau, ngayKetThuc);
			model.addAttribute("ngayBatDau", ngayBatDauParam.orElse(""));
			model.addAttribute("ngayKetThuc", ngayKetThucParam.orElse(""));
			model.addAttribute("listDonHangTheoNgay", listThongKeDoanhThuSanPhams);
		}
		return "admin/dashboard";
	}

//	@GetMapping("/exportExcel")
//	public void exportExcel(@RequestParam("ngayBatDau") Optional<String> ngayBatDauParam,
//			@RequestParam("ngayKetThuc") Optional<String> ngayKetThucParam, HttpServletResponse response)
//			throws IOException {
//		// Set dashboard
//		Date ngayBatDau = ngayBatDauParam.map(value -> {
//			LocalDate localDate = LocalDate.parse(value);
//			ZonedDateTime zonedDateTime = localDate.atStartOfDay(ZoneId.systemDefault());
//			Instant instant = zonedDateTime.toInstant();
//			return Date.from(instant);
//		}).orElse(null);
//		Date ngayKetThuc = ngayKetThucParam.map(value -> {
//			LocalDate localDate = LocalDate.parse(value);
//			ZonedDateTime zonedDateTime = localDate.atStartOfDay(ZoneId.systemDefault());
//			Instant instant = zonedDateTime.toInstant();
//			return Date.from(instant);
//		}).orElse(null);
//
//		List<ReportDTO> listThongKeDoanhThuSanPhams = reportDAO.thongKeDoanhThuTheoSanPham(ngayBatDau, ngayKetThuc);
//
//		// Create Excel file
//		XSSFWorkbook workbook = new XSSFWorkbook();
//		XSSFSheet sheet = workbook.createSheet("Thống kê doanh thu theo sản phẩm");
//
//		// Set header
//		XSSFRow headerRow = sheet.createRow(0);
//		headerRow.createCell(0).setCellValue("STT");
//		headerRow.createCell(1).setCellValue("Sản phẩm");
//		headerRow.createCell(2).setCellValue("Tên sản phẩm");
//		headerRow.createCell(3).setCellValue("Danh mục");
//		headerRow.createCell(4).setCellValue("Hãng");
//		headerRow.createCell(5).setCellValue("Số lượng bán");
//		headerRow.createCell(6).setCellValue("Doanh thu");
//
//		// Set data
//		int rowIndex = 1;
//		for (ReportDTO item : listThongKeDoanhThuSanPhams) {
//			XSSFRow row = sheet.createRow(rowIndex);
//			row.createCell(0).setCellValue(rowIndex);
//			row.createCell(1).setCellValue(item.getSanpham().getTensanpham());
//			row.createCell(2).setCellValue(item.getSanpham().getTensanpham());
//			row.createCell(3).setCellValue(item.getSanpham().getDanhmuc().getTendanhmuc());
//			row.createCell(4).setCellValue(item.getSanpham().getHang().getTenhang());
//			row.createCell(5).setCellValue(item.getSoluong());
//			row.createCell(6).setCellValue(item.getTongtien());
//
//			// Add image
//			String uploadsDir = req.getServletContext().getRealPath("/assets/img/product/");
//			Path path = Paths.get(uploadsDir + item.getSanpham().getAnhdaidien());
//			byte[] imageBytes = Files.readAllBytes(path);
//			if (imageBytes != null) {
//				int pictureIdx = workbook.addPicture(imageBytes, Workbook.PICTURE_TYPE_JPEG);
//				XSSFDrawing drawing = sheet.createDrawingPatriarch();
//				XSSFClientAnchor anchor = drawing.createAnchor(0, 0, 0, 0, 1, rowIndex, 2, rowIndex + 1);
//				XSSFPicture picture = drawing.createPicture(anchor, pictureIdx);
//				picture.resize();
//			}
//			rowIndex++;
//		}
//
//		// Set response
//		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
//		response.setHeader("Content-Disposition", "attachment; filename=\"ThongKeDoanhThuTheoSanPham.xlsx\"");
//		// Write Excel file to response
//		workbook.write(response.getOutputStream());
//		workbook.close();
//	}

	@GetMapping("/exportExcel")
	public void exportExcel(@RequestParam("ngayBatDau") Optional<String> ngayBatDauParam,
			@RequestParam("ngayKetThuc") Optional<String> ngayKetThucParam, HttpServletResponse response,
			HttpServletRequest req) throws IOException {
		// Set dashboard
		Date ngayBatDau = ngayBatDauParam.map(value -> {
			LocalDate localDate = LocalDate.parse(value);
			ZonedDateTime zonedDateTime = localDate.atStartOfDay(ZoneId.systemDefault());
			Instant instant = zonedDateTime.toInstant();
			return Date.from(instant);
		}).orElse(null);
		Date ngayKetThuc = ngayKetThucParam.map(value -> {
			LocalDate localDate = LocalDate.parse(value);
			ZonedDateTime zonedDateTime = localDate.atStartOfDay(ZoneId.systemDefault());
			Instant instant = zonedDateTime.toInstant();
			return Date.from(instant);
		}).orElse(null);

		List<ReportDTO> listThongKeDoanhThuSanPhams = reportDAO.thongKeDoanhThuTheoSanPham(ngayBatDau, ngayKetThuc);

		// Create Excel file
		XSSFWorkbook workbook = new XSSFWorkbook();
		XSSFSheet sheet = workbook.createSheet("Thống kê doanh thu theo sản phẩm");

		// Set header
		XSSFRow headerRow = sheet.createRow(0);
		headerRow.createCell(0).setCellValue("STT");
		headerRow.createCell(1).setCellValue("Ảnh sản phẩm");
		headerRow.createCell(2).setCellValue("Tên sản phẩm");
		headerRow.createCell(3).setCellValue("Danh mục");
		headerRow.createCell(4).setCellValue("Hãng");
		headerRow.createCell(5).setCellValue("Số lượng bán");
		headerRow.createCell(6).setCellValue("Doanh thu");

		// Set data
		int rowIndex = 1;
		for (ReportDTO item : listThongKeDoanhThuSanPhams) {
			XSSFRow row = sheet.createRow(rowIndex);
			row.createCell(0).setCellValue(rowIndex);

			// Add image
			String uploadsDir = req.getServletContext().getRealPath("/assets/img/product/");
			Path path = Paths.get(uploadsDir + item.getSanpham().getAnhdaidien());
			byte[] imageBytes = Files.readAllBytes(path);
			if (imageBytes != null) {
				int pictureIdx = workbook.addPicture(imageBytes, Workbook.PICTURE_TYPE_JPEG);
				XSSFDrawing drawing = sheet.createDrawingPatriarch();
				XSSFClientAnchor anchor = drawing.createAnchor(0, 0, 0, 0, 1, rowIndex, 2, rowIndex + 1);
				XSSFPicture picture = drawing.createPicture(anchor, pictureIdx);
				picture.resize(0.5); // Resize image to 50%
			}

			row.createCell(2).setCellValue(item.getSanpham().getTensanpham());
			row.createCell(3).setCellValue(item.getSanpham().getDanhmuc().getTendanhmuc());
			row.createCell(4).setCellValue(item.getSanpham().getHang().getTenhang());
			row.createCell(5).setCellValue(item.getSoluong());
			row.createCell(6).setCellValue(item.getTongtien());

			rowIndex++;
		}

		// Set response
		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
		response.setHeader("Content-Disposition", "attachment; filename=\"ThongKeDoanhThuTheoSanPham.xlsx\"");
		// Write Excel file to response
		workbook.write(response.getOutputStream());
		workbook.close();
	}
}
