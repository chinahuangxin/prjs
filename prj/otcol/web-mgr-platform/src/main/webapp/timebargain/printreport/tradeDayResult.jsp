<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="util.jsp" %>
<%
	//get query condition and handle 
	String cleardate = request.getParameter("cleardate");
	if(cleardate == null || "".equals(cleardate)){
		cleardate = "2008-2-31";//��һ�������ڵ�ʱ��ƴsql
	}
	//query data
	String sql = " select t.a_tradeno a_tradeno,to_char(t.tradetime,'yyyy-MM-dd') tradeDate,to_char(t.tradetime,'hh24:mi:ss') tradeTime, "+
				" t.firmid firmid,t.customerid customerid,t.commodityid commodityid, "+
				" (case when t.bs_flag=1 then '���' else '����' end)||(case when t.OrderType=1 then '����' else 'ת��' end) type,"+
				" t.price price,t.quantity quantity,to_char(o.ordertime,'hh24:mi:ss') ordertime "+
				" from t_h_trade t, t_h_orders o where to_date(to_char(t.cleardate,'yyyy-MM-dd'),'yyyy-MM-dd')=to_date('"+cleardate+"','yyyy-MM-dd') "+
				" and o.a_orderno=t.a_orderno and t.cleardate=o.cleardate order by t.firmid,t.a_tradeno";
						
	DaoHelper dao = (DaoHelper)SysData.getBean("useBackDsDaoHelper");
    List list=dao.queryBySQL(sql);
    
    %>
    <br>
	<center class="reportHead">���ճɽ���¼��</center><br><br>
	<table align="center" width="600px" border="0">
	<tr>
		<td class="reportRight" colspan="9">����:<%=cleardate %></td>
	</tr>
	</table>
	<table align="center" class="reportTemp" width="600px">
	<tr>
	<td class="td_reportMdHead">�ɽ���</td>
	<td class="td_reportMdHead">�ɽ�ʱ��</td>
	<td class="td_reportMdHead">�����̴���</td>
	<td class="td_reportMdHead">��������</td>
	<td class="td_reportMdHead">��Ʒ����</td>
	<td class="td_reportMdHead">��������</td>
	<td class="td_reportMdHead">�ɽ���</td>
	<td class="td_reportMdHead">����</td>
	<td class="td_reportRdHead">ί��ʱ��</td>
	</tr>
    <%    	
		BigDecimal sumQuantity = new BigDecimal(0);
		
    	for(int a = 0 ; a < list.size() ; a ++){
    		Map innerMap = (Map)list.get(a);
		%> 	
	<tr>
	<td class="td_reportMd1">&nbsp;<%=turnToNum(innerMap.get("a_tradeno")) %></td>
	<td class="td_reportMd">&nbsp;<%=turnToStr(innerMap.get("tradeTime")) %></td>
	<td class="td_reportMd">&nbsp;<%=turnToStr(innerMap.get("firmid")) %></td>
	<td class="td_reportMd">&nbsp;<%=turnToStr(innerMap.get("customerid")) %></td>
	<td class="td_reportMd">&nbsp;<%=turnToStr(innerMap.get("commodityid")) %></td>
	<td class="td_reportMd">&nbsp;<%=turnToStr(innerMap.get("type")) %></td>
	<td class="td_reportMd1">&nbsp;<fmt:formatNumber value="<%=turnToNum(innerMap.get("price")) %>" pattern="#,##0.00"/></td>
	<td class="td_reportMd1">&nbsp;<%=turnToNum(innerMap.get("quantity")) %></td>
	<td class="td_reportRd">&nbsp;<%=turnToStr(innerMap.get("ordertime")) %></td>
	</tr>
	<%
		sumQuantity = sumQuantity.add(turnToNum(innerMap.get("quantity")));
	}
	if(list.size()>0){
	%>
	<tr>
	<td class="td_reportMd"><b>�ϼ�</b></td>
	<td class="td_reportMd">&nbsp;</td>
	<td class="td_reportMd">&nbsp;</td>
	<td class="td_reportMd">&nbsp;</td>
	<td class="td_reportMd">&nbsp;</td>
	<td class="td_reportMd">&nbsp;</td>
	<td class="td_reportMd">&nbsp;</td>
	<td class="td_reportMd1"><b>&nbsp;<%=sumQuantity %></b></td>
	<td class="td_reportRd">&nbsp;</td>
	</tr>
	<%}else{%>
		<tr>
		<td class="td_reportRd" colspan="9">
			�޷���������Ϣ��
		</td>
	</tr>	
		<%}%>
	</table>