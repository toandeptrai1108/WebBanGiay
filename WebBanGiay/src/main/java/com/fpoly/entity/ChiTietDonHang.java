package com.fpoly.entity;

import java.io.Serializable;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "chitietdonhang")
public class ChiTietDonHang implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int machitietdonhang;// Tự động tăng
	float gia;
	int soluong;
	float tongtien;

	// ChiTietDonHang N: dt DonHang
	@ManyToOne
	@JoinColumn(name = "madonhang")
	DonHang donhang;
	// ChiTietDonHang N: dt ChiTietSanPham
	// VÔ CSDL đổi lại tên bảng
	@ManyToOne
	@JoinColumn(name = "machitietsanpham")
	ChiTietSanPham chitietsanpham;
}
