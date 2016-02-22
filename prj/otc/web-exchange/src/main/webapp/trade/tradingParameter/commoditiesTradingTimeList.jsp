<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/public/session.jsp"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
		<title>系统用户浏览</title>
		<%@ include file="/public/ecsideLoad.jsp"%>
		<SCRIPT type="text/javascript">
			function type_onclick(num,name){
				var url = "${basePath}/tradeManage/commodityTradingParameter/displayCommodity.action?tradeTimeSequenct="+num+"&name="+name;
//alert(url);
				var value=dialog(url, window, 800, 500);
				if(value==1111)
					window.location.reload();
			}
		
		</SCRIPT>
	</head>
	<body>
		<div id="main_body">
			<table class="table1_style" border="0" cellspacing="0"
				cellpadding="0">
				<tr>
					<td>
						<div class="div_tj">
							<form name="frm"
								action="${basePath}/tradeManage/commodityTradingParameter/searchList.action"
								method="post">
								<table border="0" cellpadding="0" cellspacing="0"
									class="table2_style">
									<tr>
										<td height="40" width="370">
											<div class="div2_top">
												<table class="table3_style" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td class="table3_td_1mid" align="left">
															交易节名称:&nbsp;
															<label>
																<input type="text"
																	class="input_text" name="${GNNT_}name[like]"
																value="${oldParams['name[like]'] }" id="sectionId" />
															</label>
														</td>
														<td class="table3_td_anniu" align="left">
															<button class="btn_sec" onclick="submitMember()">
																查询
															</button>&nbsp;&nbsp;
															<button class="btn_cz" onclick="myReset()">
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
						
						<div class="div_gn">
							<button class="anniu_btn" id='update' onclick="updateRMI()">
								实时生效
							</button>
						</div>

						<div class="div_list">
							<table id="tb" border="0" cellspacing="0" cellpadding="0"
								width="100%">
								<tr>
									<td>
										<ec:table items="resultList"
											autoIncludeParameters="${empty param.autoInc}"
											var="tradeTime"
											action="${basePath}/tradeManage/commodityTradingParameter/searchList.action"
											minHeight="345" listWidth="100%"
											retrieveRowsCallback="limit" sortRowsCallback="limit"
											filterRowsCallback="limit" 
											csvFileName="导出列表.csv" style="table-layout:fixed">
											<ec:row recordKey="${tradeTime.sectionId}">
												<ec:column width="3%" property="_0" title="序号" value="${GLOBALROWCOUNT}" sortable="false" filterable="false" />
												<ec:column property="name[like]" title="交易节名称" width="19%"
													style="text-align:left;">
													<a href="#" class="blank_a"
														onclick="return update('${tradeTime.sectionId}');"><font
														color="#880000">${tradeTime.name}</font>
													</a>
												</ec:column>
												<ec:column property="startTime[like]" title="交易开始时间"
													width="15%" style="text-align:left;"
													value="${tradeTime.startTime}" />
												<ec:column property="endTime[like]" title="交易结束时间"
													width="18%" style="text-align:left;"
													value="${tradeTime.endTime}" />
												<ec:column property="startDate[like]" title="交易起始日期"
													width="18%" style="text-align:left;"
													value="${tradeTime.startDate}" />
												<ec:column property="endDate[like]" title="交易结束日期"
													width="18%" style="text-align:left;"
													value="${tradeTime.endDate}" />
												<ec:column property="endDate[like]" title="交易节商品"
													width="18%" style="text-align:left;"
												>
													<a href="javascript:type_onclick(${GLOBALROWCOUNT},'${tradeTime.name}')">设置</a>
												</ec:column>
							<!--value="<button onclick='type_onclick(${GLOBALROWCOUNT})'>设置</button>"   -->						 
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
		<!-- 编辑和过滤所使用的交易状态模板 -->
		<textarea id="ecs_t_status" rows="" cols="" style="display: none">
			<select onblur="ECSideUtil.updateEditCell(this)" style="width: 100%;"
				name="status[=][int]">
				<ec:options items="tradeStatusMap" />
			</select>
	    </textarea>
		<SCRIPT type="text/javascript">
		function add(){
			var url = "${basePath}/tradeManage/commodityTradingParameter/forwardAdd.action";
			ecsideDialog(url,"",580,280);
		}
		function deleteByCheckBox(){
			var url = "${basePath}/tradeManage/commodityTradingParameter/delete.action";
			deleteEcside(ec.ids,url);
		}
		function update(id){
			var url = "${basePath}/tradeManage/commodityTradingParameter/forwardUpdate.action?obj.sectionId="+id;
			ecsideDialog(url,"",580,280);
		}
		function submitMember(){
			frm.submit();
		}
		function updateRMI() {
			if(affirm("您确定要操作吗？")){
				frm.action = "${basePath}/tradeManage/commodityTradingParameter/updateRMI.action";
				frm.submit();
			}
		}
		</SCRIPT>
	</body>
</html>
<%@ include file="/public/footInc.jsp"%>