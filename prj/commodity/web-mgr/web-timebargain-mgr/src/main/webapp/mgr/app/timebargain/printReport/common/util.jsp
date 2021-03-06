<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%> 
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/fmt' prefix='fmt' %>
<%@ include file="/mgr/public/includefiles/allincludefiles.jsp"%>
<link rel="stylesheet" href="${mgrPath}/skinstyle/default/css/app/report.css" type="text/css"/>

<%@ page import="gnnt.MEBS.timebargain.mgr.util.DaoHelper" %>
<%@ page import="gnnt.MEBS.timebargain.mgr.util.SysData" %>
<%@ page import="gnnt.MEBS.timebargain.mgr.util.ClientLedger" %>
<%@ page import="java.math.BigDecimal"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>

<script type="text/javascript">
//控制不输入空格
function notSpace()
{
  if(event.keyCode == 32)
  {
    event.returnValue=false;
  }
}
function selectTr()
{
	var objTr=event.srcElement;
	while(objTr.tagName!="TR")
	{
		objTr=objTr.parentNode;
	}
	
	var objRadio = objTr.all.namedItem("selectRadio");
	if(objRadio){
		objRadio.checked = true;
		var valueColl = objTr.all;
		for( var i = 0 ; i < valueColl.length ; i++ )
		{
			 if(valueColl[i].mapId)
			 {
		 		 for( var j = 0 ; j < returnObj.length ; j++ )
					 {
					 	if( returnObj[j].mapId == valueColl[i].mapId )
					 	{
					 		
					 			if( valueColl[i].tagName == "SPAN" )
					 				returnObj[j].value =  valueColl[i].innerText;
					 			if( valueColl[i].tagName == "INPUT" )
					 				returnObj[j].value =  valueColl[i].value;
					 	}
					 }
			 }
		}
	}
	var objTbl = objTr
	while(objTbl.tagName!="TABLE")
	{
		objTbl=objTbl.parentNode;
	}
	
	for ( var i=0; i < objTbl.children[0].children.length ; i++) //>
	{
			objTbl.children[0].children[i].style.backgroundColor  = "";

	}
	objTr.style.backgroundColor  = "C0C0C0";
}
</script>

<%
  response.setHeader("Pragma","No-cache");
  response.setHeader("Cache-Control","no-cache");
  response.setDateHeader("Expires", 0);
  
	DecimalFormat nf = (DecimalFormat)NumberFormat.getNumberInstance();
    nf.applyPattern("###0.00");
%>
<%!
	public String handleNullValue(String str){
		String strResult = "";
		if( str == null || "".equals(str.trim())){
			strResult = "";
		}else{
			strResult = str;
		}
		return strResult;
	}
	public boolean chcekNull(String str){
	
		if(str == null){
			return false;
		}else{
			return true;
		}
	}
	public String turnToStr(Object str){
	
		if(str == null){
			return "&nbsp;";
		}else{
			return (String)str;
		}
	}
	public BigDecimal turnToNum(Object str){
	
		if(str == null){
			return new BigDecimal("0.00");
		}else{
			return (BigDecimal)str;
		}
	}
	//不能传String类型
	public BigDecimal turnToNum2(Object str){
		DecimalFormat df = new DecimalFormat("0.00");
		if(str == null){
			return new BigDecimal("0.00");
		}else{			
			String strValue=df.format(str);
			BigDecimal bd = new BigDecimal(strValue);
			return bd;
		}
	}


	public List getList(String sql)
	{
	  List list=null;
	  DaoHelper dao = (DaoHelper)SysData.getBean("daoHelper");
      list=dao.queryBySQL(sql);
	  return list;
	}
%>