package spring.entity.admin;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor @Builder
public class Company {
	private int no;						//시퀀스 번호 		primary key
	private String c_brand;				//판매자 			not null
	private String c_name;				//업체명 			not null
	private String c_representation;	//대표자 이름 		not null
	private String c_registration;		//사업자 등록 번호 	not null unique check(regexp_like(c_registration, '^[0-9]'))
	private String m_name;				//담당자 이름 		not null
	private String m_email;				//담당자 이메일 		not null
	private String m_phone;				//담당자 전화번호 	not null
	private String c_post;				//우편주소
	private String c_addr1;				//업체 앞 주소
	private String c_addr2;				//업체 뒷 주소
	private String reg;					//등록 날짜 		not null
}
