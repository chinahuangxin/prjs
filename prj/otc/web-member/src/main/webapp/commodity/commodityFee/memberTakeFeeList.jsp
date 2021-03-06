<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/public/session.jsp"%>
<html>
	<head>
		<title>会员收取手续费列表</title>
		<%@ include file="/public/ecsideLoad.jsp"%>
	</head>
	<body>
		<div id="main_body">
			<table class="table1_style" border="0" cellspacing="0"
				cellpadding="0">
				<tr>
					<td>
						<div class="div_tj">
							<form name="frm"
								action="${basePath}/commodity/takeFee/list.action?sortName=commodity.id"
								method="post">
								<table border="0" cellpadding="0" cellspacing="0"
									class="table2_style">
									<tr>
										<td class="table2_td_width">
											<div class="div2_top">
												<table class="table3_style" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td class="table3_td_1" align="left">
															商品名称:&nbsp;
															<label>
																<input type="text" class="input_text"
																	name="${GNNT_}commodity.name[like]" id="commodityName"
																	value="${oldParams['commodity.name[like]'] }" />
															</label>
														</td>
														<td class="table3_td_1" align="left">
															会员名称:&nbsp;
															<label>
																<input type="text" id="memberInfoName"
																	class="input_text" name="${GNNT_}memberInfo.name[like]"
																	value="${oldParams['memberInfo.name[like]'] }" />
															</label>
														</td>
														<td class="table3_td_anniu" align="left">
															<button class="btn_sec" onclick="submitMemberTakeFee()">
																查询
															</button>
															&nbsp;&nbsp;
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
							<button class="anniu_btn" onclick="addtakeFeePoint()" id="update">
								添加
							</button>
							<button class="anniu_btn" onclick="deletetakeFeePoint()"
								id="delete">
								删除
							</button>
						</div>

						<div class="div_list">
							<table id="tb" border="0" cellspacing="0" cellpadding="0"
								width="100%">
								<tr>
									<td>
										<ec:table items="resultList"
											autoIncludeParameters="${empty param.autoInc}" var="takeFee"
											action="${basePath}/commodity/takeFee/list.action"
											minHeight="345" listWidth="100%" retrieveRowsCallback="limit"
											sortRowsCallback="limit" filterRowsCallback="limit"
											 csvFileName="导出列表.csv"
											style="table-layout:fixed">

											<ec:row recordKey="${takeFee.commodityId}">
												<ec:column width="4%" property="_0" title="序号"
													value="${GLOBALROWCOUNT}" sortable="false"
													filterable="false" />
												<ec:column property="commodity.name[like]" title="商品名称"	width="15%" style="text-align:left; " ellipsis="true"> <a href="#" class="blank_a" onclick="return forwardUpdate('${takeFee.commodityId}','${takeFee.m_FirmId }');"><font color="#880000">${takeFee.commodityName}</font> </a> </ec:column>
												<ec:column property="memberInfo.name[Like]" title="会员名称"
													width="15%" style="text-align:left;"
													value="${takeFee.memberName}" />
												<ec:column property="feeAlgr[=][int]" title="手续费算法"
													width="15%" style="text-align:left;"
													editTemplate="ecs_feeAlgr">
													<c:set var="marginAlgrKey">
														<c:out value="${takeFee.feeAlgr}"></c:out>
													</c:set>
											  		${feeAlgrMap[marginAlgrKey]}
									            </ec:column>
												<ec:column property="feeRate[like]" title="手续费系数"
													width="10%" style="text-align:right; "
													value="${takeFee.feeRate_log}" filterable="false" />
												<ec:column property="mkt_FeeRate[like]"
													title="交易所收取手续费" width="15%"
													style="text-align:right; "
													value="${takeFee.mkt_FeeRate_log}" />
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
		<!-- 编辑和过滤所使用的会员收取手续费方式模板 -->
		<textarea id="ecs_takeFeeType" rows="" cols="" style="display: none">
		<select onblur="ECSideUtil.updateEditCell(this)" style="width: 100%;"
				name="feeMode[=]">
			<ec:options items="takeFeeMap" />
		</select>
	    </textarea>
		<!-- 编辑和过滤所使用的手续费算法模板 -->
		<textarea id="ecs_feeAlgr" rows="" cols="" style="display: none">
		<select onblur="ECSideUtil.updateEditCell(this)" style="width: 100%;"
				name="feeAlgr[=][int]">
			<ec:options items="feeAlgrMap" />
		</select>
	    </textarea>
		<script type="text/javascript">

function submitMemberTakeFee() {
	frm.submit();

}
function deletetakeFeePoint() {
	var url = "${basePath}/commodity/takeFee/delete.action";
	deleteEcside(ec.ids, url);
}
function forwardUpdate(commodityId, firmId) {
	var url = "${basePath}/commodity/takeFee/forwardUpdate.action?obj.commodityId="
			+ commodityId + "&obj.m_FirmId=" + firmId;
	ecsideDialog(url, "", 580, 435);
}
function addtakeFeePoint() {
	var urlFee = "${basePath}/commodity/takeFee/forwardAdd.action";
	ecsideDialog(urlFee, "", 580, 415);
}
</script>
	</body>
</html>