package crypt;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

public class CustomPasswordEncoder {

	private final static PasswordEncoder delegate = new BCryptPasswordEncoder();
	public static String encode(CharSequence rawPassword) {
		return delegate.encode(rawPassword);
	}
	
	public static boolean matches(CharSequence rawPassword, String encodedPassword) {
		return delegate.matches(rawPassword, encodedPassword);
	}
	
	public static void main(String[] args) {
		String pw = "!q2w3e4r4";
		String dbPw = "$2a$10$GzjjFcvYSGd9wOElYChFMOpiELZ6fm41niIRVG/V53GchKhlgxoHq";
		System.out.println(CustomPasswordEncoder.encode(pw));
		System.out.println(CustomPasswordEncoder.matches(pw, dbPw));
	}
}