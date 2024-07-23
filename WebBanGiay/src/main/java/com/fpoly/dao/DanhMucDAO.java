package com.fpoly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import com.fpoly.entity.DanhMuc;

public interface DanhMucDAO extends JpaRepository<DanhMuc, Integer>{
	DanhMuc findByMadanhmuc(int idDM);
	
	DanhMuc findByTendanhmuc (String tendanhmuc);
}
