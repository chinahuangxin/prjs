<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="../globalDef.jsp"%>
<%@ include file="../session.jsp"%>

<%
	int[] pageinfo = new int[4];
	BankDAO dao = BankDAOFactory.getDAO();
	int pageSize = BANKPAGESIZE;
	String today = Tool.fmtDate(new java.util.Date());
	int size = Tool.strToInt(request.getParameter("pageSize"));
	if(size>0){
		pageSize = size;
	}
	pageinfo[2]=pageSize;
	int pageIndex= Tool.strToInt(request.getParameter("pageIndex"));
	if(pageIndex <= 0)  pageIndex = 1;
	pageinfo[1]=pageIndex;
	String filter = " where 1=1 ";
	String logopr = Tool.delNull(request.getParameter("logopr"));
	if(logopr != null && logopr.trim().length()>0) {
		filter += " and logopr like '%"+ logopr +"%'";
	}
	String s_time = Tool.delNull(request.getParameter("s_time"));
	String e_time = Tool.delNull(request.getParameter("e_time"));
	if(request.getParameter("submitFlag")==null || request.getParameter("submitFlag").trim().length()<=0){
		s_time = today;
		e_time = today;
	}
	if(s_time != null && s_time.trim().length()>0) {
		filter += " and trunc(logtime)>=to_date('"+ s_time +"','yyyy-MM-dd')";
	}
	if(e_time != null && e_time.trim().length()>0) {
		filter += " and trunc(logtime)<=to_date('"+ e_time +"','yyyy-MM-dd')";
	}
	filter += " order by logid desc ";
	Vector logList = dao.logList(filter,pageinfo);
%>

<html>
  <head>
	<META http-equiv="Content-Type" content="text/html; charset=GBK">
    <script language="javascript" src="<%=request.getContextPath()%>/bankInterface/lib/My97DatePicker/WdatePicker.js"></script>
	<script language="javascript" src="../lib/tools.js"></script>
    <title>后台管理员操作日志列表</title>
  </head>
  
  <body>
	<form id="frm" action="" method="post">
		<input type="hidden" name="submitFlag">
		<div id="main_body">
			<table border="0" cellspacing="0" class="table1_style"
				cellpadding="0">
				<tr>
					<td>
						<div class="div_tj">
								<table border="0" cellpadding="0" cellspacing="0"
									class="table2_style">
									<tr>
										<td class="table2_td_widthmax">
											<div class="div2_top">
												<table class="table3_style" border="0" cellspacing="0"
													cellpadding="0" style="table-layout:fixed;">
													<tr>
														<td class="table3_td_1" align="left">
															操作人:&nbsp;
															<label>
																<input type="text" class="input_text" name="logopr" value="<%//=logopr%>" />
															</label>
														</td>
														<td class="table3_td_1" align="left">
															&nbsp;&nbsp;起始日期:&nbsp;
															<label>
																<input type="text" style="width:92px" class="wdate" maxlength="10" name="s_time" value="<%=today%>" onFocus="WdatePicker({el:this,dateFmt:'yyyy-MM-dd',skin:'whyGreen'})">
															</label>
														</td>
														<td class="table3_td_1" align="left">
														结束日期:&nbsp;
															<label>
																
																<input type="text" style="width:92px" class="wdate" maxlength="10" name="e_time" value="<%=today%>" onFocus="WdatePicker({el:this,dateFmt:'yyyy-MM-dd',skin:'whyGreen'})">
															</label>
														</td>
														<td class="table3_td_anniu" align="left">
															<button class="btn_sec" onclick="doQuery();">
																查询
															</button>&nbsp;&nbsp;
															<button class="btn_cz" onclick="myReset();">
																重置
															</button>
														</td>
													</tr>
												</table>
											</div>
										</td>
									</tr>
								</table>
						</div>
						<div class="div_list">
							 <table id="tableList" style="table-layout:fixed;" border="0" cellspacing="0" cellpadding="0" width="100%" height="400">
  		<tHead>
  			<tr align=center>
  				<td width="1%" class="panel_tHead_LB">&nbsp;</td>
				<td width="10%" class="panel_tHead_MB" align="center">日志序号</td>
				<td width="10%" class="panel_tHead_MB" align="center">操作人</td>
				<td width="55%" class="panel_tHead_MB" align="center">操作内容</td>
				<td width="10%" class="panel_tHead_MB" align="center">登录IP</td>
				<td width="15%" class="panel_tHead_MB_last" align="center">操作时间</td>
				<td width="1%"  class="panel_tHead_RB">&nbsp;</td>
			</tr>
		</tHead>
		<tBody>

	  		<%
			for(int i=0;i<logList.size();i++){
				LogValue lv = (LogValue)logList.get(i);
				%>
				<tr height="22" align=center onclick="selectTr();">
					<td class="panel_tBody_LB">&nbsp;</td>
					<td class="underLine" align="center"><%=lv.getLogid()%>&nbsp;</td>
					<td class="underLine" align="center"><%=lv.getLogopr()%>&nbsp;</td>
					<td class="underLine" align="left"><%=lv.getLogcontent()%>&nbsp;</td>
					<td class="underLine" align="center"><%=lv.getIp()%>&nbsp;</td>
					<td class="underLine_last" align="center"><%=Tool.fmtTime(lv.getLogtime())%>&nbsp;</td>
					<td class="panel_tBody_RB">&nbsp;</td>
	  			</tr>	
				<%
			}
			%>
	  	</tBody>
	  	<tFoot>
			<tr height="100%">
				<td class="panel_tBody_LB">&nbsp;</td>
				<td colspan="5">&nbsp;</td>
				<td class="panel_tBody_RB">&nbsp;</td>
			</tr>
			<tr height="22">
				<td class="panel_tBody_LB">&nbsp;</td>
				<td class="pager" colspan="5" align=right>
				第<%=pageinfo[1]%>/<%=pageinfo[3]%>页 &nbsp;&nbsp;共<%=pageinfo[0]%>条 &nbsp;&nbsp;每页
				<input name="pageSize" class="text" type="text" style="width:25px;" value="<%=pageinfo[2]%>" onkeydown="return pgJumpChk()">条 &nbsp;&nbsp;
				<%
				if(pageinfo[1] != 1)
				{
					%>
					<span style="cursor:hand" onclick="pgTurn(0)">首页</span> &nbsp;&nbsp;<span style="cursor:hand" onclick="pgTurn(-1)">上页</span> &nbsp;&nbsp;	
					<%
				}
				else
				{
					%>
					首页 &nbsp;&nbsp;上页 &nbsp;&nbsp;	
					<%
				}

				if(pageinfo[1] != pageinfo[3])
				{
					%>
					<span style="cursor:hand" onclick="pgTurn(1)">下页</span> &nbsp;&nbsp;<span style="cursor:hand" onclick="pgTurn(2)">尾页</span> &nbsp;&nbsp;	
					<%
				}
				else
				{
					%>
					下页 &nbsp;&nbsp;尾页 &nbsp;&nbsp;	
					<%
				}

				%>
				到<input class="text" type="text" style="width:25px;" name="pageJumpIdx" onkeydown="return pgJumpChk()">页

				<input name=pageIndex type=hidden value="<%=pageinfo[1]%>">
				</td>
				<td class="panel_tBody_RB">&nbsp;</td>
			</tr>
			<tr height="22">
				<td class="panel_tFoot_LB">&nbsp;</td>
				<td class="panel_tFoot_MB" colspan="5"></td>
				<td class="panel_tFoot_RB">&nbsp;</td>
			</tr>
		</tFoot>
	</table>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</form>
  </body>
</html>
<script>
	frm.logopr.value="<%=logopr%>";
	frm.s_time.value="<%=s_time%>";
	frm.e_time.value="<%=e_time%>";
</script>
<SCRIPT LANGUAGE="JavaScript">
<!--
function myreset(){
	frm.reset();
	doQuery();
}
function pgTurn(i) {
	frm.submitFlag.value = "doQuery";
	if(i == 0) {
		frm.pageIndex.value = 1;
		frm.submit();
	} else if(i == 1) {		
		frm.pageIndex.value = frm.pageIndex.value * 1 + 1;
		frm.submit();
	} else if(i == 2) {
		frm.pageIndex.value = <%=pageinfo[3]%>;
		frm.submit();
	} else if(i == -1) {
		frm.pageIndex.value = frm.pageIndex.value - 1;
		frm.submit();
	}
}

function doQuery() {
	frm.pageIndex.value=1;
	frm.submitFlag.value = "doQuery";
	var logopr = frm.logopr.value;
	var s_time = frm.s_time.value;
	var e_time = frm.e_time.value;
	var now1 = new Date()+"";
	if(!ismyStr(logopr)){
		alert("操作人非法字符");
		frm.logopr.focus();
	} else if(s_time != "" && !CompareDate(s_time,now1)){
		alert("起始日期格式错误或起始日期超过今天");
		frm.s_time.value="";
	} else if(e_time != "" && !CompareDate(e_time,now1)){
		alert("结束日期格式错误或结束日期超过今天");
		frm.e_time.value="";
	} else if(e_time != "" && !CompareDate(s_time,e_time)){
		alert("输入的开始日期不能超过结束日期");
		frm.s_time.value="";
		frm.e_time.value="";
	} else{
		frm.pageIndex.value = 1;
		frm.submit();
	}
}
function ismyStr(str){
	var patrn=/^\w*$/;
	if (patrn.exec(str)) {
		return true ;
	}
	return false ;
}
function pgJumpChk()
{
	if(event.keyCode == 13)
	{
		if((isNaN(frm.pageJumpIdx.value) || frm.pageJumpIdx.value < 1 || frm.pageJumpIdx.value > <%=pageinfo[3]%>) && (isNaN(frm.pageSize.value) || frm.pageSize.value < 1 ))
		{
			alert("请输入1 - <%=pageinfo[3]%>间的数字！");			
		}
		else
		{
			frm.submitFlag.value = "doQuery";
			frm.pageIndex.value = frm.pageJumpIdx.value;
			frm.submit();
		}
	}	
}

function CompareDate(d1,d2) {
	return ((new Date(d1.replace(/-/g,"\/"))) <= (new Date(d2.replace(/-/g,"\/"))));   
}

//-->
</SCRIPT>