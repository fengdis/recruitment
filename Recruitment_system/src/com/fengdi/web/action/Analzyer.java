package com.fengdi.web.action;

import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.tokenattributes.CharTermAttribute;
import org.wltea.analyzer.cfg.Configuration;
import org.wltea.analyzer.cfg.DefaultConfig;
import org.wltea.analyzer.dic.Dictionary;
import org.wltea.analyzer.lucene.IKAnalyzer;

/***
 * 
 * @描述 : 智能分词类
 * @创建者：fengdi
 * @创建时间： 2017年3月17日下午2:43:18
 *
 */
public class Analzyer {
	private static Dictionary dictionary;

	static {
		// Configuration cfg = MyDefaultConfig.getInstance();
		Configuration cfg = DefaultConfig.getInstance();
		// 加载词库
		cfg.setUseSmart(true); // 设置智能分词
		Dictionary.initial(cfg);

		dictionary = Dictionary.getSingleton();
	}

	private static void addWord(String word) {
		List<String> ext = new ArrayList<String>();
		ext.add(word);
		dictionary.addWords(ext);
	}

	public static void removeWord(String word) {
		List<String> ext = new ArrayList<String>();
		ext.add(word);
		dictionary.disableWords(ext);
	}

	public static List<String> getWordsList(String text) {
		List<String> retList = new ArrayList<String>();
		// 创建分词对象
		StringReader reader = null;
		Analyzer anal = new IKAnalyzer(true);
		try {
			reader = new StringReader(text);
			// 分词
			TokenStream ts = anal.tokenStream("", reader);
			ts.reset();
			CharTermAttribute term = ts.getAttribute(CharTermAttribute.class);
			// 遍历分词数据
			while (ts.incrementToken()) {
				String temp = term.toString();
				if (temp.length() >= 2) {
					retList.add(temp);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				reader.close();
			} catch (Exception e) {
			}
			try {
				anal.close();
			} catch (Exception e) {
			}
		}
		return retList;
	}

	public static void main(String[] args) {
		addWord("中华人");
		removeWord("中华");
		System.out.println(getWordsList("中华人民共和国华人华人"));
		//System.out.println(getWordsList("中华人民共和国人华人华人达斯柯达回来卡里的好啦赫迪拉的话阿好得很阿达"));
	}
}
