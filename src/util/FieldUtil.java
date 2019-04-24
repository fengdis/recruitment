package util;

import java.lang.reflect.Field;

/***
 *  
 * @描述 : field转换工具类 
 * @创建者：fengdi
 * @创建时间： 2016年11月17日上午11:11:04
 *
 */
public class FieldUtil {
	/**
	 * 把fieldValue转换为c类中fieldName属性对应的类型
	 * 
	 * @param c
	 * @param fieldName
	 * @param fieldValue
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	public static Object format(Class c, String fieldName, String fieldValue) throws Exception {
		Field f = null;
		if (fieldName.contains(".")) {
			String[] ary = fieldName.split("\\.");
			Class tempclass = c;
			for (int i = 0; i < ary.length - 1; i++) {
				f = tempclass.getDeclaredField(ary[i]);
				tempclass = f.getType();
			}
			f = tempclass.getDeclaredField(ary[ary.length - 1]);
		} else {
			f = c.getDeclaredField(fieldName);
		}

		String type = f.getType().getSimpleName();
		if (type.equals("int") || type.equals("Integer")) {
			return Integer.valueOf(fieldValue);
		} else if (type.equals("long") || type.equals("Long")) {
			return Long.valueOf(fieldValue);
		} else if (type.equals("float") || type.equals("Float")) {
			return Float.valueOf(fieldValue);
		} else if (fieldName.endsWith("Time") || fieldName.endsWith("Date")) {
			return fieldValue;
		} else {
			return "%" + fieldValue + "%";
		}
	}

}
