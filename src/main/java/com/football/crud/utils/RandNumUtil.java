package com.football.crud.utils;

import java.util.Random;

public class RandNumUtil {

	public String getRandNum() {
		Random random = new Random();
		String result="";
		for (int i=0;i<6;i++) {
			result+=random.nextInt(10);
		}
		return result;
	}
	
}
