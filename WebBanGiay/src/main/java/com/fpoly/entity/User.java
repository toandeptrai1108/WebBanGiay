package com.fpoly.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Data
@Entity
@Table(name = "[user]")
public class User implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "manguoidung")
	int manguoidung;
	String ten;
	String email;
	String username;
	String password;
	String sodienthoai;
	@Temporal(TemporalType.DATE)
	String ngaysinh;// Chỉnh ngày lại
	boolean gioitinh;
	String anhdaidien;
	boolean trangthai;
	boolean role;

	// Users 1: ds DanhGia
	@OneToMany(mappedBy = "user")
	List<DanhGia> danhgia;

	// Users 1: ds DiaChiGiaoHang
	@OneToMany(mappedBy = "user")
	List<DiaChiGiaoHang> diachigiaohang;

	// Users 1: ds DonHang
	@OneToMany(mappedBy = "user")
	List<DonHang> donhang;

	// Users 1: ds ThanhToan
	@OneToMany(mappedBy = "user")
	List<ThanhToan> thanhtoan;

	// Một người dùng có nhiều giỏ hàng
	@OneToMany(mappedBy = "user")
	List<GioHang> giohang;
}
