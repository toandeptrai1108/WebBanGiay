package com.fpoly.entity;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "chitietsanpham")
public class ChiTietSanPham implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int machitietsanpham;
	String mausac;
	String size;
	int soluong;
	float giatien;

	// ChiTietSanPham N: dt SanPham
	@ManyToOne
	@JoinColumn(name = "masanpham")
	SanPham sanpham;

	// ChiTietSanPham 1: ds ChiTietGioHang
	@OneToMany(mappedBy = "chitietsanpham")
	List<ChiTietGioHang> chitietgiohang;

	@OneToMany(mappedBy = "chitietsanpham")
	List<ChiTietDonHang> chitietdonhang;
}
