<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.article" ValidateRequest="false" %>
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
	const string channel = "news";

	templateBuilder.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>新闻资讯 - ");
	templateBuilder.Append(Utils.ObjectToStr(site.name));
	templateBuilder.Append("</title>\r\n<meta name=\"keywords\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_keyword));
	templateBuilder.Append("\" />\r\n<meta name=\"description\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_description));
	templateBuilder.Append("\" />\r\n<link href=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/css/style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/jquery-1.11.2.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/jquery.flexslider-min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/common.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\">\r\n$(function(){\r\n	$(\".focusbox\").flexslider({\r\n		directionNav: false,\r\n		pauseOnAction: false\r\n	});\r\n});\r\n</");
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


	templateBuilder.Append("\r\n<!--/Header-->\r\n\r\n<div class=\"section clearfix\">\r\n  <div class=\"line15\"></div>\r\n  <!--焦点图-->\r\n  <div class=\"wrapper clearfix\">\r\n    <div class=\"main-left\">\r\n      <div class=\"focusbox\">\r\n        <ul class=\"slides\">\r\n          ");
	DataTable focusList = get_article_list(channel, 0, 8, "status=0 and is_slide=1 and img_url<>''");

	foreach(DataRow dr in focusList.Rows)
	{

	templateBuilder.Append("\r\n          <li>\r\n            <a title=\"" + Utils.ObjectToStr(dr["title"]) + "\" href=\"");
	templateBuilder.Append(linkurl("news_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\">\r\n              <span class=\"note-bg\"></span>\r\n              <span class=\"note-txt\">" + Utils.ObjectToStr(dr["title"]) + "</span>\r\n              <img src=\"" + Utils.ObjectToStr(dr["img_url"]) + "\" />\r\n            </a>\r\n          </li>\r\n          ");
	}	//end for if

	templateBuilder.Append("\r\n        </ul>\r\n      </div>\r\n    </div>\r\n    <!--/焦点图-->\r\n    \r\n    <!--最新资讯-->\r\n    <div class=\"main-left\" style=\"margin-right:0;\">\r\n      <ul class=\"txt-list\">\r\n        ");
	DataTable newsList = get_article_list(channel, 0, 9, "status=0");

	int newdr__loop__id=0;
	foreach(DataRow newdr in newsList.Rows)
	{
		newdr__loop__id++;


	if (newdr__loop__id==1)
	{

	templateBuilder.Append("\r\n        <li class=\"tit\">\r\n        ");
	}
	else
	{

	templateBuilder.Append("\r\n        <li>\r\n         <span>");	templateBuilder.Append(Utils.ObjectToDateTime(Utils.ObjectToStr(newdr["add_time"])).ToString("MM-dd"));

	templateBuilder.Append("</span>\r\n        ");
	}	//end for if

	templateBuilder.Append("\r\n          <a title=\"" + Utils.ObjectToStr(newdr["title"]) + "\" href=\"");
	templateBuilder.Append(linkurl("news_show",Utils.ObjectToStr(newdr["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(newdr["title"]) + "</a>\r\n        </li>\r\n        ");
	}	//end for if

	templateBuilder.Append("\r\n      </ul>\r\n    </div>\r\n    <!--/最新资讯-->\r\n    \r\n    <!--头条资讯-->\r\n    <div class=\"sidebar-right\" style=\"margin-left:15px;\">\r\n      <ul class=\"img-list ilist\">\r\n        ");
	DataTable topList = get_article_list(channel, 0, 2, "status=0 and is_top=1 and img_url<>''");

	foreach(DataRow dr in topList.Rows)
	{

	templateBuilder.Append("\r\n        <li>\r\n          <a title=\"" + Utils.ObjectToStr(dr["title"]) + "\" href=\"");
	templateBuilder.Append(linkurl("news_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\">\r\n            ");
	if (Utils.ObjectToStr(dr["is_top"])=="1")
	{

	templateBuilder.Append("\r\n            <span class=\"abs-txt\">头条</span>\r\n            ");
	}	//end for if

	templateBuilder.Append("\r\n            <span class=\"abs-bg\"></span>\r\n            <span class=\"txt1\">" + Utils.ObjectToStr(dr["title"]) + "</span>\r\n            <span class=\"txt2\">\r\n              <i>");	templateBuilder.Append(Utils.ObjectToDateTime(Utils.ObjectToStr(dr["add_time"])).ToString("MM-dd"));

	templateBuilder.Append("</i>\r\n              <p>" + Utils.ObjectToStr(dr["zhaiyao"]) + "</p>\r\n            </span>\r\n            <img src=\"" + Utils.ObjectToStr(dr["img_url"]) + "\" />\r\n          </a>\r\n        </li>\r\n        ");
	}	//end for if

	templateBuilder.Append("\r\n      </ul>\r\n    </div>\r\n    <!--/头条资讯-->\r\n    \r\n  </div>\r\n</div>\r\n\r\n<!--分类资讯-->\r\n");
	DataTable categoryList = get_category_child_list(channel,0);

	foreach(DataRow cdr in categoryList.Rows)
	{

	templateBuilder.Append("\r\n<div class=\"section clearfix\">\r\n  <div class=\"ntitle\">\r\n    <h2>\r\n      <a href=\"");
	templateBuilder.Append(linkurl("news_list",Utils.ObjectToStr(cdr["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(cdr["title"]) + "<em></em></a>\r\n    </h2>\r\n    <p>\r\n      <!--小类-->\r\n      ");
	DataTable bcategoryList = get_category_child_list(channel,Utils.StrToInt(Utils.ObjectToStr(cdr["id"]), 0));

	int cdr2__loop__id=0;
	foreach(DataRow cdr2 in bcategoryList.Rows)
	{
		cdr2__loop__id++;


	if (cdr2__loop__id==1)
	{

	templateBuilder.Append("\r\n      <a class=\"no-bg\" href=\"");
	templateBuilder.Append(linkurl("news_list",Utils.ObjectToStr(cdr2["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(cdr2["title"]) + "</a>\r\n      ");
	}
	else
	{

	templateBuilder.Append("\r\n      <a href=\"");
	templateBuilder.Append(linkurl("news_list",Utils.ObjectToStr(cdr2["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(cdr2["title"]) + "</a>\r\n      ");
	}	//end for if

	}	//end for if

	templateBuilder.Append("\r\n    </p>\r\n  </div>\r\n  \r\n  <div class=\"wrapper clearfix\">\r\n    <div class=\"sidebar-left\">\r\n      <div class=\"t-list\">\r\n        <ul>\r\n          ");
	DataTable dt = get_article_list(channel, Utils.StrToInt(Utils.ObjectToStr(cdr["id"]), 0), 4, "status=0 and img_url<>''");

	foreach(DataRow dr1 in dt.Rows)
	{

	templateBuilder.Append("\r\n          <li>\r\n            <a class=\"img-box\" title=\"" + Utils.ObjectToStr(dr1["title"]) + "\" href=\"");
	templateBuilder.Append(linkurl("news_show",Utils.ObjectToStr(dr1["id"])));

	templateBuilder.Append("\">\r\n              <img src=\"" + Utils.ObjectToStr(dr1["img_url"]) + "\" border=\"0\">\r\n            </a>\r\n            <h3><a title=\"" + Utils.ObjectToStr(dr1["title"]) + "\" href=\"");
	templateBuilder.Append(linkurl("news_show",Utils.ObjectToStr(dr1["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(dr1["title"]) + "</a></h3>\r\n            <p>" + Utils.ObjectToStr(dr1["zhaiyao"]) + "</p>\r\n            <i>" + Utils.ObjectToStr(dr1["add_time"]) + "</i>\r\n          </li>\r\n          ");
	}	//end for if

	templateBuilder.Append("\r\n        </ul>\r\n      </div>\r\n    </div>\r\n    \r\n    <div class=\"sidebar-right\" style=\"padding-top:10px;\">\r\n      <ul class=\"rank-list\">\r\n        ");
	DataTable hotList = get_article_list(channel, Utils.StrToInt(Utils.ObjectToStr(cdr["id"]), 0), 10, "status=0", "click desc,id desc");

	int dr2__loop__id=0;
	foreach(DataRow dr2 in hotList.Rows)
	{
		dr2__loop__id++;


	if (dr2__loop__id==1)
	{

	templateBuilder.Append("\r\n            <li class=\"active\">\r\n          ");
	}
	else
	{

	templateBuilder.Append("\r\n            <li>\r\n          ");
	}	//end for if

	templateBuilder.Append("\r\n          <span>");	templateBuilder.Append(Utils.ObjectToDateTime(Utils.ObjectToStr(dr2["add_time"])).ToString("MM-dd"));

	templateBuilder.Append("</span>\r\n          <i class=\"num\">");
	templateBuilder.Append(Utils.ObjectToStr(dr2__loop__id));
	templateBuilder.Append("</i>\r\n          <a href=\"");
	templateBuilder.Append(linkurl("news_show",Utils.ObjectToStr(dr2["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(dr2["title"]) + "</a>\r\n        </li>\r\n        ");
	}	//end for if

	templateBuilder.Append("\r\n      </ul>\r\n    </div>\r\n    \r\n  </div>\r\n</div>\r\n");
	}	//end for if

	templateBuilder.Append("\r\n<!--分类资讯-->\r\n\r\n<!--Footer-->\r\n");

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
