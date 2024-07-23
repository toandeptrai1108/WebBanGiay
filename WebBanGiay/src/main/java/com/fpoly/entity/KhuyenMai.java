package com.fpoly.entity;

import java.io.Serializable;
import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
@Getter
@Setter
@Data
@Entity
@Table(name = "khuyenmai")
public class KhuyenMai implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int makhuyenmai;// tự động tăng
	String tenkhuyenmai;
	float phantramkhuyenmai;
	float sotientoida;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd") // Định dạng năm-tháng-ngày
    @Temporal(TemporalType.DATE)
    private Date ngaybatdau;

    @DateTimeFormat(pattern = "yyyy-MM-dd") // Định dạng năm-tháng-ngày
    @Temporal(TemporalType.DATE)
    private Date ngayketthuc;
}
