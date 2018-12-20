package spring.entity.mypage;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User {

	private int loop_pw, point;

	private String  birth, post, no, phone, email, name, addr1, addr2, reg, grade, id, salt_pw;


}
