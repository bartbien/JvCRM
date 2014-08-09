package com.phoenixjcam.tags;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class NavigationPanel extends SimpleTagSupport
{
	private String action;
	private Integer pageNumber;
	private Integer pagesCount;
	private Integer pageSize;

	public void setAction(String action)
	{
		this.action = action;
	}

	public void setPageNumber(Integer pageNumber)
	{
		this.pageNumber = pageNumber;
	}

	public void setPagesCount(Integer pagesCount)
	{
		this.pagesCount = pagesCount;
	}
	
	public void setPageSize(Integer pageSize)
	{
		this.pageSize = pageSize;
	}

	public void doTag() throws JspException, IOException
	{
		JspWriter out = this.getJspContext().getOut();
		
		String script = "<script>"
			+ "function goBack(form)"
			+ "{"
			+ "  var number = parseInt(form.pageNumber.value);"
			+ "  if(number > 1)"
			+ "  {"
			+ "    form.pageNumber.value = number - 1;"
			+ "    return true;"
			+ "  }"
			+ "  return false;"
			+ "}"
			+ "function goNext(form)"
			+ "{"
			+ "  form.pageNumber.value = parseInt(form.pageNumber.value) + 1;"
			+ "  return true;"
			+ "}"
			+ "</script>";
		
		out.println(script);
		
		out.println("<div class=\"navigator\">");
		out.println("<form action=\"" + this.action + "\">");
		out.println("   <input type=\"hidden\" name=\"pageSize\"  value=\"" + this.pageSize + "\">");
		out.println("	<input type=\"submit\" value=\"<<\" onclick=\"return goBack(this.form);\" />");
		out.println("	<input name=\"pageNumber\" value=\"" + this.pageNumber + "\" />");
		out.println("	<label>/</label>");
		out.println("	<input value=\"" + this.pagesCount + "\" readonly />");
		out.println("	<input type=\"submit\" value=\">>\" onclick=\"return goNext(this.form);\" />");
		out.println("</form>");
		out.println("</div>");
	}
}
