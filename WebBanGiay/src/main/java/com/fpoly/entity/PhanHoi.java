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
@Table(name = "phanhoi")
public class PhanHoi implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int maphanhoi; // Tự động tăng
	String noidung;

	// PhanHoi N: dt Users
	@ManyToOne
	@JoinColumn(name = "manguoidung")
	User user;
	
	@ManyToOne
	@JoinColumn(name = "madanhgia")
	DanhGia danhgia;
}
