<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.oauth_login" ValidateRequest="false" %>
<%@ Import namespace="System.Collections.Generic" %>
<%@ Import namespace="System.Text" %>
<%@ Import namespace="System.Data" %>
<%@ Import namespace="DTcms.Common" %>

<script runat="server">
override protected void OnInit(EventArgs e)
{

	/* 
		. 
	*/

	base.OnInit(e);
	StringBuilder templateBuilder = new StringBuilder(220000);

	templateBuilder.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>合作网站登录 - ");
	templateBuilder.Append(Utils.ObjectToStr(site.name));
	templateBuilder.Append("</title>\r\n<meta name=\"keywords\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_keyword));
	templateBuilder.Append("\" />\r\n<meta name=\"description\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_description));
	templateBuilder.Append("\" />\r\n<link href=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/artdialog/ui-dialog.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n<link href=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("css/validate.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n<link href=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/css/style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/jquery-1.11.2.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/jquery.form.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/Validform_v5.3.2_min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/artdialog/dialog-plus-min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/common.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\">\r\n$(function(){\r\n	tabs('#oauthTabs','click');\r\n	//初始化表单1\r\n	AjaxInitForm('#bindForm', '#btnSubmit1', 0, '#turl');\r\n	//初始化表单2\r\n	AjaxInitForm('#oauthForm', '#btnSubmit2', 0, '#turl');\r\n});\r\n</");
	templateBuilder.Append("script>\r\n</head>\r\n\r\n<body>\r\n<!--Header-->\r\n");

	templateBuilder.Append("<div class=\"header\">\r\n			<div class=\"mar-auto layout\">\r\n				<h1><a href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\" title=\"");
	templateBuilder.Append(config.webname.ToString());

	templateBuilder.Append("\"><img src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/images/logo.png\" title=\"");
	templateBuilder.Append(config.webname.ToString());

	templateBuilder.Append("\"></a></h1>\r\n				<div class=\"header-nav layout\">\r\n					<a href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\" title=\"\" class=\"on\">家园首页</a>\r\n                    ");
	DataTable downCList1 = get_category_child_list("down",0);

	int dcdr1__loop__id=0;
	foreach(DataRow dcdr1 in downCList1.Rows)
	{
		dcdr1__loop__id++;


	if (Utils.ObjectToStr(dcdr1["id"])!="55")
	{

	if (Utils.ObjectToStr(dcdr1["id"])=="54")
	{

	templateBuilder.Append("\r\n                         <a href=\"");
	templateBuilder.Append(linkurl("index1","28"));

	templateBuilder.Append("\" title=\"" + Utils.ObjectToStr(dcdr1["title"]) + "\">" + Utils.ObjectToStr(dcdr1["title"]) + "</a>\r\n                         ");
	}
	else
	{

	templateBuilder.Append("\r\n                    <a href=\"");
	templateBuilder.Append(linkurl("news_list",Utils.ObjectToStr(dcdr1["id"])));

	templateBuilder.Append("\" title=\"" + Utils.ObjectToStr(dcdr1["title"]) + "\">" + Utils.ObjectToStr(dcdr1["title"]) + "</a>\r\n                     ");
	}	//end for if

	}	//end for if

	}	//end for if

	templateBuilder.Append(" \r\n				</div>\r\n			</div>\r\n		</div>\r\n		<!--header end-->\r\n		<div class=\"nav\">\r\n			<div class=\"mar-auto layout\">\r\n				<div class=\"date\">\r\n					<span id=\"dateName\"></span>\r\n				</div>\r\n				<div class=\"notice layout\"><span class=\"font\">公告：</span><marquee loop=\"-1\" direction=\"right\" scrollamount=\"2\">\r\n                ");
	DataTable focusNews = get_article_list("down", 55, 8, "status=0");

	foreach(DataRow dr in focusNews.Rows)
	{

	templateBuilder.Append("\r\n                <a href=\"");
	templateBuilder.Append(linkurl("news_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(dr["title"]) + "<span class=\"time\">[");	templateBuilder.Append(Utils.ObjectToDateTime(Utils.ObjectToStr(dr["add_time"])).ToString("yyyy-MM-dd"));

	templateBuilder.Append("]</span></a>\r\n          ");
	}	//end for if

	templateBuilder.Append("\r\n\r\n                </marquee></div>\r\n			</div>\r\n		</div>\r\n\r\n\r\n ");


	templateBuilder.Append("\r\n<!--/Header-->\r\n\r\n<div class=\"main-box\">\r\n  <div class=\"section clearfix\">\r\n    <div class=\"main-tit\">\r\n      <h2>合作网站登录</h2>\r\n    </div>\r\n    <div id=\"oauthTabs\" class=\"inner-box\">\r\n      <!--选项卡-->\r\n      <div id=\"tabHead\" class=\"tab-head\">\r\n        <ul>\r\n          <li>\r\n            <a class=\"selected\" href=\"javascript:;\">绑定已有的账号</a>\r\n          </li>\r\n          <li>\r\n            <a href=\"javascript:;\">创建新的账号</a>\r\n          </li>\r\n        </ul>\r\n      </div>\r\n      <!--/选项卡-->\r\n      \r\n      <!--选项内容-->\r\n      <form name=\"bindForm\" id=\"bindForm\" url=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_oauth_bind\">\r\n      <div class=\"dl-list tab-content\" style=\"display:block;\">\r\n        <dl>\r\n          <dt>用户名：</dt>\r\n          <dd><input name=\"txtUserName\" type=\"text\" class=\"input txt\" datatype=\"*\"  nullmsg=\"请输入用户名\" sucmsg=\" \" /></dd>\r\n        </dl>\r\n        <dl>\r\n          <dt>密　码：</dt>\r\n          <dd><input name=\"txtPassword\" type=\"password\" class=\"input txt\" datatype=\"*6-20\"  nullmsg=\"请输入密码\" sucmsg=\" \" /></dd>\r\n        </dl>\r\n        <dl>\r\n          <dt></dt>\r\n          <dd><input id=\"btnSubmit1\" name=\"btnSubmit1\" type=\"submit\" class=\"btn\" value=\"立即绑定\" /></dd>\r\n        </dl>\r\n      </div>\r\n      </form>\r\n      \r\n      <form name=\"oauthForm\" id=\"oauthForm\" url=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_oauth_register\">\r\n      <div class=\"dl-list tab-content\">\r\n        <dl>\r\n          <dt>电子邮箱：</dt>\r\n          <dd><input name=\"txtEmail\" type=\"text\" class=\"input txt\" datatype=\"e\"  nullmsg=\"请输入邮箱地址\" sucmsg=\" \" /></dd>\r\n        </dl>\r\n        <dl>\r\n          <dt>手机号码：</dt>\r\n          <dd><input name=\"txtMobile\" type=\"text\" class=\"input txt\" datatype=\"m\"  nullmsg=\"请输入手机号码\" sucmsg=\" \" /></dd>\r\n        </dl>\r\n        <dl>\r\n          <dt>登录密码：</dt>\r\n          <dd><input name=\"txtPassword\" type=\"password\" class=\"input txt\" datatype=\"*6-20\"  nullmsg=\"请设置密码\" sucmsg=\" \" /></dd>\r\n        </dl>\r\n        <dl>\r\n          <dt></dt>\r\n          <dd><input id=\"btnSubmit2\" name=\"btnSubmit1\" type=\"submit\" class=\"btn\" value=\"创建新账户\" /></dd>\r\n        </dl>\r\n      </div>\r\n      </form>\r\n      <!--/选项内容-->\r\n      <input id=\"turl\" name=\"turl\" type=\"hidden\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(turl));
	templateBuilder.Append("\" />\r\n    </div>\r\n    \r\n  </div>\r\n</div>\r\n\r\n<!--Footer-->\r\n");

	templateBuilder.Append("<div class=\"footer\">\r\n			<div class=\"mar-auto\">\r\n				<div class=\"footer-btn\"><a href=\"http://wpa.qq.com/msgrd?v=3&uin=904003962&site=qq&menu=yes\" target=\"_blank\" title=\"\" class=\"link_qq\"></a></div>\r\n				<div class=\"footer-copy\"><span class=\"copy\">Copyright Right © 2016-2020 mmmjiayuan.com </span>&nbsp;&nbsp;&nbsp;免责声明：本站新闻均来源与网络，本站仅供测试和学习交流。</div>\r\n				\r\n			</div>\r\n		</div>\r\n\r\n        <div class=\"go-top dn\" id=\"go-top\">		\r\n		    <a href=\"http://wpa.qq.com/msgrd?v=3&uin=904003962&site=qq&menu=yes\" target=\"_blank\" class=\"feedback\"></a>\r\n		    <a href=\"javascript:;\" class=\"go\"></a>\r\n		</div>\r\n		<!--topgo end-->\r\n		<script type=\"text/javascript\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/time.js\"></");
	templateBuilder.Append("script><!--时间-->\r\n		<script type=\"text/javascript\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/clickCopy.js\"></");
	templateBuilder.Append("script><!--点击复制-->\r\n		<script type=\"text/javascript\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/topgo.js\"></");
	templateBuilder.Append("script><!--返回顶部-->\r\n\r\n ");


	templateBuilder.Append("\r\n<!--/Footer-->\r\n</body>\r\n</html>");
	Response.Write(templateBuilder.ToString());
}
</script>
