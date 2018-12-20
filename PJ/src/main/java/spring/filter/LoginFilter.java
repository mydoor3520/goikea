package spring.filter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginFilter extends HandlerInterceptorAdapter{

		
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
				throws Exception {
			System.out.println("필터실행?");
			if(null==request.getSession().getAttribute("user_no")) {
				System.out.println("필터쫌!!");
				response.sendRedirect("../signin");
				return false;
			}else {
				return true;
			}
			
		}

		@Override
		public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
				ModelAndView modelAndView) throws Exception {
			// TODO Auto-generated method stub
			
		}

		@Override
		public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
				Exception ex) throws Exception {
			// TODO Auto-generated method stub
			
		}
		
		
}

