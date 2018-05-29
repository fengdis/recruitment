package  util;

import java.util.LinkedList;

/***
 *  
 * @描述 : 用户高级搜索的参数记录工具类 
 * @创建者：fengdi
 * @创建时间： 2016年11月17日上午11:11:04
 *
 */
public class SearchParamBean {

	private LinkedList<String> parmnames;// 参数名称
	private LinkedList<Object> parmvalues;// 参数值

	public LinkedList<String> getParmnames() {
		return parmnames;
	}

	public void setParmnames(LinkedList<String> parmnames) {
		this.parmnames = parmnames;
	}

	public LinkedList<Object> getParmvalues() {
		return parmvalues;
	}

	public void setParmvalues(LinkedList<Object> parmvalues) {
		this.parmvalues = parmvalues;
	}

}
