package com.mycompany.vo;

import java.util.List;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class User {
	
	List<Authority> authorities;
	  public boolean hasRole(String role) {
	        for (Authority auth : authorities)
	            if (auth.isRole(role))
	                return true;
	        return false;
	    }

	private int id;
//	@Pattern(regexp="^[_0-9a-zA-Z-]+@[0-9a-zA-Z]+(.[_0-9a-zA-Z-]+)*$")
//    @NotEmpty(message="이메일을 입력해 주세요")
    @Pattern(regexp="[_0-9a-zA-Z-]+@[0-9a-zA-Z]+(.[_0-9a-zA-Z-]+)*$", message="이메일 형식으로 작성해 주세요")
    private String email;
    
    @Size(min = 2, max = 5, message="2자에서 5자 사이의 이름만 가능합니다.")
    private String name;
    
    @Size(min=4, message="패스워드는 4자 이상이어야 합니다.")    
    private String password;
    
    @NotEmpty(message="비밀번호를 다시 입력해 주세요")
    private String passwordCheck;
    
    @Size(min=6, max=6, message="주민등록번호 앞자리를 입력해 주세요")
    private String socialNumFront;
    
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPasswordCheck() {
		return passwordCheck;
	}
	public void setPasswordCheck(String passwordCheck) {
		this.passwordCheck = passwordCheck;
	}
	public List<Authority> getAuthorities() {
		return authorities;
	}
	public void setAuthorities(List<Authority> authorities) {
		this.authorities = authorities;
	}
	
	public String getSocialNumFront() {
		return socialNumFront;
	}
	public void setSocialNumFront(String socialNumFront) {
		this.socialNumFront = socialNumFront;
	}
	@Override
	public String toString() {
		return "User [authorities=" + authorities + ", id=" + id + ", email=" + email + ", name=" + name + ", password="
				+ password + ", passwordCheck=" + passwordCheck + ", socialNumFront=" + socialNumFront + "]";
	}
}