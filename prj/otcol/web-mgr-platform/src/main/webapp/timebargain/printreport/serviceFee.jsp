<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="util.jsp" %>
<%
	//get query condition and handle
	String startClearDate = request.getParameter("startClearDate");
	String endClearDate = request.getParameter("endClearDate");
	
	String filter = " 1=1 ";
	String unionFilter = " 1=1 ";	
	if(chcekNull(startClearDate)){
		filter += " and t.cleardate>=to_date('"+startClearDate +"','yyyy-MM-dd')";
		unionFilter += " and s.settleprocessdate>=to_date('"+startClearDate +"','yyyy-MM-dd')";
	}
	if(chcekNull(endClearDate)){
		filter += " and t.cleardate<=to_date('"+endClearDate +"','yyyy-MM-dd')";
		unionFilter += " and s.settleprocessdate<=to_date('"+endClearDate +"','yyyy-MM-dd')";
	}
	//query data
	String sql = "select x.commodityid,x.agreeAmount,x.TransferAmount,x.TradeFee,x.ding," +
					"nvl(c.tranAmount,0) tranAmount,nvl(c.SettleFee,0) SettleFee " +
					"from (select d.commodityid,sum(case when OrderType = 1 then Quantity else 0 end) agreeAmount," +
					"sum(case when OrderType = 2 then Quantity else 0 end) TransferAmount, sum(TradeFee) TradeFee," +
					"sum(ding) ding from (select a.commodityid,nvl(Quantity, 0) Quantity,nvl(OrderType, 0) OrderType," +
					"nvl(TradeFee, 0) TradeFee,nvl(ding, 0) ding from (select t.commodityid from t_h_trade t " +
					"where " +filter+ 
					"group by t.commodityid union select s.commodityid from T_SettleHoldPosition s where " +unionFilter+
					" group by s.commodityid) a,(select commodityid,sum(Quantity) Quantity,OrderType,sum(TradeFee) TradeFee," +
					"sum((case when OrderType = 2 and to_char(TradeAtClearDate, 'yyyy-MM-dd') = to_char(AtClearDate, 'yyyy-MM-dd') then Quantity else 0 end)) ding " +
					"from t_h_trade t where "+filter+" group by commodityid,OrderType) b  " +
					"where a.commodityid = b.commodityid(+) order by a.commodityid) d group by d.commodityid order by d.commodityid) x," +
					"(select s.commodityid,sum(HoldQty + GageQty) tranAmount,sum(SettleFee) SettleFee from T_SettleHoldPosition s " +
					"where "+unionFilter+" group by s.commodityid) c " +
					"where x.commodityid = c.commodityid(+) order by x.commodityid";
	//System.out.println(sql);					
	DaoHelper dao = (DaoHelper)SysData.getBean("useBackDsDaoHelper");
    List list=dao.queryBySQL(sql);
    
    %>
    <br><center class="reportHead">手续费统计表</center><br><br>
	<table align="center" width="600px" border="0">
	<tr>
		<td class="reportRight" colspan="7">起始日期:<%=startClearDate %>&nbsp;结束日期:<%=endClearDate %></td>
	</tr>
	</table>
	<table align="center" class="reportTemp" width="600px">
	<tr>
	<td class="td_reportMdHead">商品代码</td>
	<td class="td_reportMdHead">订立量</td>
	<td class="td_reportMdHead">转让量</td>
	<td class="td_reportMdHead">交收量</td>
	<td class="td_reportMdHead">交易手续费</td>
	<td class="td_reportMdHead">交收手续费</td>
	<td class="td_reportRdHead">当订当转量</td>
	</tr>
    <%    	
		BigDecimal sumSettleFee = new BigDecimal("0.00");
		BigDecimal sumTradeFee = new BigDecimal("0.00");
		BigDecimal sumTranAmount = new BigDecimal(0);
		BigDecimal sumTransferAmount = new BigDecimal(0);
		BigDecimal sumAgreeAmount = new BigDecimal(0);
		BigDecimal sumDing = new BigDecimal(0);
    	for(int a = 0 ; a < list.size() ; a ++){
    		Map innerMap = (Map)list.get(a);
		%> 	
	<tr>
	<td class="td_reportMd">&nbsp;<%=turnToStr(innerMap.get("commodityid")) %></td>
	<td class="td_reportMd1">&nbsp;<%=turnToNum(innerMap.get("agreeAmount")) %></td>
	<td class="td_reportMd1">&nbsp;<%=turnToNum(innerMap.get("TransferAmount")) %></td>
	<td class="td_reportMd1">&nbsp;<%=turnToNum(innerMap.get("tranAmount")) %></td>
	<td class="td_reportMd1">&nbsp;<fmt:formatNumber value="<%=turnToNum(innerMap.get("TradeFee")) %>" pattern="#,##0.00"/></td>
	<td class="td_reportMd1">&nbsp;<fmt:formatNumber value="<%=turnToNum(innerMap.get("SettleFee")) %>" pattern="#,##0.00"/></td>
	<td class="td_reportRd1">&nbsp;<%=turnToNum(innerMap.get("ding")) %></td>
	</tr>
	<%
		sumAgreeAmount = sumAgreeAmount.add(turnToNum(innerMap.get("agreeAmount")));
		sumTransferAmount = sumTransferAmount.add(turnToNum(innerMap.get("TransferAmount")));
		sumTranAmount = sumTranAmount.add(turnToNum(innerMap.get("tranAmount")));
		sumTradeFee = sumTradeFee.add(turnToNum(innerMap.get("TradeFee")));
		sumSettleFee = sumSettleFee.add(turnToNum(innerMap.get("SettleFee")));
		sumDing = sumDing.add(turnToNum(innerMap.get("ding")));
	}
	if(list.size()>0){
	%>
	<tr>
	<td class="td_reportMd"><b>合计</b></td>
	<td class="td_reportMd1"><b>&nbsp;<%=sumAgreeAmount %></b></td>
	<td class="td_reportMd1"><b>&nbsp;<%=sumTransferAmount %></b></td>
	<td class="td_reportMd1"><b>&nbsp;<%=sumTranAmount %></b></td>
	<td class="td_reportMd1"><b>&nbsp;<fmt:formatNumber value="<%=sumTradeFee %>" pattern="#,##0.00"/></b></td>
	<td class="td_reportMd1"><b>&nbsp;<fmt:formatNumber value="<%=sumSettleFee %>" pattern="#,##0.00"/></b></td>
	<td class="td_reportRd1"><b>&nbsp;<%=sumDing %></b></td>
	</tr>
	<%}else{%>
		<tr>
			<td class="td_reportRd" colspan="7">
				无符合条件信息。
			</td>
		</tr>	
		<%}%>
	</table>