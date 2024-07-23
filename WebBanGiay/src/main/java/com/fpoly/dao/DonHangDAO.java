package com.fpoly.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.fpoly.entity.DonHang;
import com.fpoly.entity.User;

public interface DonHangDAO extends JpaRepository<DonHang, Integer> {
	@Query("SELECT o FROM DonHang o WHERE o.user = ?1 ORDER BY o.madonhang DESC")
	List<DonHang> findByUser(User user);

	/*
	 * List<Booking> listBookingOfUserId =
	 * bookingDAO.findMaxBookingIdByUserId(userId); Booking bookingMaxOfUserId =
	 * listBookingOfUserId.get(0);// Lấy booking max của user mới tạo booking
	 */
	DonHang findByMadonhang(int maDonHang);

	@Query("SELECT dh FROM DonHang dh WHERE dh.ngaydathang BETWEEN :startDate AND :endDate")
	List<DonHang> findDonHangByNgayDatHangBetween(@Param("startDate") Date startDate, @Param("endDate") Date endDate);
}
