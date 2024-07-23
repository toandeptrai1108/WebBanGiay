package com.fpoly.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.fpoly.classes.ReportDTO;
import com.fpoly.entity.SanPham;

public interface ReportDAO extends JpaRepository<ReportDTO, SanPham> {
	@Query("SELECT new com.fpoly.classes.ReportDTO(" +
	        "s as sanpham, " +
	        "SUM(ctdh.soluong) as soluong, " +
	        "SUM(dh.tongtien) as tongtien) " +
	        "FROM ChiTietDonHang ctdh " +
	        "JOIN ctdh.donhang dh " +
	        "JOIN ctdh.chitietsanpham cts " +
	        "JOIN cts.sanpham s " +
	        "JOIN s.danhmuc d " +
	        "WHERE dh.ngaydathang BETWEEN :startDate AND :endDate " +
	        "GROUP BY s")
	List<ReportDTO> thongKeDoanhThuTheoSanPham(@Param("startDate") Date startDate, @Param("endDate") Date endDate);
}
