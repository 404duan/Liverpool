package com.football.crud.utils;

import org.springframework.util.DigestUtils;

public class Md5Util {

	public static void main(String[] args) {
		String psw = DigestUtils.md5DigestAsHex("123".getBytes());
		System.out.println(psw);;
	}
	
	/**
	 * 获取MD5密文
	 * @param plaintext 明文
	 * @return 密文
	 */
	public String getMd5(String plaintext) {
		return DigestUtils.md5DigestAsHex(plaintext.getBytes());
	}
}
