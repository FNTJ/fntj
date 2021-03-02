package com.mbeti.controller;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordEncoderGenerator {
	
	public static void main(String[] args) {
		
		int i = 0;
		while (i < 5) {
			String password = "woaqkrtm00";
			BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
			String hashedPassword = pwdEncoder.encode(password);
			
			System.out.println(hashedPassword);
			i++;
		}
		
	}

}


