package com.fpoly.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Service;

import com.fpoly.classes.DonHangClass;
import com.fpoly.entity.ChiTietSanPham;

@Service
public class DonHangImp implements DonHangService {
	List<DonHangClass> donHang = new ArrayList<>();

	@Override
	public List<DonHangClass> getList() {
		return donHang;
	}

	@Override
	public void add(ChiTietSanPham chiTietSanPham, float chiPhiGiaoHang, String phuongThucThanhToan,
			int maDiaChiGiaoHang, int soluong, int makhuyenmai) {
		boolean notFound = true; // chưa thêm sản phẩm này vào giỏ
		for (DonHangClass item : donHang) {
			if (item.getChiTietSanPham().getMachitietsanpham() == chiTietSanPham.getMachitietsanpham()) {
				item.setSoluong(item.getSoluong() + 1);
				notFound = false;
			}
		}
		if (notFound) {
			donHang.add(new DonHangClass(chiTietSanPham, 1, chiPhiGiaoHang, phuongThucThanhToan, maDiaChiGiaoHang, 0));
		}
	}

	@Override
	public void update(ChiTietSanPham chiTietSanPham, float chiPhiGiaoHang, String phuongThucThanhToan,
			int maDiaChiGiaoHang, int soLuong, int makhuyenmai) {
		for (DonHangClass item : donHang) {
			if (item.getChiTietSanPham() == chiTietSanPham) {
				item.setChiPhiGiaoHang(chiPhiGiaoHang);
				item.setPhuongthucthanhtoan(phuongThucThanhToan);
				item.setMaDiaChiGiaoHang(maDiaChiGiaoHang);
				item.setSoluong(soLuong);
				item.setMaKhuyenMai(makhuyenmai);
			}
		}
	}

	@Override
	public void remove(int id) {
		DonHangClass foundItem = null;
		for (DonHangClass cartItem : donHang) {
			if (cartItem.getChiTietSanPham().getMachitietsanpham() == id) {
				foundItem = cartItem;
			}
		}
		donHang.remove(foundItem);
	}

	@Override
	public void clear() {
		donHang.clear();
	}

	@Override
	public int getCount() {
		return donHang.size();
	}

	@Override
	public int getAmount() {
		int amount = 0;
		for (DonHangClass cartItem : donHang) {
			amount += cartItem.getChiTietSanPham().getGiatien() * cartItem.getSoluong();
		}
		return amount;
	}

	@Override
	public void increase(int id) {
		for (DonHangClass item : donHang) {
			if (item.getChiTietSanPham().getMachitietsanpham() == id) {
				item.setSoluong(item.getSoluong() + 1);
			}
		}
	}

	@Override
	public void decrease(int id) {
		DonHangClass foundItem = null;
		for (DonHangClass item : donHang) {
			if (item.getChiTietSanPham().getMachitietsanpham() == id) {
				if (item.getSoluong() > 1) {
					item.setSoluong(item.getSoluong() - 1);
				} else {
					foundItem = item;
				}
			}
		}
		if (foundItem != null) {
			donHang.remove(foundItem);
		}
	}
}
