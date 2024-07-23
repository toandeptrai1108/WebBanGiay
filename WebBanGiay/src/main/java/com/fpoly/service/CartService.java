package com.fpoly.service;

import java.util.List;

import com.fpoly.classes.CartItem;
import com.fpoly.entity.ChiTietSanPham;

public interface CartService {
	List<CartItem> getList();

	void add(ChiTietSanPham chiTietSanPham);

	void update(int id, int soLuong);

	void remove(int id);

	void clear();

	int getCount();

	int getAmount();

	void increase(int id);

	void decrease(int id);
}
