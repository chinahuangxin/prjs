<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="util.jsp" %>
<%
	//get query condition and handle
	String startClearDate = request.getParameter("startClearDate");
	String endClearDate = request.getParameter("endClearDate");
	
	String filter = " 1=1 ";	
	if(chcekNull(startClearDate)){
		filter += " and t.settleprocessdate>=to_date('"+startClearDate +"','yyyy-MM-dd')";
	}
	if(chcekNull(endClearDate)){
		filter += " and t.settleprocessdate<=to_date('"+endClearDate +"','yyyy-MM-dd')";
	}
	//query data
	String sql = " select t.commodityid commodityid,case when t.bs_flag=1 then '��' else '��' end bs, "+
						" t.firmid firmid,m.name name,sum(t.holdqty+t.gageqty) qty, "+
						" trunc(sum((t.holdqty+t.gageqty)*t.price)/sum(t.holdqty+t.gageqty),2) avgPrice, "+
						" max(settlePrice) settlePrice,sum(t.payout) payout,sum(t.SettleMargin) SettleMargin "+
						" from t_settleholdposition t,m_firm m where t.firmid=m.firmid and "+filter+
						" group by t.commodityid,t.bs_flag,t.firmid,m.name order by t.commodityid,t.bs_flag,t.firmid,m.name";
						
	DaoHelper dao = (DaoHelper)SysData.getBean("useBackDsDaoHelper");
    List list=dao.queryBySQL(sql);
    
    %>
    <br><center class="reportHead">���ջ��ܱ�</center><br><br>			
	<table align="center" width="600px">
	<tr><td colspan="7"></td></tr>
	<tr>
		<td class="reportRight" colspan="7">��ʼ����:<%=startClearDate %>&nbsp;��������:<%=endClearDate %></td>
	</tr>
	</table>
	<table align="center" class="reportTemp" width="600px">
	<tr>
	<td class="td_reportMdHead">��Ʒ����</td>
	<td class="td_reportMdHead">��/����</td>
	<td class="td_reportMdHead">�����̴���</td>
	<td class="td_reportMdHead">����</td>
	<td class="td_reportMdHead">ƽ����</td>
	<td class="td_reportMdHead">���ռ�</td>
	<td class="td_reportMdHead">���ձ�֤��(����ǰ)</td>
	<td class="td_reportRdHead">����</td>
	</tr>
    <% 
    	BigDecimal sumQty = new BigDecimal(0);
    	BigDecimal sumPayout = new BigDecimal("0.00");
    	for(int a = 0 ; a < list.size() ; a ++){
    		Map innerMap = (Map)list.get(a);
		%> 	
	<tr>
	<td class="td_reportMd">&nbsp;<%=turnToStr(innerMap.get("commodityid")) %></td>
	<td class="td_reportMd">&nbsp;<%=turnToStr(innerMap.get("bs")) %></td>
	<td class="td_reportMd">
	<% if(innerMap.get("qty") != null){ %>
	&nbsp;<%=turnToStr(innerMap.get("firmid")) %>
	<%} %>&nbsp;
	</td>
	<td class="td_reportMd1">&nbsp;<%=turnToNum(innerMap.get("qty")) %></td>
	<td class="td_reportMd1">&nbsp;
		<fmt:formatNumber value="<%=turnToNum(innerMap.get("avgPrice")) %>" pattern="#,##0.00"/>
		</td>
	<td class="td_reportMd1">&nbsp;
		<fmt:formatNumber value="<%=turnToNum(innerMap.get("settlePrice")) %>" pattern="#,##0.00"/>
		</td>
	<td class="td_reportMd1">&nbsp;
		<fmt:formatNumber value="<%=turnToNum(innerMap.get("SettleMargin")) %>" pattern="#,##0.00"/>
		</td>
	<td class="td_reportRd1">&nbsp;
		<fmt:formatNumber value="<%=turnToNum(innerMap.get("payout")) %>" pattern="#,##0.00"/>
		</td>
	</tr>
	<%
		sumQty = sumQty.add(turnToNum(innerMap.get("qty")));
		sumPayout = sumPayout.add(turnToNum(innerMap.get("payout")));
	}
	if(list.size()>0){
	%>
	<tr>
	<td class="td_reportMd"><b>�ܼ�</b></td>
	<td class="td_reportMd" colspan="2">&nbsp;</td>
	<td class="td_reportMd1"><b>&nbsp;<%=sumQty %></b></td>
	<td class="td_reportMd" colspan="3">&nbsp;</td>
	<td class="td_reportRd1"><b>&nbsp;<fmt:formatNumber value="<%=sumPayout %>" pattern="#,##0.00"/></b></td>
	</tr>
	<%
	}else{
	%>
	<tr>
		<td class="td_reportRd" colspan="8" align="left">
			�޷���������Ϣ��
		</td>
	</tr>
	<%
	}
	%>
</table>