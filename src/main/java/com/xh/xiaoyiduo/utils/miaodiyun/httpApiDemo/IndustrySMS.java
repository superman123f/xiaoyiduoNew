package com.xh.xiaoyiduo.utils.miaodiyun.httpApiDemo;

import com.xh.xiaoyiduo.utils.miaodiyun.httpApiDemo.common.Config;
import com.xh.xiaoyiduo.utils.miaodiyun.httpApiDemo.common.HttpUtil;

import java.net.URLEncoder;


/**
 * 验证码通知短信接口
 * 
 * @ClassName: IndustrySMS
 * @Description: 验证码通知短信接口
 *
 */
public class IndustrySMS
{
	private static String operation = "/industrySMS/sendSMS";

	private static String accountSid = Config.ACCOUNT_SID;
//	private static String to = "15019187652";
//	private static String smsContent = "【秒嘀科技】您的验证码是345678，30分钟输入有效。";
//	private static String smsContent = "【途乐行】您的验证码为345678，请于30分钟内正确输入，如非本人操作，请忽略此短信。";


	/**
	 * 验证码通知短信
	 */
	public static void execute(String phoneNumber, int random)
	{
		String to = phoneNumber;
		System.out.println("手机号为" + to);
		String smsContent = "【途乐行】您的验证码为" + random + "，请于30分钟内正确输入，如非本人操作，请忽略此短信。";
		System.out.println("短信内容为" + smsContent);
		String tmpSmsContent = null;
	    try{
	      tmpSmsContent = URLEncoder.encode(smsContent, "UTF-8");
	    }catch(Exception e){
	      
	    }
	    String url = Config.BASE_URL + operation;
	    String body = "accountSid=" + accountSid + "&to=" + to + "&smsContent=" + tmpSmsContent
	        + HttpUtil.createCommonParam();

	    // 提交请求
	    String result = HttpUtil.post(url, body);
	    System.out.println("result:" + System.lineSeparator() + result);
	}
}
