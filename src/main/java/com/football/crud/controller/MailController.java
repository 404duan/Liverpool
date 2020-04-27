package com.football.crud.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.football.crud.bean.Msg;
import com.football.crud.utils.RandNumUtil;

@RestController
@RequestMapping("mail")
public class MailController {
	
	@Autowired
    private JavaMailSender javaMailSender;//在spring中配置的邮件发送的bean
 
	@RequestMapping("sendVerf")
	public Msg sendVerfEmail(String admEmail) {
		MimeMessage mMessage=javaMailSender.createMimeMessage();//创建邮件对象
        MimeMessageHelper mMessageHelper;
        Properties prop = new Properties();
        String from;
        RandNumUtil num = new RandNumUtil();
        String verf = num.getRandNum();
        try {
            //从配置文件中拿到发件人邮箱地址
            prop.load(this.getClass().getResourceAsStream("/mail.properties"));
            from = prop.get("mail.smtp.username")+"";
            mMessageHelper=new MimeMessageHelper(mMessage,true);
            mMessageHelper.setFrom(from);//发件人邮箱
            mMessageHelper.setTo(admEmail);//收件人邮箱
            mMessageHelper.setSubject("密码重置");//邮件的主题
            mMessageHelper.setText("<p>此验证码30分钟内有效</p><br>" +
                    "验证码：<span style="+"color:blue;>"+verf+"</span>",true);//邮件的文本内容，true表示文本以html格式打开
            javaMailSender.send(mMessage);//发送邮件
        } catch (MessagingException e) {
            e.printStackTrace();
            return Msg.fail();
        } catch (IOException e) {
            e.printStackTrace();
            return Msg.fail();
        }
        return Msg.success().add("verf", verf);
	}
	
	/**
	 * 发送邮件测试
	 * @return
	 */
    @RequestMapping("sendTest")
    public Msg sendMail03(){
        MimeMessage mMessage=javaMailSender.createMimeMessage();//创建邮件对象
        MimeMessageHelper mMessageHelper;
        Properties prop = new Properties();
        String from;
        try {
            //从配置文件中拿到发件人邮箱地址
            prop.load(this.getClass().getResourceAsStream("/mail.properties"));
            from = prop.get("mail.smtp.username")+"";
            mMessageHelper=new MimeMessageHelper(mMessage,true);
            mMessageHelper.setFrom(from);//发件人邮箱
            mMessageHelper.setTo("976441790@qq.com");//收件人邮箱
            mMessageHelper.setSubject("Spring的邮件发送");//邮件的主题
            mMessageHelper.setText("<p>这是使用spring的邮件功能发送的一封邮件</p><br/>" +
                    "<a href='https://blog.csdn.net/'>打开CSDN主页</a><br/>",true);//邮件的文本内容，true表示文本以html格式打开
            javaMailSender.send(mMessage);//发送邮件
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return Msg.success();
    }
}
