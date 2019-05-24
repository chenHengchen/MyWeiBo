package com.chenheng.common.exception;

public class FriendServiceException extends Exception{
	
	private static final long serialVersionUID = -6675193309453621135L;

	/**
	 * 数据存取异常
	 */
	public FriendServiceException(){
		super();
	}
	
	public FriendServiceException(String message,Throwable cause){
		super(message,cause);
	}
	
	public FriendServiceException(String message){
		super(message);
	}
	
	public FriendServiceException(Throwable cause){
		super(cause);
	}
}
