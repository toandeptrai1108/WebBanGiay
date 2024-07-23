package com.fpoly.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.Data;

@Data
@Entity
@Table(name = "[donhang]")
public class DonHang implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int madonhang;
	int tongsosanpham;
	int trangthaidonhang;
//	int  trangthaidonhang;
	// 0 chờ xác nhận đơn hàng
	// 1 chưa thanh toán,
	// 2 đã hủy đơn,
	// 3 đã thanh toán
	int trangthaivanchuyen;
	// 0 chờ xác nhận đơn hàng
	// 1 đang đóng hàng giao cho đơn vị vận chuyển,
	// 2 đang gửi cho đơn vị vận chuyển,
	// 3 đang vận chuyển,
	// 4 đang giao hàng,
	// 5 đã giao hàng -------------------
	boolean trangthaidanhgia;// Mỗi người chỉ được một lần đánh giá
	float tonggiamgia;
	float tongtien;
	String ghichu;

	@Temporal(TemporalType.DATE)
	Date ngaydathang;// Chỉnh ngày lại

	// DonHang N: dt Users
	@ManyToOne
	@JoinColumn(name = "manguoidung")
	User user;

	// DonHang N: dt DiaChiGiaoHang
	@ManyToOne
	@JoinColumn(name = "madiachigiaohang")
	DiaChiGiaoHang diachigiaohang;

	// DonHang N: dt DonViGiaoHang
//	@ManyToOne
//	@JoinColumn(name = "madonvigiaohang")
//	DonViGiaoHang donvigiaohang;
	// Tính cái chi phí giao hàng trong tồng tiền luôn
	
	// DonHang 1: ds ThanhToan
	@OneToMany(mappedBy = "donhang")
	List<ThanhToan> thanhtoan;
	// DonHang 1: ds ChiTietDonHang
	@OneToMany(mappedBy = "donhang")
	List<ChiTietDonHang> chitietdonhang;
}
