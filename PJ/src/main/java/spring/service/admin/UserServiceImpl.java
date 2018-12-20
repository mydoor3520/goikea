package spring.service.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.entity.mypage.User;


@Service("UserService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<User> list(Map<String,Object> count) {
		System.out.println("UserServiceImpl => list()실행됨");
		return sqlSession.selectList("selectUser", count);
	}

	@Override
	public List<User> listSearch(Map<String, Object> count) {
		System.out.println("UserServiceImpl => listSearch => startArticle = "+count.get("startArticle"));
		System.out.println("UserServiceImpl => listSearch => endArticle = "+count.get("endArticle"));
		System.out.println("UserServiceImpl => listSearch => searchOption = "+count.get("searchOption"));
		System.out.println("UserServiceImpl => listSearch => keyword = "+count.get("keyword"));
		System.out.println("sql후" + sqlSession.selectList("searchUserList", count));
		
		return sqlSession.selectList("searchUserList", count);
	}

	@Override
	public List<User> listSearchOptionAll(Map<String, Object> count) {
		System.out.println("UserServiceImpl => listSearch => keyword = "+count.get("keyword"));
		System.out.println("sql후" + sqlSession.selectList("searchUserListOptionAll", count));

		return sqlSession.selectList("searchUserListOptionAll", count);
	}

	//진행중
	@Override
	public List<User> userInfo(int no, List<User> ulist) {
		System.out.println("UserServiceImpl => userInfo no = "+no);
		return sqlSession.selectList("detailUser", no);
	}

	@Override
	public void deleteUser(int no) {
		System.out.println("UserServiceImpl => deleteUser no = "+no);
		sqlSession.delete("deleteUser", no);
	}

	@Override
	public void changePw(Map<String, Object> map) {
		System.out.println("UserServiceImpl => changePw ");
		sqlSession.update("changePw", map);
	}

//	@Override
//	public List<User> editUserInfo(int no) {
//		System.out.println("UserServiceImpl => no = "+no);
//		return sqlSession.selectList("editUserInfo", no);
//	}

	public void editUser(User user) {
		System.out.println("UserServiceImpl / email = "+user.getEmail());
		sqlSession.update("editUserData", user);
	}

}
