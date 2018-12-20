package spring.entity.admin;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class ProductOrderList {
	private int order_num;	
	private int pay_number;
	private int p_num;
	private int p_quantity;	
	private int p_total;	
	private int user_number;
	private int user_post;
	private int user_phone;
	private int rcv_post;
	private int rcv_phone;
	private int d_number;
	
	private String p_name;	
	private String p_option;	
	private String username;
	private String user_addr1;	
	private String user_addr2;
	private String rcv_name;	
	private String rcv_addr1;
	private String rcv_addr2;	
	private String d_comment;	
	private String pay_method;	
	private String pay_status;
	private String cart;	
	private String memo;	
	private String order_reg;	
	private String img;
}
