package pss.cmmn.exception;

public class PssException extends Exception{

	/**
	 * 
	 */
	private static final long serialVersionUID = -502339982061187693L;

	public PssException() {}
	
	public PssException(String message) {
		super(message);
	}
	
	public PssException(Exception e) {
		super(e);
	}
}