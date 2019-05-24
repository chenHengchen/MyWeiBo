package com.chenheng.common.exception;

public class WeiboServiceException extends Exception{
	
	private static final long serialVersionUID = -6675193309453621135L;

	/**
	 * 数据存取异常
	 */
	public WeiboServiceException(){
		super();
	}
	
	public WeiboServiceException(String message,Throwable cause){
		super(message,cause);
	}
	
	public WeiboServiceException(String message){
		super(message);
	}
	
	public WeiboServiceException(Throwable cause){
		super(cause);
	}
}
