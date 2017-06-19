<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.search" ValidateRequest="false" %>
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

	templateBuilder.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>站内搜索 - ");
	templateBuilder.Append(Utils.ObjectToStr(config.webname));
	templateBuilder.Append("</title>\r\n<meta name=\"keywords\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_keyword));
	templateBuilder.Append("\" />\r\n<meta name=\"description\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(site.seo_description));
	templateBuilder.Append("\" />\r\n<link href=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("css/pagination.css\" rel=\"stylesheet\" /> \r\n		<link href=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/css/base.css\" type=\"text/css\" rel=\"stylesheet\">\r\n		<link href=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/css/mmm.css\" type=\"text/css\" rel=\"stylesheet\">\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/jquery-1.11.2.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/common.js\"></");
	templateBuilder.Append("script>\r\n		<script type=\"text/javascript\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/lrtk.js\"></");
	templateBuilder.Append("script>\r\n        <style>\r\n        .ntitle {\r\n    margin: 0 auto;\r\n    padding: 30px 0 0;\r\n    width: 100%;\r\n}\r\n.ntitle h2 {\r\n    display: inline-block;\r\n    float: left;\r\n    padding-right: 10px;\r\n    width: auto;\r\n    color: #333;\r\n    font-size: 24px;\r\n    font-weight: 400;\r\n    line-height: 25px;\r\n}\r\n.ntitle h2 a {\r\n    position: relative;\r\n    padding-right: 25px;\r\n    color: #888;\r\n}\r\n.ntitle i {\r\n    display: block;\r\n    padding-top: 10px;\r\n    color: #999;\r\n    font-size: 14px;\r\n    font-style: normal;\r\n    line-height: 1em;\r\n}\r\n.blue {\r\n    color: #1E7BB3;\r\n}\r\n.red {\r\n    color: #F00;\r\n}\r\n        </style>\r\n</head>\r\n\r\n<body>\r\n<!--Header-->\r\n");

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

	templateBuilder.Append("\r\n                    <a href=\"");
	templateBuilder.Append(linkurl("news_list",Utils.ObjectToStr(dcdr1["id"])));

	templateBuilder.Append("\" title=\"" + Utils.ObjectToStr(dcdr1["title"]) + "\">" + Utils.ObjectToStr(dcdr1["title"]) + "</a>\r\n                      ");
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

	templateBuilder.Append("\r\n\r\n                </marquee></div>\r\n			</div>\r\n		</div>\r\n\r\n\r\n<!-- <div class=\"header\">\r\n  <div class=\"header-wrap\">\r\n    <div class=\"section\">\r\n      <div class=\"left-box\">\r\n        <a class=\"logo\" href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">");
	templateBuilder.Append(Utils.ObjectToStr(site.name));
	templateBuilder.Append("</a>\r\n        <p class=\"nav\">\r\n          <a href=\"");
	templateBuilder.Append(linkurl("news"));

	templateBuilder.Append("\">资讯</a>\r\n          <a href=\"");
	templateBuilder.Append(linkurl("goods"));

	templateBuilder.Append("\">商城</a>\r\n          <a href=\"");
	templateBuilder.Append(linkurl("video"));

	templateBuilder.Append("\">视频</a>\r\n          <a href=\"");
	templateBuilder.Append(linkurl("photo"));

	templateBuilder.Append("\">图片</a>\r\n          <a href=\"");
	templateBuilder.Append(linkurl("down"));

	templateBuilder.Append("\">下载</a>\r\n        </p>\r\n      </div>\r\n      <div class=\"search\">\r\n       <input id=\"keywords\" name=\"keywords\" class=\"input\" type=\"text\" onkeydown=\"if(event.keyCode==13){SiteSearch('");
	templateBuilder.Append(linkurl("search"));

	templateBuilder.Append("', '#keywords');return false};\" placeholder=\"输入回车搜索\" x-webkit-speech=\"\" />\r\n        <input class=\"submit\" type=\"submit\" onclick=\"SiteSearch('");
	templateBuilder.Append(linkurl("search"));

	templateBuilder.Append("', '#keywords');\" value=\"搜索\" />\r\n      </div>\r\n      <div class=\"right-box\">\r\n      <script type=\"text/javascript\">\r\n			$.ajax({\r\n				type: \"POST\",\r\n				url: \"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_check_login\",\r\n				dataType: \"json\",\r\n				timeout: 20000,\r\n				success: function (data, textStatus) {\r\n					if (data.status == 1) {\r\n						$(\"#menu\").prepend('<li class=\"line\"><a href=\"");
	templateBuilder.Append(linkurl("usercenter","exit"));

	templateBuilder.Append("\">退出</a></li>');\r\n						$(\"#menu\").prepend('<li class=\"login\"><em></em><a href=\"");
	templateBuilder.Append(linkurl("usercenter","index"));

	templateBuilder.Append("\">会员中心</a></li>');\r\n					} else {\r\n						$(\"#menu\").prepend('<li class=\"line\"><a href=\"");
	templateBuilder.Append(linkurl("register"));

	templateBuilder.Append("\">注册</a></li>');\r\n						$(\"#menu\").prepend('<li class=\"login\"><em></em><a href=\"");
	templateBuilder.Append(linkurl("login"));

	templateBuilder.Append("\">登录</a></li>');\r\n					}\r\n				}\r\n			});\r\n		</");
	templateBuilder.Append("script>\r\n        <ul id=\"menu\">\r\n          <li>\r\n            <a href=\"");
	templateBuilder.Append(linkurl("cart"));

	templateBuilder.Append("\">购物车<span id=\"shoppingCartCount\"><script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=view_cart_count\"></");
	templateBuilder.Append("script></span>件</a>\r\n          </li>\r\n          <li><a href=\"");
	templateBuilder.Append(linkurl("content","contact"));

	templateBuilder.Append("\">联系我们</a></li>\r\n        </ul>\r\n      </div>\r\n    </div>\r\n  </div>\r\n</div>-->");


	templateBuilder.Append("\r\n<!--/Header-->\r\n<div class=\"content\">\r\n <!--取得一个DataTable-->\r\n    ");
	DataTable list = get_search_list(15, out totalcount);

	templateBuilder.Append("\r\n    <!--取得分页页码列表-->\r\n    ");
	 pagelist = get_page_link(15, page, totalcount, linkurl("search","?channel=" + channel + "&category_id="+category_id+"&keyword=" + Server.UrlEncode(keyword) + "&page=__id__"));

	templateBuilder.Append("\r\n			<div class=\"m-task\">\r\n				<div class=\"m-task-search\" style=\"padding: 10px 0 30px 100px;\">\r\n					<div class=\"ntitle\">\r\n      <h2><a>站内搜索</a></h2>\r\n      <i>搜索关健字： <b class=\"blue\">");
	templateBuilder.Append(Utils.ObjectToStr(keyword));
	templateBuilder.Append("</b> ，共有 <b class=\"red\">");
	templateBuilder.Append(Utils.ObjectToStr(totalcount));
	templateBuilder.Append("</b> 条记录</i>\r\n    </div>\r\n				</div>\r\n				<div class=\"m-task-list\">\r\n					<ul>\r\n                    ");
	foreach(DataRow dr in list.Rows)
	{

	if (category_id=="52")
	{

	templateBuilder.Append(" \r\n						<li>\r\n							<div class=\"name\">任务序号：<span class=\"na\">" + Utils.ObjectToStr(dr["title"]) + "</span></div>\r\n							<div class=\"text\"><textarea id=\"content1\" readonly=\"readonly\">" + Utils.ObjectToStr(dr["job_url"]) + "</textarea></div>\r\n							<div class=\"btn layout\">\r\n                            ");
	List<DTcms.Model.article_attach> article_attach = GetArticle_Attach(Utils.ObjectToStr(dr["id"]));

	if (article_attach!=null)
	{

	templateBuilder.Append("<div class=\"im\">此任务要上传图片：\r\n      ");
	foreach(DTcms.Model.article_attach modelt in article_attach)
	{

	templateBuilder.Append("\r\n								<a href=\"javascript:;\" onclick=\"downLink(0,'");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/download.ashx?site=");
	templateBuilder.Append(Utils.ObjectToStr(site.build_path));
	templateBuilder.Append("&id=");
	templateBuilder.Append(Utils.ObjectToStr(modelt.id));
	templateBuilder.Append("');\" title=\"");
	templateBuilder.Append(Utils.ObjectToStr(modelt.file_name));
	templateBuilder.Append("\">下载图片：");
	templateBuilder.Append(Utils.ObjectToStr(modelt.file_name));
	templateBuilder.Append("</a>");
	}	//end for if

	templateBuilder.Append("</div>");
	}	//end for if

	templateBuilder.Append("\r\n								<div class=\"bt layout\"><a href=\"" + Utils.ObjectToStr(dr["link_url"]) + "\" class=\"more-btn\" title=\"查看任务教程\">查看任务教程</a><a href=\"javascript:;\" class=\"copy-btn\" onclick=\"jsCopy(1)\" title=\"复制任务链接\">复制任务链接</a></div>\r\n							</div>\r\n						</li> \r\n                     ");
	}
	else
	{

	templateBuilder.Append(" \r\n						<li>\r\n							<div class=\"name\"><span class=\"na\">" + Utils.ObjectToStr(dr["title"]) + "</span></div>\r\n							<div class=\"text\"><textarea id=\"Textarea1\" readonly=\"readonly\">" + Utils.ObjectToStr(dr["remark"]) + "</textarea></div> \r\n                            <div class=\"btn layout\"> \r\n								<div class=\"bt layout\"><a href=\"" + Utils.ObjectToStr(dr["link_url"]) + "\" class=\"more-btn\" title=\"查看新闻\">查看新闻</a> </div>\r\n							</div>\r\n						</li> \r\n                        ");
	}	//end for if

	}	//end for if

	if (totalcount==0)
	{

	templateBuilder.Append("\r\n      <div class=\"nodata\">很抱歉，目前尚未查找到符合条件的信息！</div>\r\n      ");
	}	//end for if

	templateBuilder.Append("\r\n					</ul>\r\n				</div>\r\n			</div>\r\n			<div class=\"content-foot\">\r\n				<div class=\"page\">\r\n					<div class=\"digg\">");
	templateBuilder.Append(Utils.ObjectToStr(pagelist));
	templateBuilder.Append("</div>\r\n				</div>\r\n			</div>\r\n		</div> \r\n<!--Footer-->\r\n");

	templateBuilder.Append("<div class=\"footer\">\r\n			<div class=\"mar-auto\">\r\n				<div class=\"footer-btn\"><a href=\"http://wpa.qq.com/msgrd?v=3&uin=904003962&site=qq&menu=yes\" target=\"_blank\" title=\"\" class=\"link_qq\"></a></div>\r\n				<div class=\"footer-copy\"><span class=\"copy\">Copyright Right © 2016-2020 mmmjiayuan.com </span>&nbsp;&nbsp;&nbsp;免责声明：本站新闻均来源与网络，本站仅供测试和学习交流。</div>\r\n				\r\n			</div>\r\n		</div>\r\n\r\n        <div class=\"go-top dn\" id=\"go-top\">		\r\n		    <a href=\"http://wpa.qq.com/msgrd?v=3&uin=904003962&site=qq&menu=yes\" target=\"_blank\" class=\"feedback\"></a>\r\n		    <a href=\"javascript:;\" class=\"go\"></a>\r\n		</div>\r\n		<!--topgo end-->\r\n		<script type=\"text/javascript\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/time.js\"></");
	templateBuilder.Append("script><!--时间-->\r\n		<script type=\"text/javascript\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/clickCopy.js\"></");
	templateBuilder.Append("script><!--点击复制-->\r\n		<script type=\"text/javascript\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/topgo.js\"></");
	templateBuilder.Append("script><!--返回顶部-->\r\n\r\n\r\n<!--\r\n<div class=\"footer clearfix\">\r\n  <div class=\"foot-nav\">\r\n    <a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">首 页</a>|\r\n    <a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("content","about"));

	templateBuilder.Append("\">关于我们</a>|\r\n    <a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("news"));

	templateBuilder.Append("\">新闻资讯</a>|\r\n    <a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("goods"));

	templateBuilder.Append("\">购物商城</a>|\r\n    <a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("video"));

	templateBuilder.Append("\">视频专区</a>|\r\n    <a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("down"));

	templateBuilder.Append("\">资源下载</a>|\r\n    <a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("photo"));

	templateBuilder.Append("\">图片分享</a>|\r\n    <a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("feedback"));

	templateBuilder.Append("\">留言反馈</a>|\r\n    <a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("link"));

	templateBuilder.Append("\">友情链接</a>|\r\n    <a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("content","contact"));

	templateBuilder.Append("\">联系我们</a>\r\n  </div>\r\n  <div class=\"copyright\">\r\n    <p>版权所有 ");
	templateBuilder.Append(site.company.ToString());

	templateBuilder.Append(" 粤ICP备11064298号 DTcms版本号：");
	templateBuilder.Append(Utils.GetVersion().ToString());

	templateBuilder.Append("</p>\r\n    <p>Copyright &copy; 2009-2015 dtcms.net Corporation,All Rights Reserved.</p>\r\n    <p><script src=\"http://s24.cnzz.com/stat.php?id=1996164&web_id=1996164&show=pic\" language=\"javascript\"></");
	templateBuilder.Append("script></p>\r\n  </div>\r\n</div>-->");


	templateBuilder.Append("\r\n<!--/Footer-->\r\n</body>\r\n</html>");
	Response.Write(templateBuilder.ToString());
}
</script>
