package com.fpoly.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Service;

import com.fpoly.classes.CartItem;
import com.fpoly.entity.ChiTietSanPham;

@Service
public class CartServiceImp implements CartService {
	List<CartItem> gioHang = new ArrayList<>();

	@Override
	public List<CartItem> getList() {
		return gioHang;
	}

	@Override
	public void add(ChiTietSanPham chiTietSanPham) {
		boolean notFound = true; // chưa thêm sản phẩm này vào giỏ
		for (CartItem item : gioHang) {
			if (item.getChiTietSanPham().getMachitietsanpham() == chiTietSanPham.getMachitietsanpham()) {
				item.setSoluong(item.getSoluong() + 1);
				notFound = false;
			}
		}
		if (notFound) {
			gioHang.add(new CartItem(chiTietSanPham, 1));
		}
	}

	@Override
	public void update(int id, int soLuong) {
		for (CartItem cartItem : gioHang) {
			if (cartItem.getChiTietSanPham().getMachitietsanpham() == id) {
				cartItem.setSoluong(soLuong);
			}
		}
	}

	@Override
	public void remove(int id) {
		CartItem foundItem = null;
		for (CartItem cartItem : gioHang) {
			if (cartItem.getChiTietSanPham().getMachitietsanpham() == id) {
				foundItem = cartItem;
			}
		}
		gioHang.remove(foundItem);
	}

	@Override
	public void clear() {
		gioHang.clear();
	}

	@Override
	public int getCount() {
		return gioHang.size();
	}

	@Override
	public int getAmount() {
		int amount = 0;
		for (CartItem cartItem : gioHang) {
			amount += cartItem.getChiTietSanPham().getGiatien() * cartItem.getSoluong();
		}
		return amount;
	}

	@Override
	public void increase(int id) {
		for (CartItem cartItem : gioHang) {
			if (cartItem.getChiTietSanPham().getMachitietsanpham() == id) {
				cartItem.setSoluong(cartItem.getSoluong() + 1);
			}
		}
	}

	@Override
	public void decrease(int id) {
		CartItem foundItem = null;
		for (CartItem cartItem : gioHang) {
			if (cartItem.getChiTietSanPham().getMachitietsanpham() == id) {
				if (cartItem.getSoluong() > 1) {
					cartItem.setSoluong(cartItem.getSoluong() - 1);
				} else {
					foundItem = cartItem;
				}
			}
		}
		if (foundItem != null) {
			gioHang.remove(foundItem);
		}
	}
}
