package com.fpoly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.fpoly.entity.ThanhToan;
import com.fpoly.entity.User;

public interface ThanhToanDAO extends JpaRepository<ThanhToan, Integer> {
	@Query("SELECT t FROM ThanhToan t WHERE t.user =:user ")
	List<ThanhToan> findByUser(@Param("user") User user);

	ThanhToan findByPhuongthucthanhtoan(String phuongthucthanhtoan);
}
