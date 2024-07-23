package com.fpoly.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import com.fpoly.entity.DanhMuc;
import com.fpoly.entity.Hang;
import com.fpoly.entity.SanPham;

public interface SanPhamDAO extends JpaRepository<SanPham, Integer> {
	@Query("Select sanPham From SanPham sanPham " + "Where sanPham.gia > :min And sanPham.gia < :max")
	Page<SanPham> findByPrice(@Param("min") Integer min, @Param("max") Integer max, Pageable pageable);
//
//	@Query(value = "SELECT SanPham.maSanPham, SanPham.tenSanPham, SanPham.moTa, SanPham.trangThai, SanPham.soLuongBanRa, SanPham.hot, SanPham.noiDungSanPham, SanPham.giaGoc, SanPham.giamGia, SanPham.gia, SanPham.maDanhMuc, SanPham.maHang, SanPham.anhDaiDien FROM SanPham JOIN Hang ON SanPham.maHang = Hang.maHang JOIN DanhMuc ON SanPham.maDanhMuc = DanhMuc.maDanhMuc WHERE CAST(Hang.tenHang AS NVARCHAR) LIKE %?1% and CAST(DanhMuc.tenDanhMuc AS NVARCHAR) LIKE %?2% and SanPham.gia >?3 And SanPham.gia <?4" , nativeQuery = true)
//	Page<SanPham> findByHangAndDanhMucAndPriceRange(String tenHang, String tenDanhMuc, float min, float max,
//			Pageable pageable);
	
	@Query("SELECT s FROM SanPham s WHERE s.hang.tenhang like %?1% and s.danhmuc.tendanhmuc like %?2% and s.gia>?3 and s.gia<?4")
	Page<SanPham> findByHangAndDanhMucAndPriceRange(String tenHang, String tenDanhMuc, float min, float max,
			Pageable pageable);

	@Query("SELECT s FROM SanPham s WHERE s.danhmuc.madanhmuc = :madanhmuc")
	Page<SanPham> findByIdCategory(@Param("madanhmuc") Integer maDanhMuc, Pageable pageable);

	@Query("SELECT s FROM SanPham s WHERE (s.giamgia/s.giagoc)*100 >= 50")
	Page<SanPham> findFlashSale(Pageable pageable);

	SanPham findByMasanpham(int maSP);

	@Query("SELECT s FROM SanPham s ORDER BY s.soluongbanra DESC LIMIT 6")
	List<SanPham> findTop6BestSellingProducts();

	@Query("SELECT sp FROM SanPham sp " + "WHERE sp.danhmuc = :danhmuc AND sp.hang = :hang "
			+ "ORDER BY sp.soluongbanra DESC " + "LIMIT 10")
	List<SanPham> findTop10ProductsByDanhMucAndHang(@Param("danhmuc") DanhMuc danhmuc, @Param("hang") Hang hang);
}
