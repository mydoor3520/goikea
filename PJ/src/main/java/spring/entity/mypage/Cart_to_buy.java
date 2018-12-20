package spring.entity.mypage;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Cart_to_buy {
	private int order_num, rnum, p_num, p_total, pay_number, p_quantity;
	private String p_name, p_option;
	}
