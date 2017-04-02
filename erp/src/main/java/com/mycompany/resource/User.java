package com.mycompany.resource;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;

public class User {

	int id;	
	@Email
	String email;	
	@Size(min = 4, max = 20)
	String password;
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", email=" + email + ", password=" + password + "]";
	}

}
