package com.football.crud.test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.football.crud.utils.Md5Util;
import com.football.crud.utils.RandNumUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class UtilsTest {
	
	/*
	 * @Test public void test00() { SimpleDateFormat year = new
	 * SimpleDateFormat("yyyy"); Date date = new Date();
	 * System.out.println(year.format(date)); }
	 */
	
	/*
	 * @Test public void test01() { String date = "2017-01-01"; //String[] str =
	 * date.split("-"); System.out.println(date.split("-")[0]); }
	 */
	
	@Test
	public void test02() { 
		Md5Util md5Util = new Md5Util();
		System.out.println(md5Util.getMd5("123456"));
	}
	 
	
//	@Test
//	public void test03() {
//		RandNumUtil randNumUtil = new RandNumUtil();
//		System.out.println(randNumUtil.getRandNum());
//	}
}
