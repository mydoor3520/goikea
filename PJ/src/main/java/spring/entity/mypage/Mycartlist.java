package spring.entity.mypage;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Mycartlist {
	private String d_com, p_name, p_option, user_name, user_addr1, user_addr2, rcv_name, username, 
					rcv_addr1, rcv_addr2, d_comment, pay_method, pay_status, cart, memo, order_reg, img_1;
	private int d_price, order_num, p_num, p_quantity, p_total, user_num, 
				user_post, user_phone, rcv_post, rcv_phone, pay_number, d_number;
}
