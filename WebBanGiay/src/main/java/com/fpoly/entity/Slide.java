package com.fpoly.entity;

import java.io.Serializable;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "slide")
public class Slide implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int maslide;// Tự động tăng
	private String anhdaidien;
	private String link;
	private Boolean trangthai;
	

}
