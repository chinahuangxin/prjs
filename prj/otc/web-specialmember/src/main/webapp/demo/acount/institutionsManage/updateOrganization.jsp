<%@ page contentType="text/html;charset=GBK"%>
<html>
	<head>
		<title>�޸Ļ���</title>
	</head>

<base target="_self">
	<body>
		<form name="frm" action="/ecsideTest/ecside/add.action" method="post" target="frame">
			<fieldset width="50%" height="60%">
				<legend> 
					�޸Ļ���
				</legend>
					<table border="0" cellspacing="0" cellpadding="4" width="100%" align="center">
						<tr height="20">
							<td align="right">��������:							</td>
							<td><label>
							  <input type="text" value="admin901"/>
							</label></td>
						</tr>
						<tr height="20">
							<td align="right">
							�ϼ�����:							</td>
							<td><label>
							  <select name="select2">
							    <option>901-Test1</option>
						      </select>
							</label></td>
						</tr>
							
			</table> 
						<table border="0" cellspacing="0" cellpadding="4" width="100%" align="center">
						<tr>
							<td  align="center">
								<input type="button" value="�޸�">
							</td>
							<td align="center">
								<input type="button" value="����" onClick="window.close()">
							</td>
						</tr>
					</table> 
			</fieldset>
		</form>
	</body>
</html>