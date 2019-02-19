package com.objectif.onu.insarag_webapp.bean;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.objectif.onu.insarag_webapp.model.Users;

@Component
public class ActiveUserBean extends SimpleUrlAuthenticationSuccessHandler {
	
	private Users user;

	@Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
		System.out.println(authentication.getName());
      //do whatever you want
      super.onAuthenticationSuccess(request, response, authentication);
  }

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}
	
	
	
}
