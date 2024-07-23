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
@Table(name = "danhgia")
public class DanhGia implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int madanhgia;
    String noidung;
    float sosao;
    @Temporal(TemporalType.DATE)
    Date ngaydanhgia;
    
    // Khóa ngoại maSanPham = DanhGia N:dt SanPham
    @ManyToOne
    @JoinColumn(name = "masanpham")
    SanPham sanpham;

    // Khóa ngoại UserId = Đánh N:dt Users
    @ManyToOne
    @JoinColumn(name = "manguoidung")
    User user;
    
	@OneToMany(mappedBy = "danhgia")
	List<AnhDanhGia> anhdanhgia;
	
	@OneToMany(mappedBy = "danhgia")
	List<PhanHoi> phanhoi;
}


