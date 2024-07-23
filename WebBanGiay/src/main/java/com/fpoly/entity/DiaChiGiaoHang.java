package com.fpoly.entity;

import java.io.Serializable;
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
import lombok.Data;

@Data
@Entity
@Table(name = "[diachigiaohang]")
public class DiaChiGiaoHang implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int madiachigiaohang;
	boolean diachimacdinh;
	// String diachigiaohang;//Xóa địa chỉ giao hàng, thêm cột tỉnh huyện xã
	//Cột mới thêm
	String tinh;
	String huyen;
	String xa;
	
	String thongtinthem;
	String tennguoinhan;
	String sodienthoai;

	// DiaChiGiaoHang N: dt Users
	@ManyToOne
	@JoinColumn(name = "manguoidung")
	User user;
	// DiaChiGiaoHang 1: ds DonHang
	@OneToMany(mappedBy = "diachigiaohang")
	List<DonHang> donhang;
}
