package com.fpoly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.fpoly.entity.DiaChiGiaoHang;
import com.fpoly.entity.KhuyenMai;
import com.fpoly.entity.User;

public interface KhuyenMaiDAO extends JpaRepository<KhuyenMai, Integer>{

	KhuyenMai findById(int Id);
	KhuyenMai findByMakhuyenmai(int makhuyenmai);
}
