package com.mkyong.common.util;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.mkyong.common.domain.Usuario;



public class GetSession {

	public static Usuario getUser()throws Exception{
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		return (Usuario) request.getSession().getAttribute("USUA");
	}
	
}
