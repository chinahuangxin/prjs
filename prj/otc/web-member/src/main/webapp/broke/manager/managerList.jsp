<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/public/session.jsp"%>

<html>
	<head>
		<title>客户代表列表</title>
		<%@ include file="/public/ecsideLoad.jsp"%>
	</head>
	<body>
		<div id="main_body">
			<table class="table1_style" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td>
						<div class="div_tj">
						<form name="frm"
								action="${basePath}/broke/manager/list.action"
								method="post">
							<table border="0" cellpadding="0" cellspacing="0"
								class="table2_style">
								<tr>
									<td class="table2_td_widthmid">
										<div class="div2_top">
											<table class="table3_style" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td class="table3_td_1mid" align="left">
														所属机构代码:&nbsp;
														<label>
															<input type="text" id="parentNo"
																name="${GNNT_}primary.parentOrganizationNO[like]"
																value="${oldParams['primary.parentOrganizationNO[like]'] }"
																class="input_text" />
														</label>
													</td>
													<td class="table3_td_1mid" align="left">
														客户代表代码:&nbsp;
														<label>
															<input type="text" id="managerNo"
																name="${GNNT_}primary.managerNo[like]"
																value="${oldParams['primary.managerNo[like]'] }"
																class="input_text" />
														</label>
													</td>
													<td class="table3_td_anniu" align="left">
														<button  class="btn_sec" onclick="select1()">查询</button>&nbsp;&nbsp;
														<button class="btn_cz" onclick="myReset()">重置</button>
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
							<button class="anniu_btn" onclick="addManager()" id="add">添加</button>
							&nbsp;&nbsp;
							<button  class="anniu_btn" onclick="deleteManager()" id="delete">删除</button>
						</div>

						<div class="div_list">
							<table id="tb" border="0" cellspacing="0" cellpadding="0"
								width="100%">
								<tr>
									<td>
										<ec:table items="resultList"
											autoIncludeParameters="${empty param.autoInc}" var="manager"
											action="${basePath}/broke/manager/list.action"
											title="" minHeight="330" listWidth="100%" height="460"
											retrieveRowsCallback="limit" sortRowsCallback="limit"
											filterRowsCallback="limit" 
											csvFileName="导出列表.csv"   style="table-layout:fixed">

											<ec:row recordKey="${manager.managerNo}">
												<ec:column cell="checkbox" headerCell="checkbox" alias="ids"
													style="text-align:center; " value="${manager.managerNo}" width="4%" viewsAllowed="html" />
												<ec:column width="6%" property="_0" title="序号" value="${GLOBALROWCOUNT}" sortable="false" filterable="false" />
												<ec:column property="primary.managerNo[like]" width="11%"
													title="客户代表代码" style="text-align:left; ">
													<a href="#" class="blank_a"
														onclick="forwardUpdate('${manager.managerNo}');"><font
														color="#880000">${manager.managerNo }</font>
													</a>
												</ec:column>
												<ec:column property="primary.parentOrganizationNO[like]" width="11%"
													title="所属机构代码" style="text-align:left; "
													value="${manager.parentOrganizationNO}" />
												<ec:column property="primary.name[like]" width="12%"
													title="客户代表名称" style="text-align:left;overflow:hidden;text-overflow:ellipsis"
													value="${manager.name}" tipTitle="${manager.name}"/>
												<ec:column property="primary.telephone[like]" width="10%"
													title="联系电话" style="text-align:left;"
													value="${manager.telephone}" />
												<ec:column property="primary.mobile[like]" width="12%"
													title="手机" style="text-align:left;"
													value="${manager.mobile}" />
												<ec:column property="primary.email[like]" width="12%"
													title="电子邮箱" style="text-align:left;"
													value="${manager.email}" />
												<ec:column property="primary.address[like]" width="12%"
													title="通讯地址" style="text-align:left;overflow:hidden;text-overflow:ellipsis"
													value="${manager.address}" tipTitle="${manager.address}"/>
												<ec:column property="_" title="修改密码"
													style="text-align:center" width="10%">
													<a href="#" class="blank_a" onclick="forwardUpdatePW('${manager.managerNo}')"><font color="#880000">修改密码</font></a>
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

		<SCRIPT type="text/javascript">
		function forwardUpdate(id){
			var url="${basePath}/broke/manager/forwardUpdate.action?obj.managerNo="+id;
			ecsideDialog(url,"",580,422);
		}
		function forwardUpdatePW(id){
			var url="${basePath}/broke/manager/forwardUpdatePassward.action?obj.managerNo="+id;
			ecsideDialog(url,"",580,283);
		}
		function addManager(){
			var url="${basePath}/broke/manager/forwardAdd.action";
			ecsideDialog(url,"",580,422);
		}
		function select1(){
			frm.submit();
		}
		
		function deleteManager(){
			var url="${basePath}/broke/manager/delete.action";
			deleteEcside(ec.ids,url);
		}
		</SCRIPT>
	</body>
</html>