package com.fpoly.vnpay;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/thanhtoan1")
public class PaymentVNPayController {

	@GetMapping("")
	public String moTrangJSP() {
		return "payment/vnpay_pay";
	}

	@GetMapping("/thanhtoanthanhcong")
	public String thanhToanThanhCong() {
		return "userproduct/thanhtoanthanhcong";
	}

}
