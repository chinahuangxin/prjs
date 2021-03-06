<%@ page contentType="text/html;charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/front/public/includefiles/allIncludeFiles.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>交收申报</title>
		
		<link href="${skinPath}/css/mgr/memberadmin/module.css"
			rel="stylesheet" type="text/css" />
			<style type="text/css">
				.deliveryTitle{height:30px;background:url(../images/tabbg.gif) repeat-x;border-left:solid 1px #ddd;border-right:solid 1px #ddd;margin : 20px 14px 0px 30px;color : #FF6600; font-size : 14px; font-weight : bold;text-align: center;vertical-align: middle;}
				.deliverydiv{padding:10px;border-width:0 1px 1px 1px;border-color:#ddd;border-style:solid;}
			</style>
	</head>
	<body>
		<!-------------------------Body Begin margin : 20px auto 20px 14px------------------------->
		<div class = "deliveryTitle">交收申报</div>
		<div class = "deliverydiv" style="margin : 0px 14px 20px 30px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class = "font_b" style="height: 172px">
				<tr>
					<c:choose>
						<c:when test = "${marketinfo['NEUTRALFLAG'] == 0 }">
							<td width="50%" align="center"><input type="radio" name = "delayOrderType" value = "1" checked="checked"/>交&nbsp;&nbsp;&nbsp;&nbsp;收</td>
							<td width="50%" style="padding-left: 10px;display: none;"><input type="radio" name = "delayOrderType" value = "2" />中立仓</td>
						</c:when>
						<c:otherwise>
							<td width="50%" align="center"><input type="radio" name = "delayOrderType" value = "1" checked="checked"/>交&nbsp;&nbsp;&nbsp;&nbsp;收</td>
							<td width="50%" style="padding-left: 10px"><input type="radio" name = "delayOrderType" value = "2"/>中立仓</td>
						</c:otherwise>
					</c:choose> 
				</tr>
				<tr>
					<td align="center"><input type="radio" name="bs_flag" value="1"/>买&nbsp;&nbsp;&nbsp;&nbsp;入</td>
					<td style="padding-left: 10px"><input type="radio" name="bs_flag" value="2" />卖&nbsp;&nbsp;&nbsp;&nbsp;出</td>
				</tr>
				<tr>
					<td align="center">商品代码：</td>
					<td style="padding-left: 10px">
						<select name = "commodityId" id = "settleDeclare_commodityId">
							<c:forEach items = "${commodityIdList }" var = "commodityItem">
								<option value="${commodityItem['COMMODITYID']}">${commodityItem['COMMODITYID']}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td align="center">申请数量：</td>
					<td style="padding-left: 10px"><input name="quantity" id = "settleDeclare_quantity" type="text" style="width: 80px;"/></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input name="applayBtn" id = "applayBtn" type="button" value = "提交" class = "btn" action = "${frontPath }/app/timebargain/delayAjax/delayOrder.action"/></td>
				</tr>
			</table>
		</div>
		
		<!-------------------------Body End------------------------->
	</body>
</html>