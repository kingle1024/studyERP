package com.mycompany.helper;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;

public class SessionHelper {
	
	public static User currentUser() {
		return (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}
}
