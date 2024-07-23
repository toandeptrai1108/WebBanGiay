package com.fpoly.service;

import java.util.List;
import com.fpoly.classes.DonHangClass;
import com.fpoly.entity.ChiTietSanPham;

public interface DonHangService {
	List<DonHangClass> getList();

	void add(ChiTietSanPham chiTietSanPham, float chiPhiGiaoHang, String phuongThucThanhToan, int maDiaChiGiaoHang,
			int soluong, int maKhuyenMai);

	void update(ChiTietSanPham chiTietSanPham, float chiPhiGiaoHang, String phuongThucThanhToan, int maDiaChiGiaoHang,
			int soluong, int maKhuyenMai);

	void remove(int id);

	void clear();

	int getCount();

	int getAmount();

	void increase(int id);

	void decrease(int id);
}
