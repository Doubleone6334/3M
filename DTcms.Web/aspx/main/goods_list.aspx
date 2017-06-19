<%@ Page Language="C#" AutoEventWireup="true" Inherits="DTcms.Web.UI.Page.article_list" ValidateRequest="false" %>
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
	const string channel = "goods";
	const int pagesize = 20;

	templateBuilder.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>");
	templateBuilder.Append(Utils.ObjectToStr(model.title));
	templateBuilder.Append(" - ");
	templateBuilder.Append(Utils.ObjectToStr(site.name));
	templateBuilder.Append("</title>\r\n<meta name=\"keywords\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(model.seo_keywords));
	templateBuilder.Append("\" />\r\n<meta name=\"description\" content=\"");
	templateBuilder.Append(Utils.ObjectToStr(model.seo_description));
	templateBuilder.Append("\" />\r\n<link href=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("css/pagination.css\" rel=\"stylesheet\" />\r\n<link href=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/css/style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/jquery-1.11.2.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" charset=\"utf-8\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/common.js\"></");
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


	templateBuilder.Append("\r\n<!--/Header-->\r\n\r\n<div class=\"section clearfix\">\r\n\r\n  <div class=\"wrapper auto clearfix\">\r\n    ");
	string category_nav = get_category_menu("goods_list", category_id);

	templateBuilder.Append("\r\n    <div class=\"curr-nav\">当前位置：<a href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">首页</a> &gt; <a href=\"");
	templateBuilder.Append(linkurl("goods"));

	templateBuilder.Append("\">购物商城</a>");
	templateBuilder.Append(Utils.ObjectToStr(category_nav));
	templateBuilder.Append("</div>\r\n    \r\n    <div class=\"screen-box\">\r\n      <dl>\r\n        <dt>分类：</dt>\r\n        <dd>\r\n          ");
	if (category_id==0)
	{

	templateBuilder.Append("\r\n            <a class=\"selected\" href=\"");
	templateBuilder.Append(linkurl("goods"));

	templateBuilder.Append("\">全部</a>\r\n          ");
	}
	else
	{

	templateBuilder.Append("\r\n            <a href=\"");
	templateBuilder.Append(linkurl("goods"));

	templateBuilder.Append("\">全部</a>\r\n          ");
	}	//end for if

	DataTable categoryList = get_category_child_list(channel,0);

	foreach(DataRow cdr in categoryList.Rows)
	{

	if (category_id==Utils.StrToInt(Utils.ObjectToStr(cdr["id"]), 0))
	{

	templateBuilder.Append("\r\n              <a class=\"selected\" href=\"");
	templateBuilder.Append(linkurl("goods_list",Utils.ObjectToStr(cdr["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(cdr["title"]) + "</a>\r\n            ");
	}
	else
	{

	templateBuilder.Append("\r\n              <a href=\"");
	templateBuilder.Append(linkurl("goods_list",Utils.ObjectToStr(cdr["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(cdr["title"]) + "</a>\r\n            ");
	}	//end for if

	}	//end for if

	templateBuilder.Append("\r\n        </dd>\r\n      </dl>\r\n      \r\n    </div>\r\n      \r\n    <div class=\"img-list2\">\r\n      <ul>\r\n        ");
	DataTable goodsList = get_article_list(channel, category_id, pagesize, page, "status=0", out totalcount, out pagelist, "goods_list", category_id, "__id__");

	templateBuilder.Append("<!--取得一个分页DataTable-->\r\n        ");
	foreach(DataRow dr in goodsList.Rows)
	{

	templateBuilder.Append("\r\n        <li>\r\n          <div class=\"wrap-box\">\r\n            <div class=\"img-box\">\r\n              <a title=\"" + Utils.ObjectToStr(dr["title"]) + "\" href=\"");
	templateBuilder.Append(linkurl("goods_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\">\r\n                ");
	if (Utils.ObjectToStr(dr["is_red"])=="1")
	{

	templateBuilder.Append("\r\n                <div class=\"abs-txt\">推荐</div>\r\n                ");
	}	//end for if

	templateBuilder.Append("\r\n                <img src=\"" + Utils.ObjectToStr(dr["img_url"]) + "\" />\r\n              </a>\r\n            </div>\r\n            <div class=\"info\">\r\n              <h3><a title=\"" + Utils.ObjectToStr(dr["title"]) + "\" href=\"");
	templateBuilder.Append(linkurl("goods_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(dr["title"]) + "</a></h3>\r\n              <div class=\"col\">\r\n                <b>￥" + Utils.ObjectToStr(dr["sell_price"]) + "</b>元\r\n              </div>\r\n              <div class=\"col\">\r\n                <i>库存：" + Utils.ObjectToStr(dr["stock_quantity"]) + "件</i>\r\n                市场价：<s>" + Utils.ObjectToStr(dr["market_price"]) + "</s>\r\n              </div>\r\n            </div>\r\n          </div>\r\n        </li>\r\n        ");
	}	//end for if

	templateBuilder.Append("\r\n      </ul>\r\n    </div>\r\n    \r\n    <!--页码列表-->\r\n    <div class=\"page-box\">\r\n      <div class=\"digg\">");
	templateBuilder.Append(Utils.ObjectToStr(pagelist));
	templateBuilder.Append("</div>\r\n    </div>\r\n    <!--/页码列表-->\r\n    \r\n  </div>\r\n</div>\r\n\r\n<!--Footer-->\r\n");

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
