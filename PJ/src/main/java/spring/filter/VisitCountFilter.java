package spring.filter;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import spring.service.admin.VisitCountDAO;

public class VisitCountFilter extends HandlerInterceptorAdapter{
	@Autowired
	VisitCountDAO visitCountDAO;
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler){
		System.out.println("visit count filter operation");
		String VISIT_IP = request.getRemoteAddr();
		String VISIT_SESSION = request.getRequestedSessionId();
		
		Map<String, Object> map = new HashMap<>();
		map.put("VISIT_IP", VISIT_IP);
		map.put("VISIT_SESSION", VISIT_SESSION);
		
		try {
			if(!(visitCountDAO.countSession(VISIT_SESSION)>=1)) {
				visitCountDAO.insertVisitor(map);
				System.out.println(VISIT_IP+"/"+VISIT_SESSION);
			}
		}catch(Exception e){
			
		}
		
		return true;
	}
	
	
}