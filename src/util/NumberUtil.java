package util;

import java.util.regex.Pattern;

/***
 *  
 * @描述 : 字符串判断工具类 
 * @创建者：fengdi
 * @创建时间： 2016年11月17日上午11:11:04
 *
 */
public class NumberUtil {
	private static Pattern pattern = Pattern.compile("[0-9]*");
	/**
	 * 判断字符串是否为数字
	 * @param str 
	 * @return
	 */
	public static boolean isNumeric(String str) {
		return pattern.matcher(str).matches();
	}
}
