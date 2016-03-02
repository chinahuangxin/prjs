<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="../globalDef.jsp"%>
<%@ include file="../session.jsp"%>

<%
BankDAO dao = BankDAOFactory.getDAO();
int pageSize = BANKPAGESIZE;
int size = Tool.strToInt(request.getParameter("pageSize"));
if(size>0){
	pageSize = size;
}
int pageIndex= Tool.strToInt(request.getParameter("pageIndex"));
if(pageIndex < 0)  pageIndex = 1;
String filter = " where 1=1 ";

String firmID = Tool.delNull(request.getParameter("firmID"));
if(!firmID.trim().equals(""))
{
	filter += " and firmid='"+ firmID +"'";
}

String actionID = Tool.delNull(request.getParameter("actionID"));
if(!actionID.trim().equals(""))
{
	filter += " and actionID="+Long.parseLong(actionID);
}

String sysActionID = Tool.delNull(request.getParameter("sysActionID"));
if(!sysActionID.trim().equals(""))
{
	filter += " and funID='"+ sysActionID +"'";
}

String bankID = Tool.delNull(request.getParameter("bankID"));
if(!bankID.trim().equals(""))
{
	filter += " and bankID='"+ bankID +"'";
}

int type = Tool.strToInt(request.getParameter("type"));
if(type >= 0)
{
	filter += " and type="+ type;
}

int status = Tool.strToInt(request.getParameter("status"));
if(status >= 0)
{
	filter += " and status="+ status;
}

String s_time = Tool.delNull(request.getParameter("s_time"));
if(!s_time.trim().equals(""))
{
	filter += " and createtime>=to_date('"+s_time+" 00:00:00','yyyy-mm-dd hh24:mi:ss')";
}

String e_time = Tool.delNull(request.getParameter("e_time"));
if(!e_time.trim().equals(""))
{
	filter += " and createtime<=to_date('"+e_time+" 23:59:59','yyyy-mm-dd hh24:mi:ss')";
}

filter += " order by createtime desc,id desc ";

Vector moneyList = dao.getCapitalInfoListPT(filter);
double allMoney = 0;
for(int i = 0 ; i <moneyList.size();i++){
	CapitalValue money = (CapitalValue)moneyList.get(i);
	allMoney += money.money;
}
int maxpage = moneyList.size()%pageSize==0 ? moneyList.size()/pageSize : moneyList.size()/pageSize+1;
if(pageIndex>maxpage){
	pageIndex=maxpage;
}
ObjSet obj = ObjSet.getInstance(moneyList, pageSize, pageIndex);

boolean secondAudit = "true".equalsIgnoreCase(Tool.getConfig("secondMoneyAudit"));
%>

<html xmlns:MEBS>
  <head>
	<META http-equiv="Content-Type" content="text/html; charset=GBK">
    <IMPORT namespace="MEBS" implementation="<%=request.getContextPath()%>/bankInterface/lib/calendar.htc">
	<script language="javascript" src="../lib/tools.js"></script>
    <title>ƾ֤�б�</title>
  </head>
  
  <body>
  	<form id="frm" action="" method="post">
		<fieldset width="95%">
			<legend>�ʽ���ˮ��ѯ</legend>
			<table border="0" cellspacing="0" cellpadding="0" width="1600px" height="35">
				<tr height="35">
					<td align="right">ƽ̨�˻�&nbsp;</td>
					<td align="left">
						<input name="firmID" value="<%=firmID%>" type=text  class="text" maxlength="20" style="width: 100px">
					</td>
					<td align="right">���д���&nbsp;</td>
					<td align="left">
						<input name="bankID" value="<%=bankID%>" type=text  class="text" maxlength="10" style="width: 100px">
					</td>
					<td align="right">����&nbsp;</td>
					<td align="left">
						<select name="type" class="normal" style="width: 100px">
							<OPTION value="-1">ȫ��</OPTION>
							<option value="0" <%=type==0?"selected":""%>>���</option>
              				<option value="1" <%=type==1?"selected":""%>>����</option>
              				<option value="2" <%=type==2?"selected":""%>>�����������</option>
							<option value="3" <%=type==3?"selected":""%>>�����ʽ�ת</option>
						</select>
					</td>
					<td align="right">&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;</td>
					<td align="left">
						<MEBS:calendar eltName="s_time" eltStyle="width:80px" eltImgPath="<%=request.getContextPath()%>/bankInterface/skin/default/images/" eltValue="<%=s_time%>"/>
						&nbsp;��&nbsp;
						<MEBS:calendar eltName="e_time" eltStyle="width:80px" eltImgPath="<%=request.getContextPath()%>/bankInterface/skin/default/images/" eltValue="<%=e_time%>"/>
					</td>
					
				</tr>
				<tr>
					<td align="right">ƽ̨��ˮ��&nbsp;</td>
					<td align="left">
						<input name="actionID" value="<%=actionID%>" type=text  class="text" maxlength="30" style="width: 100px">
					</td>
					<td align="right">����ϵͳ��ˮ��&nbsp;</td>
					<td align="left">
						<input name="sysActionID" value="<%=sysActionID%>" type=text  class="text" maxlength="30" style="width: 100px">
					</td>
					<td align="right">״̬&nbsp;</td>
					<td align="left">
						<select name="status" class="normal" style="width: 100px">
							<OPTION value="-1">ȫ��</OPTION>
							<option value="0" <%=status==0?"selected":""%>>�ɹ�</option>
              				<option value="1" <%=status==1?"selected":""%>>ʧ��</option>
              				<option value="2" <%=status==2?"selected":""%>>������</option>
							<option value="3" <%=status==3?"selected":""%>>�����</option>
							<%if(secondAudit) {%>
							<option value="4" <%=status==4?"selected":""%>>���������</option>
							<%} %>
						</select>
					</td>
					<td colspan="2" align="center">
						<button type="button" class="smlbtn" onclick="doQuery();">��ѯ</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="smlbtn" onclick="frm.reset();">����</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="smlbtn" onclick="checkCapital();">��ˮ�˶�</button>&nbsp;
					</td>
				</tr>
			</table>
		</fieldset>
			<br>
	  <table id="tableList" border="0" cellspacing="0" cellpadding="0" width="1600px" height="400">
  		<tHead>
  			<tr height="25" align=center>
  				<td class="panel_tHead_LB">&nbsp;</td>
				<td class="panel_tHead_MB" align="left">��¼��ˮ��</td>
				<td class="panel_tHead_MB" align="left">ƽ̨��ˮ��</td>
				<td class="panel_tHead_MB" align="left">����ϵͳ��ˮ��</td>
				<td class="panel_tHead_MB" align="left">ƽ̨��</td>
				<td class="panel_tHead_MB" align="left">�����̴���</td>
				<td class="panel_tHead_MB" align="left">����ϵͳ</td>
				<td class="panel_tHead_MB" align="left">���׷���</td>
				<td class="panel_tHead_MB" align="left">���д���</td>
				<td class="panel_tHead_MB" align="left">��������</td>
				<td class="panel_tHead_MB" align="left">����</td>
				<td class="panel_tHead_MB" align="right">���&nbsp;</td>
				<td class="panel_tHead_MB" align="left">&nbsp;����ʱ��</td>
				<td class="panel_tHead_MB" align="left">״̬</td>
				<td class="panel_tHead_MB" align="left">��ע</td>
				<td class="panel_tHead_RB">&nbsp;</td>
			</tr>
		</tHead>
		<tBody>

	  		<%
			double sumMoney = 0 ;
			double sumOutMoney = 0 ;
			double sumInMoney = 0 ;
			double sumFee = 0 ;
			for(int i=0;i<obj.getCurNum();i++)
			{
				CapitalValue money = (CapitalValue)obj.get(i);
				sumMoney += Tool.strToDouble(Tool.fmtDouble2(money.money));
				%>
				<tr height="22" align=center onclick="selectTr();">
					<td class="panel_tBody_LB">&nbsp;</td>
					<td class="underLine" align="left"><%=money.iD%>&nbsp;</td>
					<td class="underLine" align="left"><%=money.actionID%>&nbsp;</td>
					<td class="underLine" align="left"><%=((money.funID == null || "null".equals(money.funID)) ? " " : money.funID)%>&nbsp;</td>
					<td class="underLine" align="left"><%=money.firmID%>&nbsp;</td>
					<td class="underLine" align="left"><%=money.sysFirmID%>&nbsp;</td>
					<td class="underLine" align="left"><%=(systemsMap.get(money.systemID) == null ? "δ֪����ϵͳ" : systemsMap.get(money.systemID).systemName)%>&nbsp;</td>
					<td class="underLine" align="left">
					<%
						if("0".equals(money.tradeSource))
						{
							out.println("����ϵͳ");
						}
						else if("1".equals(money.tradeSource))
						{
							out.println("ƽ̨");
						}
						else if("2".equals(money.tradeSource))
						{
							out.println("����");
						}
					%>
					&nbsp;</td>
					<td class="underLine" align="left"><%=money.bankID%>&nbsp;</td>
					<td class="underLine" align="left"><%=(banksMap.get(money.bankID) == null ? "--" : banksMap.get(money.bankID).bankName)%>&nbsp;</td>
					<td class="underLine" align="left">
					<%
						if(money.type == 0)
						{
							sumInMoney += Tool.strToDouble(Tool.fmtDouble2(money.money));
							out.println("���");
						}
						else if(money.type == 1)
						{
							sumOutMoney += Tool.strToDouble(Tool.fmtDouble2(money.money));
							out.println("����");
						}
						else if(money.type == 2)
						{
							sumFee += Tool.strToDouble(Tool.fmtDouble2(money.money));
							out.println("�����������");
						}
						else if(money.type == 3)
						{
							out.println("�����ʽ�ת");
						}
					%>
					&nbsp;</td>
					<td class="underLine" align=right><%=Tool.fmtMoney(money.money)%>&nbsp;</td>
					<td class="underLine" align="left">&nbsp;<%=Tool.fmtTime(money.createtime)%>&nbsp;</td>
					<td class="underLine" align="left">
						<%
						if(money.status == 0)
						{
							out.println("�ɹ�");
						}
						else if(money.status == 1)
						{
							out.println("<font color=red>ʧ��</font>");
						}
						else if(money.status == 2)
						{
							out.println("������");
						}
						else if(money.status == 3 || money.status == 13)
						{
							out.println("�����");
						}
						else if(money.status == 4)
						{
							out.println("���������");
						}
					%>
						&nbsp;</td>
					<td class="underLine" align="left"><%=Tool.delNull(money.note)%>&nbsp;</td>
					<td class="panel_tBody_RB">&nbsp;</td>
	  			</tr>	
				<%
			}
			%>
			<tr height="22" align=center>
					<td class="panel_tBody_LB">&nbsp;</td>
					<td class="underLine" align="left">&nbsp;</td>
					<td class="underLine" align="left">&nbsp;</td>
					<td class="underLine" align="left">&nbsp;</td>
					<td class="underLine" align="left">&nbsp;</td>
					<td class="underLine" align="left">&nbsp;</td>
					<td class="underLine" align="center">�ϼƣ�</td>
					<td class="underLine" align="right">���ϼ�:&nbsp;</td>
					<td class="underLine" align="left"><%=Tool.fmtMoney(sumInMoney)%>&nbsp;</td>
					<td class="underLine" align="right">����ϼ�:&nbsp;</td>
					<td class="underLine" align=left><%=Tool.fmtMoney(sumOutMoney)%>&nbsp;</td>
					<td class="underLine" align="right">�����Ѻϼ�:&nbsp;</td>
					<td class="underLine" align="left"><%=Tool.fmtMoney(sumFee)%>&nbsp;</td>
					<td class="underLine" align="left">&nbsp;</td>
					<td class="underLine" align="left">&nbsp;</td>
					<td class="panel_tBody_RB">&nbsp;</td>
				</tr>
	  	</tBody>
	  	<tFoot>
			<tr height="100%">
				<td class="panel_tBody_LB">&nbsp;</td>
				<td colspan="14">&nbsp;</td>
				<td class="panel_tBody_RB">&nbsp;</td>
			</tr>
			<tr height="22">
				<td class="panel_tBody_LB">&nbsp;</td>
				<td class="pager" colspan="5" align=center>�ʽ�ϼƣ�<%=Tool.formatToMoney(allMoney)%></td>
				<td class="pager" colspan="9" align=right>
				��<%=pageIndex%>/<%=obj.getPageCount()%>ҳ &nbsp;&nbsp;��<%=obj.getTotalCount()%>�� &nbsp;&nbsp;ÿҳ
				<input name="pageSize" class="text" type="text" style="width:25px;" value="<%=pageSize%>" onkeydown="return pgJumpChk()">�� &nbsp;&nbsp;
				<%
				if(pageIndex != 1)
				{
					%>
					<span style="cursor:hand" onclick="pgTurn(0)">��ҳ</span> &nbsp;&nbsp;<span style="cursor:hand" onclick="pgTurn(-1)">��ҳ</span> &nbsp;&nbsp;	
					<%
				}
				else
				{
					%>
					��ҳ &nbsp;&nbsp;��ҳ &nbsp;&nbsp;	
					<%
				}

				if(pageIndex != obj.getPageCount())
				{
					%>
					<span style="cursor:hand" onclick="pgTurn(1)">��ҳ</span> &nbsp;&nbsp;<span style="cursor:hand" onclick="pgTurn(2)">βҳ</span> &nbsp;&nbsp;	
					<%
				}
				else
				{
					%>
					��ҳ &nbsp;&nbsp;βҳ &nbsp;&nbsp;	
					<%
				}

				%>
				��<input class="text" type="text" style="width:25px;" name="pageJumpIdx" onkeydown="return pgJumpChk()">ҳ

				<input name=pageIndex type=hidden value="<%=pageIndex%>">
				</td>
				<td class="panel_tBody_RB">&nbsp;</td>
			</tr>
			<tr height="22">
				<td class="panel_tFoot_LB">&nbsp;</td>
				<td class="panel_tFoot_MB" colspan="14"></td>
				<td class="panel_tFoot_RB">&nbsp;</td>
			</tr>
		</tFoot>
	</table>
	</from>
  </body>
</html>

<SCRIPT LANGUAGE="JavaScript">
<!--
function pgTurn(i)
{
	if(i == 0)
	{
		frm.pageIndex.value = 1;
		frm.submit();
	}
	else if(i == 1)
	{		
		frm.pageIndex.value = frm.pageIndex.value * 1 + 1;	
		frm.submit();
	}
	else if(i == 2)
	{
		frm.pageIndex.value = <%=obj.getPageCount()%>;
		frm.submit();
	}
	else if(i == -1)
	{
		frm.pageIndex.value = frm.pageIndex.value - 1;
		frm.submit();
	}
}

function doQuery()
{
	frm.pageIndex.value = 1;
	frm.submit();
}

function pgJumpChk()
{
	if(event.keyCode == 13)
	{
		if((isNaN(frm.pageJumpIdx.value) || frm.pageJumpIdx.value < 1 || frm.pageJumpIdx.value > <%=obj.getPageCount()%>) && (isNaN(frm.pageSize.value) || frm.pageSize.value < 1 ))
		{
			alert("������1 - <%=obj.getPageCount()%>������֣�");
		}
		else
		{
			frm.pageIndex.value = frm.pageJumpIdx.value;
			frm.submit();
		}
	}	
}
function checkCapital(){
	var systemID = window.showModalDialog("selectSystem.jsp","","dialogWidth=250px; dialogHeight=150px; status=yes;scroll=yes;help=no;");
	if(systemID){
		window.showModalDialog("checkCapitalSystem.jsp?systemID=" + systemID,"","dialogWidth=1100px; dialogHeight=500px; status=yes;scroll=yes;help=no;");
	}
}

//-->
</SCRIPT>