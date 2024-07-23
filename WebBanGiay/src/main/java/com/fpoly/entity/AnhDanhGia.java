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
@Table(name = "anhdanhgia")
public class AnhDanhGia implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int maanhdanhgia;
	String nguonanh;

	// Ảnh đánh giá N: dt Đánh giá
	@ManyToOne
	@JoinColumn(name = "madanhgia")
	DanhGia danhgia;

}
