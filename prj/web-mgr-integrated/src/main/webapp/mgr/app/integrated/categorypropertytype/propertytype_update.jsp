<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/mgr/public/includefiles/allincludefiles.jsp"%>
<html>

	<link rel="stylesheet"
		href="${skinPath }/css/validationengine/validationEngine.jquery.css"
		type="text/css" />
	<link rel="stylesheet"
		href="${skinPath }/css/validationengine/template.css" type="text/css" />
	<script src="${publicPath }/js/jquery-1.6.min.js"
		type="text/javascript">
	
</script>
	<script
		src="${basePath }/mgr/app/integrated/js/jquery.validationEngine-zh_CN.js"
		type="text/javascript" charset="GBK">
	
</script>
	<script
		src="${publicPath }/js/validationengine/jquery.validationEngine.js"
		type="text/javascript" charset="GBK"></script>
	<script>
	jQuery(document).ready(function() {
		if ("" != '${ReturnValue.info}' + "") {
			parent.document.frames('leftFrame').location.reload();
		}

		jQuery("#frm").validationEngine( {
			ajaxFormValidation : true,
			ajaxFormValidationURL : "../../ajaxcheck/commodity/checkCategoryPropTypeForm.action",
			onAjaxFormComplete : ajaxValidationCallback,
			onBeforeAjaxFormValidation : beforeCall
		});

		function beforeCall(form, options) {
			return true;
		}

		// Called once the server replies to the ajax form validation request
			function ajaxValidationCallback(status, form, json, options) {
				if (status === true) {
					var vaild = affirm("您确定要操作吗？");
					if (vaild == true) {
						form.validationEngine('detach');
						//$('#frm').attr('action', 'action');
						$('#frm').submit();
					}
				}
			}

			$("#update").click(function(check) {
				if ($("#frm").validationEngine('validateform')) {

				}
			});
		});
</script>
	<head>
		<title>商品分类属性类型修改</title>
		<meta http-equiv="Pragma" content="no-cache">
	</head>
	<body style="overflow-y: hidden">
		<form id="frm" name="frm" action="${basePath}/category/propertytype/updatePropertyType.action"
			method="post" targetType="hidden">
			<div class="div_cx">
				<table border="0" width="95%" align="center">
				<tr>
					<td>
						<div class="warning">
							<div  class="content">
								温馨提示 :商品分类属性类型修改
							</div>
						</div>
					</td>
				</tr>
					<tr>
						<td>
							<%@include file="propertytype_commontable.jsp"%>
						</td>
					</tr>
				</table>
			</div>
				<table border="0" cellspacing="0" cellpadding="4" width="60%"
					align="right">
					<tr>
						<td align="center">
							<rightButton:rightButton name="修改" onclick="" className="btn_sec" action="/category/propertytype/updatePropertyType.action" id="update"></rightButton:rightButton>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button class="btn_sec" onClick="window.close();">
								关闭
							</button>
					</tr>
				</table>
		</form>
	</body>
</html>
<%@ include file="/mgr/public/jsp/footinc.jsp"%>