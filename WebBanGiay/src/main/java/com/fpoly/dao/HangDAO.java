package com.fpoly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fpoly.entity.Hang;

public interface HangDAO extends JpaRepository<Hang, Integer>{
	Hang findByMahang(int idHang);

	Hang findByTenhang(String tenhang);
}
