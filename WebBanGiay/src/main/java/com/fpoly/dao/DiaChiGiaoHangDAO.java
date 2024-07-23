package com.fpoly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fpoly.entity.DiaChiGiaoHang;
import com.fpoly.entity.User;
import com.fpoly.dao.DiaChiGiaoHangDAO;


public interface DiaChiGiaoHangDAO extends JpaRepository<DiaChiGiaoHang, Integer> {
	List<DiaChiGiaoHang> findByUser(User user);

	@Query("SELECT u FROM DiaChiGiaoHang u WHERE u.user = ?1 and u.diachimacdinh = true")
	DiaChiGiaoHang timKiemDiaChiMacDinhCuaUser(User user);

	@Query("SELECT u FROM DiaChiGiaoHang u WHERE u.user = ?1")
	List<DiaChiGiaoHang> timKiemTatCaDiaChiGiaoHangCuaUser(User user);

	DiaChiGiaoHang findByMadiachigiaohang(int madiachigiaohang);

//	@Query("SELECT c FROM DiaChiGiaoHang c WHERE c.user = :user")
//	List<DiaChiGiaoHang> findByUser(@Param("user") User user);

}
