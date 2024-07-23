package com.fpoly.classes;

import com.fpoly.entity.ChiTietSanPham;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class DonHangClass {
	ChiTietSanPham chiTietSanPham;
	int soluong;
	float chiPhiGiaoHang;
	String phuongthucthanhtoan;
	int maDiaChiGiaoHang;
	int maKhuyenMai;
}
