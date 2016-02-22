<%@ page contentType="text/html;charset=GBK" %>
<jsp:directive.page import="java.util.Date"/>
<%@ include file="../globalDef.jsp"%>
<%@ include file="../session.jsp"%>
<base target="_self"> 
<%
	new ErrorCode().load();
	BankDAO dao = BankDAOFactory.getDAO();
	Vector bankList = dao.getBankList(" and validflag=0 and bankID like '1%'");
	String firmID = request.getParameter("firmID");
	String oldbankID = request.getParameter("oldbankID");
	CorrespondValue corr = null;
	FirmValue firm = null;
	Vector<CorrespondValue> cvs = dao.getCorrespondList(" and firmID='"+firmID+"' ");
	if(cvs != null && cvs.size()>0){
		for(int i=0;i<cvs.size();i++){
			CorrespondValue cv = cvs.get(i);
			out.print("<input type='hidden' id='"+cv.bankID+"' value='"+cv.isOpen+"'>");
			if(cv.bankID != null && cv.bankID.equalsIgnoreCase(oldbankID)){
				corr = cv;
			}
		}
		if(corr==null){
			corr=cvs.get(0);
		}
	}else{
		firm = dao.getFirm(firmID);
		if(firm == null){
			out.print("δ��Ѱ���ͻ���Ϣ");
			return;
		}else{
			corr = new CorrespondValue();
			corr.firmID = firm.firmID;
			corr.contact = firm.contact;
			corr.card = firm.card;
			corr.cardType = firm.cardType;
			corr.accountName = firm.firmName;
		}
	}
	if("do".equals(request.getParameter("submitFlag"))){
		/*�ദ����·��
		CapitalProcessorRMI cp = null;
		try{
			cp = (CapitalProcessorRMI)Naming.lookup("//" + RmiIpAddress + ":" + RmiPortNumber + "/"+ RmiServiceName);
		}catch(Exception e){
			e.printStackTrace();
		}*/
		long bak = -1;
		String str="�����ʽ��˺Ź���-ǩԼģ������";
		String strs = "";
		if(corr == null){
			strs = "δ��Ѱ���˺���Ϣ";
		}else{
			corr.bankID = request.getParameter("bankID");
			corr.account = request.getParameter("account");
			corr.frozenFuns = 200000000;
			if(corr.bankID == null || corr.bankID.trim().length()<=0){
				strs= "���в���Ϊ��";
			}else{
				try {
					//�ദ����·��
					CapitalProcessorRMI cp = null;
					try{
						cp = getBankUrl(corr.bankID);
					}catch(Exception e){
						e.printStackTrace();
					}
					ReturnValue result=cp.openAccountMarket(corr);
					if(result.result<0){
						strs = result.remark;
						if(strs == null || strs.trim().length()<=0){
							if(ErrorCode.error.get(result.result) != null){
								strs = ErrorCode.error.get(result.result);
							}else{
								strs = "������["+ result.result+"]";
							}
						}
					}else{
						strs = "�����˺�["+corr.contact+"]ǩԼ�ɹ�";
						bak = 0;
					}
				} catch(Exception e) {
					strs = "�����˺�["+corr.contact+"]ǩԼʱ����ϵͳ�쳣";
					e.printStackTrace();
				}
				LogValue lv = new LogValue();
				lv.setLogtype("2110");
				lv.setLogoprtype("E");
				lv.setResult(bak==0 ? 0 : 1);
				lv.setLogopr(AclCtrl.getLogonID(request));
				lv.setIp(computerIP);
				lv.setLogcontent(str+"-"+strs);
				dao.log(lv);
			}
		}
	%>
		<script>
			alert('<%=strs%>');
			<%
				if(bak == 0){
			%>
				window.returnValue="1";
				window.close();
			<%
				}
			%>
		</script>
	<%
	}
%>
<html>
  <head>
	<META http-equiv="Content-Type" content="text/html; charset=GBK">
	<script language="javascript" src="../lib/tools.js"></script>
	<link type="text/css" rel="stylesheet" href="../lib/jquery/style/validator.css"></link>
    <title>(ģ������)����������ǩԼ</title>
  </head>
  
  <body style="overflow-y: hidden">
  	<form id="frm" action="" method="post">
		<input type="hidden" name="submitFlag" id="submitFlag">
	<div style="overflow:auto;height:200;">
	 <table border="0" width="95%" align="center">
		<tr>
		  <td>
			<div class="st_title"><img src="<%=skinPath%>/cssimg/st_ico1.gif" align="absmiddle" />&nbsp;(ģ������)����������ǩԼ</div>
			<table border="0" cellspacing="0" cellpadding="0" width="100%" height="35" class="st_bor">
				<tr>
					<td align="right" width="120">&nbsp;</td>
					<td align="left" width="100">
						<input name="firmID" disabled='disabled' value="<%=firmID%>" readonly type="hidden"  class="input_text" style="width: 140px">
					</td>
					<td>&nbsp;</td>
				</tr>
				<tr height="35">
					<td align="right"><%=CONTACTTITLE%>��&nbsp;</td>
					<td align="left">
						<input name="contact" disabled='disabled' readonly value="<%=corr.contact%>" type=text  class="input_text" style="width: 140px">
					</td>
					<td>&nbsp;</td>
				</tr>
				<tr height="35">
					<td align="right">���У�&nbsp;</td>
					<td align="left">
						<%
						for(int i=0;i<bankList.size();i++){
							BankValue bank = (BankValue)bankList.get(i);
							if(!bank.bankName.equals("��������")){
								out.print("<input type='hidden' id='"+bank.bankID+"' value='"+bank.bankName+"'/>");
							}
						}
						%>
						<select onblur="myblur('bankID');" onfocus="myfocus(bankID)" id="bankID" name="bankID" class="normal" style="width: 140px">
							<OPTION value="">��ѡ��</OPTION>
							<%
							for(int i=0;i<bankList.size();i++){
								BankValue bank = (BankValue)bankList.get(i);
								if(!bank.bankName.equals("��������")){
									%>
									<option value="<%=bank.bankID%>"><%=bank.bankName%></option>	
									<%
								}
							}
							%>
						</select><span class=star><font color="#FF0000">*</font></span>
					</td>
					<td><div id="bankIDTip" class=""></div></td>
				</tr>
				<tr height="35">
					<td align="right">�����˺ţ�&nbsp;</td>
					<td align="left">
						<input onblur="myblur('account');" onfocus="myfocus(account)" id="account" name="account" value="<%=corr.account==null ? new java.util.Date().getTime():corr.account%>" type=text class="text" maxlength="30" style="width: 140px"><span class=star><font color="#FF0000">*</font></span>
					</td>
					<td><div id="accountTip" class=""></div></td>
				</tr>
			</table>
			</td>
			</tr>
			</table>
		</div>
		<table border="0" cellspacing="0" cellpadding="0" width="100%" height="35">
			<tr height="35">					
				<td align="center" colspan=2>
					<button id="sub_btn" class="btn_sec" onclick="doAdd();">ǩԼ</button>&nbsp;
					<button id="bak_btn" class="btn_cz" onclick="window.close();">����</button>&nbsp;
				</td>
			</tr>
		</table>
	</form>
  </body>
</html>

<SCRIPT LANGUAGE="JavaScript">
<!--
var ErrorClass = "onError";
var CorrectClass = "";//"onCorrect";
var FocusClass = "";
var FocusMsg = "";
var ErrorMsg = "��֤����";
var SuccessMsg = "";
function idobj(userID){
	return document.getElementById(userID);
}
function tipclass(userID,flag){
	var tip = idobj(userID+"Tip");
	if(flag){
		tip.className=CorrectClass;
	}else{
		tip.className=ErrorClass;
	}
}
function myblur(userID){
	var flag = true;
	if("bankID"==userID){
		flag = bankID(userID);
	}else if("account"==userID){
		flag = account(userID);
	} else{
		if(!bankID("bankID")) flag = false;
		if(!account("account")) flag = false;
	}
	return flag;
}
function bankID(userID){
	var user = idobj(userID);
	var tip = idobj(userID+"Tip");
	var flag = false;
	if(isEmpty(user.value)){
		tip.innerHTML="��ѡ��";
	}else{
		tip.innerHTML=SuccessMsg;
		flag = true;
	}
	tipclass(userID,flag);
	return flag;
}
function account(userID){
	var user = idobj(userID);
	var tip = idobj(userID+"Tip");
	var flag = false;
	if(isEmpty(user.value)){
		tip.innerHTML="����Ϊ��";
	}else if(!number(user.value)){
		tip.innerHTML="ֻ����������";
	}else{
		tip.innerHTML=SuccessMsg;
		flag = true;
	}
	tipclass(userID,flag);
	return flag;
}
function myfocus(){
}
function doAdd(){
	var flag = true;
	flag = myblur("all");
	if(flag){
		var isOpen = document.getElementById(frm.bankID.value);
		if(isOpen == null || isOpen.value !='1'){
			var msg = "��ȷ��ҪǩԼ��";
				msg += "\n<%=CONTACTTITLE%>:["+idobj('contact').value+"]";
				msg += "\n�����˺�:["+idobj('account').value+"]";
				msg += "\n����:["+idobj(idobj('bankID').value).value+"]";
			if(confirm(msg)){
			idobj("sub_btn").disabled = 'disabled';
			idobj("bak_btn").disabled = 'disabled';
				idobj("submitFlag").value="do";
				frm.submit();
			}
		}else{
			if(confirm("�����˺��Ѿ�ǩԼ���Ƿ�Ҫ����ǩԼ")){
			idobj("sub_btn").disabled = 'disabled';
			idobj("bak_btn").disabled = 'disabled';
				idobj("submitFlag").value="do";
				frm.submit();
			}
		}
	}
}
String.prototype.trim = function(){
	return this.replace(/(^\s*)|(\s*$)/g, "");
};
function isEmpty(s){
	if(s.trim().length<=0){
		return true;
	}
	return false;
}
function number(s){
	if(isEmpty(s)){
		return true;
	}
	var patrn=/^\d*$/;
	if (patrn.exec(s)) {
		return true ;
	}
	return false ;
}
//-->
</SCRIPT>