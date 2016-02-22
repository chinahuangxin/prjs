<%@ page pageEncoding="GBK"%>
<%@ include file="/public/reportCss.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
	</head>
	<body class="report_body">
		<br>
		<br>
		<div class="report_w16_title">
			�ʽ�״��
		</div>
		<table width="240%" border="1" align="center" cellpadding="0"
			cellspacing="0" bordercolor="#000000"
			style='border-collapse: collapse;'>
			<s:set var="num" value="1"></s:set>
			<s:set var="lastbalance" value="0"></s:set>
			<s:set var="fundi" value="0"></s:set>
			<s:set var="fundo" value="0"></s:set>
			<s:set var="tradefee" value="0"></s:set>
			<s:set var="delayfee" value="0"></s:set>
			<s:set var="closepl" value="0"></s:set>
			<s:set var="holdpl" value="0"></s:set>
			<s:set var="todaybalance" value="0"></s:set>
			<s:set var="margin" value="0"></s:set>
			<s:set var="riskrate" value="0"></s:set>
			<tr class="report_w14">
			    <td width="3%">
			                  ���
			    </td>
			    <td width="7%">
					��������
				</td>
				<td width="8%">
					�������
				</td>
				<td width="7%">
					���
				</td>
				<td width="7%">
					����
				</td>
				<td width="7%">
					������
				</td>
				<td width="7%">
					���ڷ�
				</td>
				<td width="7%">
					ƽ��ӯ��
				</td>
				<td width="7%">
					�ֲ�ӯ��
				</td>
				<td width="9%">
					�������
				</td>
				<td width="9%">
					ռ�ñ�֤��
				</td>
				<td width="7%">
					������
				</td>
				<td width="7%">
					�����˺�
				</td>
				<td width="7%">
					�ͻ�����
				</td>
			</tr>
			<s:iterator value="dataList()" var="dataMap">
				<tr class="report_w14_neirong">
				    <td>
						<s:set var="num" value="#num" ></s:set>
						<s:property value="#num" />
					</td>
					<td>
						<s:date name="#dataMap.clearDate" format="yyyy-MM-dd"/>
					</td>
					<td  align="right">
						<s:set var="a" value="format(#dataMap.lastbalance)" />
						<fmt:formatNumber value="${a }" pattern="#,##0.00"/>
						<s:if test="#dataMap.lastbalance!=null">
							<s:set var="lastbalance" value="#dataMap.lastbalance+#lastbalance"></s:set>
						</s:if>
					</td>
					<td align="right">
						<s:set var="a" value="format(#dataMap.fundi)" />
						<fmt:formatNumber value="${a }" pattern="#,##0.00"/>
						<s:if test="#dataMap.fundi!=null">
							<s:set var="fundi" value="#dataMap.fundi+#fundi"></s:set>
						</s:if>
					</td>
					<td align="right">
						<s:set var="a" value="format(#dataMap.fundo)" />
						<fmt:formatNumber value="${a }" pattern="#,##0.00"/>
						<s:if test="#dataMap.fundo!=null">
							<s:set var="fundo" value="#dataMap.fundo+#fundo"></s:set>
						</s:if>
					</td>
					<td align="right">
						<s:set var="a" value="format(#dataMap.tradefee)" />
						<fmt:formatNumber value="${a }" pattern="#,##0.00"/>
						<s:if test="#dataMap.tradefee!=null">
							<s:set var="tradefee" value="#dataMap.tradefee+#tradefee"></s:set>
						</s:if>
					</td>
					<td align="right">
						<s:set var="a" value="format(#dataMap.delayfee)" />
						<fmt:formatNumber value="${a }" pattern="#,##0.00"/>
						<s:if test="#dataMap.delayfee!=null">
							<s:set var="delayfee" value="#dataMap.delayfee+#delayfee"></s:set>
						</s:if>
					</td>
					<td align="right">
						<s:set var="a" value="format(#dataMap.closepl)" />
						<fmt:formatNumber value="${a }" pattern="#,##0.00"/>
						<s:if test="#dataMap.closepl!=null">
							<s:set var="closepl" value="#dataMap.closepl+#closepl"></s:set>
						</s:if>
					</td>
					<td align="right">
						<s:set var="a" value="format(#dataMap.holdpl)" />
						<fmt:formatNumber value="${a }" pattern="#,##0.00"/>
						<s:if test="#dataMap.holdpl!=null">
							<s:set var="holdpl" value="#dataMap.holdpl+#holdpl"></s:set>
						</s:if>
					</td>
					<td align="right">
						<s:set var="a" value="format(#dataMap.todaybalance)" />
						<fmt:formatNumber value="${a }" pattern="#,##0.00"/>
						<s:if test="#dataMap.todaybalance!=null">
							<s:set var="todaybalance" value="#dataMap.todaybalance+#todaybalance"></s:set>
						</s:if>
					</td>
					<td align="right">
						<s:set var="a" value="format(#dataMap.margin)" />
						<fmt:formatNumber value="${a }" pattern="#,##0.00"/>
						<s:if test="#dataMap.margin!=null">
							<s:set var="margin" value="#dataMap.margin+#margin"></s:set>
						</s:if>
					</td>
					<td align="right">
						<s:property value="#dataMap.c_riskrate" />
					</td>
					<td>
						<s:property value="#dataMap.customerno" />&nbsp;
					</td>
					<td>
						<s:property value="#dataMap.customername" />
					</td>
				</tr>
			</s:iterator>
			<tr class="report_w14">
			        <td>�ϼ�:</td>
			        <td>&nbsp;</td>
					<td align="right">
						&nbsp;
					</td>
					<td align="right">
						<s:set var="a" value="format(#fundi)" />
						<fmt:formatNumber value="${a }" pattern="#,##0.00"/>
					</td>
					<td align="right">
						<s:set var="a" value="format(#fundo)" />
						<fmt:formatNumber value="${a }" pattern="#,##0.00"/>
					</td>
					<td align="right">
						<s:set var="a" value="format(#tradefee)" />
						<fmt:formatNumber value="${a }" pattern="#,##0.00"/>
					</td>
					<td align="right">
						<s:set var="a" value="format(#delayfee)" />
						<fmt:formatNumber value="${a }" pattern="#,##0.00"/>
					</td>
					<td align="right">
						<s:set var="a" value="format(#closepl)" />
						<fmt:formatNumber value="${a }" pattern="#,##0.00"/>
					</td>
					<td align="right">
						<s:set var="a" value="format(#holdpl)" />
						<fmt:formatNumber value="${a }" pattern="#,##0.00"/>
					</td>
					<td align="right">
						&nbsp;
					</td>
					<td align="right">
						<s:set var="a" value="format(#margin)" />
						<fmt:formatNumber value="${a }" pattern="#,##0.00"/>
					</td>
					<td align="right">
						&nbsp;
					</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
		</table>
		<br>
		<br>
	</body>
</html>