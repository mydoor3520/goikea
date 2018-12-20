package spring.configuration;

import java.io.IOException;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MybatisConfiguration {
	
	/**
	 * 등록할 항목
	 * [1] SqlSessionFactoryBean			mybatis의 모든 설정을 처리할 bean
	 * [2] SqlSessionTemplate					JdbcTemplate 처럼 SQL명령을 실제 코드로 처리하는 bean
	 */
	
	@Bean
	public SqlSessionFactoryBean sqlSessionFactory(
			DataSource dataSource, ApplicationContext applicationContext) throws IOException {
		SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
//		[1] DB연결은 누가 합니까?
		bean.setDataSource(dataSource);
//		[2] mybatis 설정파일은 어디 있습니까?
		bean.setConfigLocation(applicationContext.getResource(
											"classpath:/spring/mybatis/mybatis-config.xml"));
//		[3] SQL명령만 보관한 파일(mapper)은 어디 있습니까?
		bean.setMapperLocations(applicationContext.getResources(
											"classpath:/spring/mybatis/mapper/*-mapper.xml"));
		
		return bean;
	}
	
	@Bean
	public SqlSessionTemplate sqlSession(SqlSessionFactory sqlSessionFactory) {
		SqlSessionTemplate template = new SqlSessionTemplate(sqlSessionFactory);
		return template;
	}
	
}










