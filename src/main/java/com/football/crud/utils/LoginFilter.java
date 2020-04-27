package com.football.crud.utils;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO 自动生成的方法存根
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		// TODO 自动生成的方法存根
		HttpServletRequest request = (HttpServletRequest)arg0;
		HttpServletResponse response = (HttpServletResponse)arg1;
		HttpSession session = request.getSession();
		
		Cookie[] cookies = request.getCookies();
		Cookie cookie = null;
		if(cookies != null){
			for(int i=0; i<cookies.length; i++){
				if(cookies[i].getName().equals("rememberMe")){
					cookie = cookies[i];
					session.setAttribute("LOGIN_USER", cookie.getValue());
				}
			}
		}
		
		if(session.getAttribute("LOGIN_USER")==null
				&& request.getRequestURI().indexOf("/login/login.jsp") == -1){
			// 没有登录
			response.sendRedirect(request.getContextPath()+"/login/login.jsp");
		}else{
			// 已经登录，继续请求下一级资源（继续访问）
			arg2.doFilter(arg0, arg1);
		}
	}

	@Override
	public void destroy() {
		// TODO 自动生成的方法存根
		
	}

}
