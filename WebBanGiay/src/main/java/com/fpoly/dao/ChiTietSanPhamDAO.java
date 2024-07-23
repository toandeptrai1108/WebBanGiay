package com.fpoly.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.fpoly.entity.ChiTietSanPham;
import com.fpoly.entity.DonHang;
import com.fpoly.entity.SanPham;

public interface ChiTietSanPhamDAO extends JpaRepository<ChiTietSanPham, Integer> {
	@Query("SELECT c FROM ChiTietSanPham c WHERE c.sanpham = :sanpham")
	List<ChiTietSanPham> findBySanPham(@Param("sanpham") SanPham sanpham);

	@Query("SELECT c FROM ChiTietSanPham c WHERE c.sanpham = :sanpham and c.mausac like :mausac and c.size like :size")
	ChiTietSanPham findSanPhamBangMaSanPhamMauSacVaSize(@Param("sanpham") SanPham sanpham,
			@Param("mausac") String mausac, @Param("size") String size);

	ChiTietSanPham findByMachitietsanpham(int maChiTietSanPham);


	ChiTietSanPham findBySanphamAndMausacAndSize(SanPham sp, String mausac, String size);
}
