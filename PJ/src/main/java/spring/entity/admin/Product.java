package spring.entity.admin;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Product {
	private int no;
	private String major;
	private String sub;
	private String p_name;
	private int p_price;
	private int d_price;
	private String d_com;
	private String reg;
	private String img_1;
	private String img_2;
	private String img_3;
	private String img_4;
	private String img_5;
	private String display;
	private int inventory;
	private String opt;
	private String content_img1;
	private String content_img2;
	private String content_img3;
	private String content_img4;
	private String content_img5;
}
