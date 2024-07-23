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
@Table(name = "[thanhtoan]")
public class ThanhToan implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int mathanhtoan;// Tự động tăng
	String phuongthucthanhtoan;
	float tongtien;

	// ThanhToan N: dt DonHang
	@ManyToOne
	@JoinColumn(name = "madonhang")
	DonHang donhang;

	// ThanhToan N: dt Users
	@ManyToOne
	@JoinColumn(name = "manguoidung")
	User user;
}
