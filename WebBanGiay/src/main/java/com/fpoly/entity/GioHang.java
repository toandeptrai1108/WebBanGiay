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
import lombok.Data;

@Data
@Entity
@Table(name = "giohang")
public class GioHang implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int magiohang;// Tự động tăng

	// GioHang 1: ds ChiTietGioHang
	@OneToMany(mappedBy = "giohang")
	List<ChiTietGioHang> chitietgiohang;

	// GioHang N: dt Users
	@ManyToOne
	@JoinColumn(name = "manguoidung")
	User user;
}
