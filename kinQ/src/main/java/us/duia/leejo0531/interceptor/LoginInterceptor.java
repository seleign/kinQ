package us.duia.leejo0531.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		String userId = (String)request.getSession().getAttribute("userId");
		if(userId!=null){
			return true;
		}else{
			response.sendRedirect("/leejo0531/index");
			return false;
		}
	}
}
