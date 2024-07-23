package com.fpoly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fpoly.entity.ChiTietDonHang;
import com.fpoly.entity.DonHang;

public interface ChiTietDonHangDAO extends JpaRepository<ChiTietDonHang, Integer>{
		List<ChiTietDonHang> findByDonhang(DonHang donHang);
}
