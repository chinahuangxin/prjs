<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/public/session.jsp"%>
<html>
	<head>
		<title>会员保证金</title>
	</head>
	<body leftmargin="0" topmargin="0" class="st_body">
	</br>
		<form name="frm" action="${basePath}/commodity/memberMargin/update.action" method="post" targetType="hidden">
		 <div >
			<%@ include file="/commodity/margin/memberMarginInfoTable.jsp"%>
			</div>
			<div class="tab_pad">
			<table cellspacing="0" cellpadding="0" border="0" width="100%" align="center" >
				<tr>
				<td  align="center">
					<button  class="btn_sec" onClick="updateMargin()" id="update">添加</button>
				</td>
				<td align="center">
					<button  class="btn_sec" onClick="window.close()">关闭</button>
				</td>
			</tr>
			</table>
			</div>
		</form>
	</body>
</html>
<script type="text/javascript">
function updateMargin(){
	var vaild = window.confirm("您确定要操作吗？");
	if(vaild==true){
	    frm.submit();
    }else{
          return false;
    }
}
</script>
<%@ include file="/public/footInc.jsp"%>