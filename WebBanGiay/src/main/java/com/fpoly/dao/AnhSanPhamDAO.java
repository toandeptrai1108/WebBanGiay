package com.fpoly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.fpoly.entity.AnhSanPham;
import com.fpoly.entity.ChiTietSanPham;
import com.fpoly.entity.SanPham;

public interface AnhSanPhamDAO extends JpaRepository<AnhSanPham, Integer>{
	@Query("SELECT a FROM AnhSanPham a WHERE a.sanpham = :sanpham")
	List<AnhSanPham> findBySanPham(@Param("sanpham") SanPham sanpham);
}
