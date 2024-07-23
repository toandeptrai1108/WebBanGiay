package com.fpoly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.fpoly.entity.ChiTietSanPham;
import com.fpoly.entity.SanPham;
import com.fpoly.entity.User;

public interface UserDAO extends JpaRepository<User, Integer>{
	User  findByManguoidung(int manguoidung);
	@Query("SELECT u FROM User u WHERE u.username like ?1")
	User findByTenTaiKhoan(String username);	
	User findByEmail(String email);
	User findByPassword(String password);
	
	@Query("SELECT u FROM User u WHERE u.manguoidung = ?1")
	User timKiemNguoiDungBangID(int manguoidung);	
}
