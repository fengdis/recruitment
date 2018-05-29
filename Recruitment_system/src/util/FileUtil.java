package util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

/***
 *  
 * @描述 : 文件工具类 
 * @创建者：fengdi
 * @创建时间： 2016年11月17日上午11:11:04
 *
 */
public class FileUtil {
	public static String readFile(String filepath, String encoding) {
		String ret = null;

		File file = new File(filepath);
		BufferedReader reader = null;
		try {
			reader = new BufferedReader(new FileReader(file));
			String tempString = null;
			while ((tempString = reader.readLine()) != null) {
				ret += tempString;
			}
			reader.close();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e1) {
				}
			}
		}

		return ret;
	}
}
