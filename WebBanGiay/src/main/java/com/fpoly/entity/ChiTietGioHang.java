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
@Table(name = "chitietgiohang")
public class ChiTietGioHang implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int machitietgiohang;
	int soluong;

	// ChiTietGioHang N: dt ChiTietSanPham - ???
	@ManyToOne
	@JoinColumn(name = "machitietsanpham")
	ChiTietSanPham chitietsanpham;

	// ChiTietGioHang N: dt GioHang
	@ManyToOne
	@JoinColumn(name = "magiohang")
	GioHang giohang;
}
