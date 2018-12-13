package com.xh.xiaoyiduo.utils.miaodiyun.httpApiDemo;

public class Test
{

	/**
	 * @param args
	 */
	public static void main(String[] args)
	{
		String phoneNumber = "15019187652";
		int random = (int)((Math.random()*9+1) * 100000);
		// 获取开发者账号信息
		 AccountInfo.execute();

		// 验证码通知短信接口
		 IndustrySMS.execute(phoneNumber, random);

		// 会员营销短信接口
		// AffMarkSMS.execute();

		// 语音验证码
//		 VoiceCode.execute();

	}
}
