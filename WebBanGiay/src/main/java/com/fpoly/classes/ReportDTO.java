package com.fpoly.classes;

import java.io.Serializable;
import java.util.Date;

import com.fpoly.entity.ChiTietSanPham;
import com.fpoly.entity.DanhMuc;
import com.fpoly.entity.SanPham;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class ReportDTO implements Serializable {
	@Id
	private SanPham sanpham;
	private long soluong;
	private double tongtien;
}