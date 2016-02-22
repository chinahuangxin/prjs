<%@ page pageEncoding="GBK"%>
<%@ include file="/public/reportCss.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
	</head>
	<body class="report_body">
	<br>
	<div class="report_w16_title">�ֲ���ϸ</div>
	<table width="200%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#000000" style='border-collapse: collapse;' bgcolor="#eeeeee" height="8">
  <tr class="report_w14">
  	<td width="3%">���</td>
  	<td width="5%">��������</td>
    <td width="8%">����ʱ��</td>
    <td width="6%">���ּ�</td>
    <td width="8%">�����˺�</td>
    <td width="6%">���ֵ���</td>
    <td width="6%">��Ʒ</td>
    <td width="5%">��������</td>
    <td width="4%">�ֲֵ���</td>
    <td  width="6%">�ֲ���</td>
    <td  width="6%">�ֲּ�</td>
    <td  width="6%">�����</td>
    <td  width="7%">�ֲ�ӯ��</td>
    <td  width="9%">ռ�ñ�֤��</td>
    <td  width="7%">�����ڷ�</td>
    <td width="8%">�ر��Ա</td>
  </tr>
  <s:set var="num" value="1"></s:set>
  <s:set var="openprice" value="0"></s:set>
  <s:set var="holdqty" value="0"></s:set>
  <s:set var="holdprice" value="0"></s:set>
  <s:set var="clearprice" value="0"></s:set>
  <s:set var="holdpl" value="0"></s:set>
  <s:set var="holdmargin" value="0"></s:set>
  <s:set var="delayFee" value="0"></s:set>
			<s:iterator value="dataList()" var="dataMap">
				<tr class="report_w14_tdheight">
					<td>
						<s:property value="#num" />
						<s:set var="num" value="#num+1"></s:set>
					</td>
					<td>
						<s:date name="#dataMap.clearDate" format="yyyy-MM-dd"/>
					</td>
					<td>
						<s:date name="#dataMap.holdtime" format="yyyy-MM-dd HH:mm:ss"/>
					</td>
					<td align="right">
						<s:set var="a" value="format(#dataMap.openprice)" />
						<fmt:formatNumber value="${a }" pattern="#,##0.00"/>
						<s:if test="#dataMap.openprice!=null">
							<s:set var="openprice" value="#openprice+#dataMap.openprice"></s:set>
						</s:if>
					</td>
					<td>
						<s:property value="#dataMap.membersignno" />&nbsp;
					</td>
					<td>
						<s:property value="#dataMap.opentradeno" />&nbsp;
					</td>
					<td>
						<s:property value="#dataMap.commodityname" />
					</td>
					<td>
						<s:set var="bs" value="#dataMap.bs_flag" />
						<s:property value="flagMap[#bs]" />
						
					</td>
					<td>
						<s:property value="#dataMap.holdno" />
					</td>
					<td align="right">
						<s:set var="a" value="#dataMap.holdqty" />
						<fmt:formatNumber value="${a }" pattern="#,##0"/>
						<s:if test="#dataMap.holdqty!=null">
							<s:set var="holdqty" value="#holdqty+#dataMap.holdqty"></s:set>
						</s:if>
						
					</td>
					<td align="right">
						<s:set var="a" value="format(#dataMap.holdprice)" />
						<fmt:formatNumber value="${a }" pattern="#,##0.00"/>
						<s:if test="#dataMap.holdprice!=null">
							<s:set var="holdprice" value="#holdprice+#dataMap.holdprice"></s:set>
						</s:if>
					</td>
					<td align="right">
						<s:set var="a" value="format(#dataMap.clearprice)" />
						<fmt:formatNumber value="${a }" pattern="#,##0.00"/>
						<s:if test="#dataMap.clearprice!=null">
							<s:set var="clearprice" value="#clearprice+#dataMap.clearprice"></s:set>
						</s:if>
					</td>
					<td align="right">
						<s:set var="a" value="format(#dataMap.holdpl)" />
						<fmt:formatNumber value="${a }" pattern="#,##0.00"/>
						<s:if test="#dataMap.holdpl!=null">
							<s:set var="holdpl" value="#holdpl+#dataMap.holdpl"></s:set>
						</s:if>
					</td>
					<td align="right">
						<s:set var="a" value="format(#dataMap.holdmargin)" />
						<fmt:formatNumber value="${a }" pattern="#,##0.00"/>
						<s:if test="#dataMap.holdmargin!=null">
							<s:set var="holdmargin" value="#holdmargin+#dataMap.holdmargin"></s:set>
						</s:if>
					</td>
					<td align="right">
						<s:set var="a" value="format(#dataMap.delayFee)" />
						<fmt:formatNumber value="${a }" pattern="#,##0.00"/>
						<s:if test="#dataMap.delayFee!=null">
							<s:set var="delayFee" value="#delayFee+#dataMap.delayFee"></s:set>
						</s:if>
					</td>
					<td>
						<s:property value="#dataMap.s_memberno" />&nbsp;
					</td>
				</tr>
			</s:iterator>
			<tr class="report_w14">
					<td>
						�ϼƣ�
					</td>
					<td>
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
					<td align="right">
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
					
					<td>
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
					<td>
						&nbsp;
						
					</td>
					<td>
						&nbsp;
						
					</td>
					<td align="right">
						<s:set var="a" value="#holdqty" />
						<fmt:formatNumber value="${a }" pattern="#,##0"/>
					</td>
					<td align="right">
						&nbsp;
					</td>
					<td align="right">
						&nbsp;
						
					</td>
					<td align="right">
						<s:set var="a" value="#holdpl" />
						<fmt:formatNumber value="${a }" pattern="#,##0.00"/>
						
					</td>
					<td align="right">
						<s:set var="a" value="#holdmargin" />
						<fmt:formatNumber value="${a }" pattern="#,##0.00"/>
					</td>
					<td align="right">
						<s:set var="a" value="#delayFee" />
						<fmt:formatNumber value="${a }" pattern="#,##0.00"/>
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
		</table>
		<br>
	</body>
</html>