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
@Table(name = "danhmuc")
public class DanhMuc implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int madanhmuc;
	String tendanhmuc;
	String anhdaidien;
	boolean hot;
	boolean trangthai;

	// DanhMuc 1: ds SanPham
	@OneToMany(mappedBy = "danhmuc")
	List<SanPham> sanpham;
}
