package com.fpoly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fpoly.entity.DanhGia;
import com.fpoly.entity.SanPham;

public interface DanhGiaDAO extends JpaRepository<DanhGia, Integer>{
	List<DanhGia> findAll();
	List<DanhGia> findBySanpham(SanPham sanPham);
}
