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

	templateBuilder.Append("<!DOCTYPE html>\r\n<html>\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>站内搜索 - ");
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


	templateBuilder.Append("\r\n<!--/Header-->\r\n<div class=\"content\">\r\n <!--取得一个DataTable-->\r\n    ");
	DataTable list = get_search_list(15, out totalcount);

	if (category_id=="52")
	{

	templateBuilder.Append(" \r\n    <!--取得分页页码列表-->\r\n    ");
	 pagelist = get_page_link(15, page, totalcount, linkurl("search","?channel=" + channel + "&category_id="+category_id+"&keyword=" + Server.UrlEncode(keyword) + "&page=__id__"));

	templateBuilder.Append("\r\n			<div class=\"m-task\">\r\n				<div class=\"m-task-search\" style=\"padding: 10px 0 30px 100px;\">\r\n					<div class=\"btn\"> \r\n                    <input id=\"keywords\" name=\"keywords\" class=\"input\" type=\"text\" onclick=\"this.className='sea-color';this.value='';\" onkeydown=\"if(event.keyCode==13){SiteSearch('");
	templateBuilder.Append(linkurl("search"));

	templateBuilder.Append("', '#keywords','down','52');return false};\" value=\"搜索任务序列号，如：2915\" x-webkit-speech=\"\" /><button class=\"submit\" type=\"submit\" onclick=\"SiteSearch('");
	templateBuilder.Append(linkurl("search"));

	templateBuilder.Append("', '#keywords','down','52');\" >搜  索</button>\r\n\r\n                    </div>\r\n					<div class=\"infor\">链接为他人完成后的链接，您的任务答案链接可用他人的替代！</div>\r\n				</div>\r\n				<div class=\"m-task-list\">\r\n					<ul>\r\n                     ");
	var i = 0;

	foreach(DataRow dr in list.Rows)
	{

	 i = i+1;

	templateBuilder.Append("\r\n						<li>\r\n							<div class=\"name\">任务序号：<span class=\"na\">" + Utils.ObjectToStr(dr["title"]) + "</span></div>\r\n							<div class=\"text\"><textarea id=\"content");
	templateBuilder.Append(Utils.ObjectToStr(i));
	templateBuilder.Append("\" readonly=\"readonly\">" + Utils.ObjectToStr(dr["job_url"]) + "</textarea></div>\r\n							<div class=\"btn layout\">\r\n                            ");
	List<DTcms.Model.article_attach> article_attach = GetArticle_Attach(Utils.ObjectToStr(dr["id"]));

	if (article_attach!=null && article_attach.Count()>0)
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

	templateBuilder.Append("\r\n								<div class=\"bt layout\"><a href=\"" + Utils.ObjectToStr(dr["link_url"]) + "\" class=\"more-btn\" title=\"查看任务教程\">查看任务教程</a><a href=\"javascript:;\" class=\"copy-btn\" onclick=\"jsCopy(");
	templateBuilder.Append(Utils.ObjectToStr(i));
	templateBuilder.Append(")\" title=\"复制任务链接\">复制任务链接</a></div>\r\n							</div>\r\n						</li> \r\n                        ");
	}	//end for if

	if (totalcount==0)
	{

	templateBuilder.Append("\r\n      <div class=\"nodata\">很抱歉，目前尚未查找到符合条件的信息！</div>\r\n      ");
	}	//end for if

	templateBuilder.Append("\r\n					</ul>\r\n				</div>\r\n			</div>\r\n    ");
	}
	else
	{

	templateBuilder.Append("\r\n    \r\n    <div class=\"content-top layout\">\r\n				<div class=\"content-top-tab layout\">\r\n					<ul>\r\n						<li ");
	if (category_id=="0")
	{

	templateBuilder.Append(" class=\"on\"");
	}	//end for if

	templateBuilder.Append("><a href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\" title=\"全部\">全部</a></li>\r\n                        ");
	DataTable downCList = get_category_child_list("down",54);

	int dcdr__loop__id=0;
	foreach(DataRow dcdr in downCList.Rows)
	{
		dcdr__loop__id++;


	templateBuilder.Append("\r\n                        <li ");
	if (category_id.ToString()==Utils.ObjectToStr(dcdr["id"]))
	{

	templateBuilder.Append(" class=\"on\"");
	}	//end for if

	templateBuilder.Append("><a href=\"");
	templateBuilder.Append(linkurl("index1",Utils.ObjectToStr(dcdr["id"])));

	templateBuilder.Append("\" title=\"" + Utils.ObjectToStr(dcdr["title"]) + "\">" + Utils.ObjectToStr(dcdr["title"]) + "</a></li>  \r\n                        ");
	}	//end for if

	templateBuilder.Append(" \r\n					</ul>\r\n				</div>\r\n				<div class=\"content-top-search\">\r\n                <input id=\"keywords1\" name=\"keywords\" type=\"text\" onclick=\"this.className='sea-color';this.value='';\" onkeydown=\"if(event.keyCode==13){SiteSearch('");
	templateBuilder.Append(linkurl("search"));

	templateBuilder.Append("', '#keywords1','down','54');return false};\" value=\"输入回车搜索\" x-webkit-speech=\"\" /><button class=\"submit\" type=\"submit\" onclick=\"SiteSearch('");
	templateBuilder.Append(linkurl("search"));

	templateBuilder.Append("', '#keywords1','down','54');\" >SEARCH</button> \r\n                </div>\r\n			</div>\r\n			<div class=\"content-con\">\r\n				<div class=\"news-list layout\">\r\n					<ul>\r\n                    ");
	 pagelist = get_page_link(12, page, totalcount, linkurl("search","?channel=" + channel + "&category_id=54&keyword=" + Server.UrlEncode(keyword) + "&page=__id__"));

	foreach(DataRow dr in list.Rows)
	{

	templateBuilder.Append(" \r\n					    <li class=\"listbox mr20\">\r\n					      <div class=\"listimg\"> <a href=\"");
	templateBuilder.Append(linkurl("news_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\" title=\"" + Utils.ObjectToStr(dr["title"]) + "\" target=\"_blank\"><img src=\"" + Utils.ObjectToStr(dr["img_url"]) + "\" class=\"attachment-thumbnail wp-post-image\" alt=\"" + Utils.ObjectToStr(dr["title"]) + "\" /></a>\r\n					        <div class=\"summary\">\r\n					          <div class=\"summarytxt\">\r\n					            <p>");
	templateBuilder.Append(DTcms.Common.Utils.CutString(DTcms.Common.Utils.DropHTML(Utils.ObjectToStr(dr["remark"])),70).ToString());

	templateBuilder.Append("</p>\r\n					          </div>\r\n					        </div>\r\n					      </div>\r\n					      <div class=\"listinfo layout\">\r\n					        <div class=\"listtitle\"><a href=\"");
	templateBuilder.Append(linkurl("news_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\" title=\"" + Utils.ObjectToStr(dr["title"]) + "\" target=\"_blank\">" + Utils.ObjectToStr(dr["title"]) + "</a></div>\r\n					        <div class=\"listtag\"><span class=\"tag\">" + Utils.ObjectToStr(dr["seo_title"]) + "</span></div>\r\n					        <div class=\"listdate\">");	templateBuilder.Append(Utils.ObjectToDateTime(Utils.ObjectToStr(dr["add_time"])).ToString("yyyy-MM-dd"));

	templateBuilder.Append("</div>\r\n					        <div class=\"listview\">" + Utils.ObjectToStr(dr["click"]) + "</div>\r\n					      </div>\r\n					    </li>\r\n					   ");
	}	//end for if

	templateBuilder.Append("  \r\n				    </ul>\r\n				</div>\r\n			</div>       \r\n    ");
	}	//end for if

	templateBuilder.Append("\r\n			<div class=\"content-foot\">\r\n				<div class=\"page\">\r\n					<div class=\"digg\">");
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
	templateBuilder.Append("script><!--返回顶部-->\r\n\r\n ");


	templateBuilder.Append("\r\n<!--/Footer-->\r\n</body>\r\n</html>");
	Response.Write(templateBuilder.ToString());
}
</script>
