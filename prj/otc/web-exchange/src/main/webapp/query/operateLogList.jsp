
<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/public/session.jsp"%>
<%@page import="java.util.*"%>
<html xmlns:MEBS>
	<head>
		<title>������־��ѯ</title>
		<%@ include file="/public/ecsideLoad.jsp"%>
		<IMPORT namespace="MEBS"
			implementation="${basePath}/common/jslib/calendar.htc">
	</head>
	<body onload="init();">
		<div id="main_body">
			<table class="table1_style" border="0" cellspacing="0"
				cellpadding="0">
				<tr>
					<td>
						<div class="div_tj">
							<form name="frm"
								action="${basePath }/query/queryOperateLogSearch/list.action"
								method="post">
								<table border="0" cellpadding="0" cellspacing="0"
									class="table2_style">
									<tr>
										<td class="table2_td_widthmax">
											<div class="div2_top">
												<table class="table3_style" border="0" cellspacing="0"
													cellpadding="0" style="table-layout: fixed">
													<input type="hidden" name="queryType" id="queryType"
														value="H">
													<tr>
														<td class="table3_td_1" align="left">
															��ʼ����:&nbsp;
															<label>
																<input type="text" style="width: 100px" id="beginDate"
																	class="wdate" maxlength="10"
																	name="${GNNT_}primary.operateTime[>=][date]"
																	value='${oldParams["primary.operateTime[>=][date]"]}'
																	onFocus="WdatePicker({el:this,dateFmt:'yyyy-MM-dd',skin:'whyGreen'})">
															</label>
														</td>
														<td class="table3_td_1" align="left">
															��������:&nbsp;
															<label>
																<input type="text" style="width: 100px" id="endDate"
																	class="wdate" maxlength="10"
																	name="${GNNT_}primary.operateTime[<=][date]"
																	value='${oldParams["primary.operateTime[<=][date]"]}'
																	onFocus="WdatePicker({el:this,dateFmt:'yyyy-MM-dd',skin:'whyGreen'})">
															</label>
														</td>
														<td class="table3_td_1" align="left">
															������:&nbsp;
															<label>
																<input type="text" name="${GNNT_}primary.operator[like]"
																	id="operateType"
																	value="${oldParams['primary.operator[like]'] }"
																	class="input_textmin" />
															</label>
														</td>
														<td align="left" class="table3_td_1">
															�������ͣ�&nbsp;
															<select id="moudleId"
																name="${GNNT_}primary.operateType[=][long]"
																class="input_textmin">
																<option value="">
																	��ѡ��
																</option>
																<c:forEach items="${logCataLogList}" var="logCataLog">
																	<option value="${logCataLog.cataLogId}">
																		${logCataLog.catalogName }
																	</option>
																</c:forEach>
															</select>
															<script type="text/javascript">
frm.moudleId.value='${oldParams['primary.operateType[=][long]'] }';
													</script>
														</td>
														<td class="table3_td_anniu" align="left">
															<button class="btn_sec" onClick="search1()">
																��ѯ
															</button>
															&nbsp;&nbsp;
															<button class="btn_cz" onClick="myReset()">
																����
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
										<ec:table items="resultList"
											autoIncludeParameters="${empty param.autoInc}"
											var="globalLog"
											action="${basePath }/query/queryOperateLogSearch/list.action?sortName=operateTime&sortOrder=true"
											title="" minHeight="345" listWidth="100%"
											retrieveRowsCallback="limit" sortRowsCallback="limit"
											filterRowsCallback="limit"
											style="table-layout:fixed;">
											<ec:row style="text-align:center;" rowId="${globalLog.id}">
												<ec:column width="6%" property="_0" title="���"
													value="${GLOBALROWCOUNT}" sortable="false"
													filterable="false" />
												<ec:column property="operator[like]" title="������" width="10%"
													style="text-align:left; " value="${globalLog.operator}"
													ellipsis="true" />
												<ec:column property="operateIp[like]" title="������IP"
													width="10%" style="text-align:left; "
													value="${globalLog.operateIp}" ellipsis="true" />
												<ec:column property="operateTime[=][date]" title="����ʱ��"
													width="13%" style="text-align:left; " sortable="false"
													filterable="false">
													${datefn:formatdate(globalLog.operateTime)}
												</ec:column>
												<ec:column property="primary.operatorType[=][String]"
													title="ϵͳ" width="12%" style="text-align:left;" ellipsis="true" editTemplate="esc_systemMap">
												${firstMap[globalLog.operatorType]}
												</ec:column>
												<ec:column property="logCataLog.catalogName[=][String]"
													title="��������" width="10%" style="text-align:left;"
													value="${globalLog.operateName}" ellipsis="true" />
												<ec:column property="operateContent[allLike]" title="��������"
													width="36%" style="text-align:left;"
													value="${globalLog.operateContent}" ellipsis="true" />
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
		<!-- �༭�͹�����ʹ�õ� ͨ�õ��ı���ģ�� -->
		<textarea id="ecs_t_input" rows="" cols="" style="display: none">
			<input type="text" class="inputtext" value=""
				onblur="ECSideUtil.updateEditCell(this)" style="width: 100%;"
				name="" />
		</textarea>
		<!-- �༭�͹�����ʹ�õĽ�ƽ��ģ�� -->
		<textarea id="esc_systemMap" rows="" cols="" style="display: none">
		<select onBlur="ECSideUtil.updateEditCell(this)" style="width: 100%;"
				name="primary.operatorType[=][String]">
			<ec:options items="firstMap" />
		</select>
	    </textarea>
	</body>
</html>

<SCRIPT type="text/javascript">
		function search1(){
			checkQueryDate(frm.beginDate.value,frm.endDate.value);
		}
		function forView(content, id) {
			document.getElementById(id).title = content;
		}
function getDate() {
	var date = new Date();
	var thisYear = date.getYear();
	var thisMonth = date.getMonth() + 1;
	if (thisMonth < 10) {
		thisMonth = "0" + thisMonth;
	}
	var thisDay = date.getDate();
	if (thisDay < 10) {
		thisDay = "0" + thisDay;
	}
	return thisYear + "-" + thisMonth + "-" + thisDay;
}
function init() {
	if(frm.beginDate.value=="" && frm.endDate.value==""){
		frm.beginDate.value =getDate();
	frm.endDate.value =getDate() ;
	}
	
}
		</SCRIPT>