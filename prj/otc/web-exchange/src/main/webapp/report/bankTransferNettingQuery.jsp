<%@ page contentType="text/html;charset=GBK"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="/public/session.jsp"%>
<html xmlns:MEBS>
	<head>
		<title>主次银行划转轧差记录表</title>
		<%@ include file="/public/ecsideLoad.jsp"%>
		<import namespace="MEBS"
			implementation="${basePath}/report/public/calendar.htc">
	</head>
	<body id="main_body" onload="init();">
		<div id="main_body">
			<table class="table1_style" border="0" cellspacing="0"
				cellpadding="0">
				<tr>
					<td>
						<div class="div_tj">
							<form
								action="${basePath}/report/bankTransferNetting/bankTransferNettingReportQuary.action?sortName=primary.clearDate&sortOrder=true"
								name="frm" id="frm" method="post">
								<table border="0" cellpadding="0" cellspacing="0"
									class="table2_style">
									<tr>
										<td class="table2_td_widthmax">
											<div class="div2_top">
												<table class="table3_style" border="0" cellspacing="0"
													cellpadding="0" style="table-layout: fixed">
													<tr>
														<td class="table3_td_1tjcx_1" align="left">
															银行：
															<span class="right_03zi"><select id="bank"
																	name="${GNNT_}bankCode[like]"
																	class="input_textmin">
																	<option value="">
																		请选择
																	</option>
																	<c:forEach items="${bankList}" var="bank">
																		<option value="${bank.bankId}">
																			${bank.bankName }
																		</option>
																	</c:forEach>
																</select> </span>
															<script type="text/javascript">
frm.bank.value = '${oldParams["bankCode[like]"] }';
</script>
														</td>
														<td class="table3_td_1tjcx_1" align="left">
															开始日期：
															<input type="text" style="width: 100px" id="startDate"
																class="wdate" maxlength="10"
																name="${GNNT_}primary.clearDate[>=][date]"
																value='${oldParams["primary.clearDate[>=][date]"]}'
																onFocus="WdatePicker({el:this,dateFmt:'yyyy-MM-dd',skin:'whyGreen'})">
														</td>
														<td class="table3_td_1tjcx_1" align="left">
															结束日期：
															<input type="text" style="width: 100px" id="endDate"
																class="wdate" maxlength="10"
																name="${GNNT_}primary.clearDate[<=][date]"
																value='${oldParams["primary.clearDate[<=][date]"]}'
																onFocus="WdatePicker({el:this,dateFmt:'yyyy-MM-dd',skin:'whyGreen'})">
														</td>
														<td class="table3_td_1tjcx_1" align="left">
															<button class="btn_sec" onclick="select1()">
																查询
															</button>
															&nbsp;
															<button class="btn_cz" onclick="myReset();">
																重置
															</button>
														</td>
													</tr>
												</table>
											</div>
										</td>
									</tr>
								</table>
							</form>
						</div>
						<div class="div_list">
							<table id="tb" border="0" cellspacing="0" cellpadding="0"
								width="100%">
								<tr>
									<td>
										<ec:table items="list"
											autoIncludeParameters="${empty param.autoInc}"
											var="customerHold"
											action="${basePath}/report/bankTransferNetting/bankTransferNettingReportQuary.action?sortName=primary.clearDate&sortOrder=true"
											title="" minHeight="345" listWidth="100%"
											retrieveRowsCallback="limit" sortRowsCallback="limit"
											filterRowsCallback="limit" csvFileName="导出列表.csv"
											style="table-layout:fixed">
											<ec:row recordKey="${customer.customerNo}">
												<ec:column width="3%" property="_0" title="序号"
													value="${GLOBALROWCOUNT}" sortable="false"
													filterable="false" />
												<ec:column property="b_date[=][date]" title="结算日期"
													width="5%" style="text-align:left; " ellipsis="true">
													<fmt:formatDate value="${customerHold.clearDate}"
														pattern="yyyy-MM-dd" />
												</ec:column>
												<ec:column property="bankName[like]" title="银行名称" width="6%"
													style="text-align:left; " value="${customerHold.bankName}"
													ellipsis="true" />
												<ec:column property="transferfund[=][double]" title="转账总和"
													width="8%" style="text-align:right; " filterable="false">
													<fmt:formatNumber value="${customerHold.transferfund}"
														pattern="#,##0.00" />
												</ec:column>
											</ec:row>
										</ec:table>
									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<!-- 编辑和过滤所使用的 通用的文本框模板 -->
		<textarea id="ecs_t_input" rows="" cols="" style="display: none">
			<input type="text" class="inputtext" value=""
				onblur="ECSideUtil.updateEditCell(this)" style="width: 100%;"
				name="" />
		</textarea>
		<script type="text/javascript">
function select1() {
	var action = frm.action;
	frm.action = "${basePath}/report/bankTransferNetting/bankTransferNettingReportQuary.action?sortName=primary.clearDate&sortOrder=true";
	frm.submit();
	frm.action = action;
}
function xls() {
	frm.type.value = "xls";
	select1();
	frm.type.value = "";
}
function clickText() {
	var memberIds = frm.memberIds.value;
	var url = "${basePath}/report/customer/memberInfoList.action?oldMemberIds="
			+ memberIds;
	var result = window.showModalDialog(url, '',
			"dialogWidth=350px;dialogHeight=520px");
	if (result != null && result != '') {
		var result1 = result.split('####');
		frm.memberIds.value = result1[0];
		frm.memberNames.value = result1[1];
	}
}
function checkReportSDate(startDate, endDate, startName, endName) {

	var now = new Date();
	var s = new Date(Date.parse(startDate.replace(/-/g, "/")));
	var e = new Date(Date.parse(endDate.replace(/-/g, "/")));
if (s!="" && s > now ) {
		alert(startName+"不能大于当前日期");
		return false;
	}else if(e!="" &&　e>now){
		alert(endName+"不能大于当前日期");
		return false;
	}
	else if(s>e){
		alert(startName+"不能大于"+endName);
		return false;
	}else{
		return true;
	}
	
}
function init() {
	if (frm.startDate.value == "" && frm.endDate.value == "") {
		frm.startDate.value = '${date}';
		frm.endDate.value = '${date}';
	}

}
</script>