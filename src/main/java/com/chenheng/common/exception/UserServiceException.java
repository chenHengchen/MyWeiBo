package com.chenheng.common.exception;

public class UserServiceException extends Exception{
	/**
	 * 用户服务异常
	 */
	private static final long serialVersionUID = -286816242629998149L;
	
	public UserServiceException(){
		super();
	}
	
	public UserServiceException(String message,Throwable cause){
		super(message,cause);
	}
	
	public UserServiceException(String message){
		super(message);
	}
	
	public UserServiceException(Throwable cause){
		super(cause);
	}
}
