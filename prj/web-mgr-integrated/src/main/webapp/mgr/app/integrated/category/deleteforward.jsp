<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/mgr/public/includefiles/allincludefiles.jsp"%>
<html>
	<script type="text/javascript">
	window.onload = function() {
		if ("" != '${ReturnValue.info}' + "") {
			parent.document.frames('leftFrame').location.reload();
		}
	}
</script>
	<head>
		<title></title>
	</head>

	<body>
		<table width="100%" height="100%" border="1" valign="center"
			align="center" cellpadding="0" cellspacing="3" bordercolor="#FFF6F4">
			<tr>
				<td class="framebottom">
					&nbsp;
				</td>
			</tr>
		</table>
	</body>
</html>
