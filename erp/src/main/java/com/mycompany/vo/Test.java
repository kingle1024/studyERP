package com.mycompany.vo;

public class Test {

    private int userNo;
    private String userId;
    private String userPw;
    
    public int getUserNo() {
        return userNo;
    }
    public void setUserNo(int userNo) {
        this.userNo = userNo;
    }
    public String getUserId() {
        return userId;
    }
    public void setUserId(String userId) {
        this.userId = userId;
    }
    public String getUserPw() {
        return userPw;
    }
    public void setUserPw(String userPw) {
        this.userPw = userPw;
    }
	@Override
	public String toString() {
		return "Test [userNo=" + userNo + ", userId=" + userId + ", userPw=" + userPw + "]";
	}
    
}
