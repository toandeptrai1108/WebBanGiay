package com.fpoly.controller;



import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class slide {

    Integer maSlide;
    @NotNull(message = "Đường dẫn trống")
    @NotBlank(message = "Đường dẫn trống")
    String link;
    
    Boolean trangThai;



    String anhDaiDien;



	public static void add(slide newSlide) {
		// TODO Auto-generated method stub
		
	}

 


}
