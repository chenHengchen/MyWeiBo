package com.chenheng.common.exception;

public class DataAccessException extends Exception{
	
	private static final long serialVersionUID = -6675193309453621135L;

	/**
	 * 数据存取异常
	 */
	public DataAccessException(){
		super();
	}
	
	public DataAccessException(String message,Throwable cause){
		super(message,cause);
	}
	
	public DataAccessException(String message){
		super(message);
	}
	
	public DataAccessException(Throwable cause){
		super(cause);
	}
}
