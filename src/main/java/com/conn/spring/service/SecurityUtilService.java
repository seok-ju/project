package com.conn.spring.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.stereotype.Service;


@Service
public class SecurityUtilService {
	public String encryptSHA256(String str) {	// 1차 암호화
		String spw = ""; 

    	try{
    		MessageDigest sh = MessageDigest.getInstance("SHA-256"); 
    		sh.update(str.getBytes()); 
    		byte byteData[] = sh.digest();
    		StringBuffer sb = new StringBuffer(); 
    		for(int i = 0 ; i < byteData.length ; i++){
    			sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
    		}

    		spw = sb.toString();

    	}catch(NoSuchAlgorithmException e){
    		System.out.println("Encrypt Error - NoSuchAlgorithmException");
    		spw = null; 
    	}

    	return spw;	
	}
}
