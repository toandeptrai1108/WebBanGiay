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
@Table(name = "sanpham")
public class SanPham implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int masanpham;
	String tensanpham;
	String mota;
	boolean trangthai;
	int soluongbanra;
	boolean hot;
	String noidungsanpham;
	float giagoc;
	float giamgia;
	float gia;
	String anhdaidien;

	// SanPham 1: ds DanhGia
	@OneToMany(mappedBy = "sanpham")
	List<DanhGia> danhgia;

	// SanPham 1: ds AnhSanPham
	@OneToMany(mappedBy = "sanpham")
	List<AnhSanPham> anhsanpham;

	// SanPham 1:ds ChiTietSanPham
	@OneToMany(mappedBy = "sanpham")
	List<ChiTietSanPham> chitietsanpham;

	// SanPham N: dt Hang
	@ManyToOne
	@JoinColumn(name = "mahang")
	Hang hang;

	// SanPham N: dt DanhMuc
	@ManyToOne
	@JoinColumn(name = "madanhmuc")
	DanhMuc danhmuc;
}
