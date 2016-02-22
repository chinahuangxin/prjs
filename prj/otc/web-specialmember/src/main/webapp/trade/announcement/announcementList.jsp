<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/public/session.jsp"%>
<%@page import="java.util.*"%>

<html>
	<head>
		<title>系统用户浏览</title>
		<%@ include file="/public/ecsideLoad.jsp"%>
	</head>
	<body>
		<div id="main_body">
			<table class="table1_style" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td>
						<div class="div_tj">
						<form name="frm"
								action="${basePath}/tradeManage/announcement/noticeList.action"
								method="post">
							<table border="0" cellpadding="0" cellspacing="0"
								class="table2_style">
								<tr>
									<td height="40" width="800">
										<div class="div2_top">
											<table class="table3_style" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td width="190" align="left">
														主题:&nbsp;
														<label>
															<input type="text" class="input_text"
																name="${GNNT_}primary.title[=][String]" id="messageId"
																value="${oldParams['primary.title[=][String]'] }" />
														</label>
													</td>
													<td class="table3_td_1max" align="left">
														发布时间:&nbsp;
														<input type="text" style="width: 100px" id="beginDate"
															class="wdate" maxlength="10"
															name="${GNNT_}primary.sendTime[=][date]"
															value='${oldParams["primary.sendTime[=][date]"]}'
															onFocus="WdatePicker({el:this,dateFmt:'yyyy-MM-dd',skin:'whyGreen'})">
													</td>
													<td class="table3_td_1max" align="left">
														失效时间:&nbsp;
														<input type="text" style="width: 100px" id="endDate"
															class="wdate" maxlength="10"
															name="${GNNT_}primary.expiryTime[=][date]"
															value='${oldParams["primary.expiryTime[=][date]"]}'
															onFocus="WdatePicker({el:this,dateFmt:'yyyy-MM-dd',skin:'whyGreen'})">
													</td>
													<td class="table3_td_anniu" align="left">
														<button  class="btn_sec" onclick="select1()">查询</button>&nbsp;&nbsp;
														<button  class="btn_cz" onclick="myReset()">重置</button>
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
										<ec:table items="noticeList"
											autoIncludeParameters="${empty param.autoInc}" var="notice"
											action="${basePath}/tradeManage/announcement/noticeList.action"
											minHeight="345" listWidth="100%"
											retrieveRowsCallback="limit" sortRowsCallback="limit"
											filterRowsCallback="limit" 
											csvFileName="导出列表.csv"   style="table-layout:fixed">
											<ec:row recordKey="${notice.id}">
												<ec:column width="4%" property="_0" title="序号" value="${GLOBALROWCOUNT}" sortable="false" filterable="false" />
												<ec:column property="title[like]" title="主题" width="20%"
													style="text-align:left;">
													<a href="#" class="blank_a"
														onclick="showAnnouncement('${notice.id}');"><font
														color="#880000">${notice.title }</font>
													</a>
												</ec:column>
												<ec:column property="author[like]" title="操作员" width="20%"
													style="text-align:left;" value="${notice.author}" />
												<ec:column property="sendTime[Date]" title="发布时间" width="12%" 
													style="text-align:left;" value="${datefn:formatdate(notice.sendTime)}" filterable="false"/>
												<ec:column property="expiryTime[Date]" title="失效时间" width="12%" 
													style="text-align:left;" value="${datefn:formatdate(notice.expiryTime)}" filterable="false"/>
												<ec:column property="content[like]" title="公告内容" width="36%"
													style="text-align:left;" value="${notice.content}" />
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
	</body>
	<script type="text/javascript">
	function select1(){
		var now = new Date();
		var s = new Date(Date.parse(frm.beginDate.value.replace(/-/g,   "/")));
		var e = new Date(Date.parse(frm.endDate.value.replace(/-/g,   "/")));
		if (s!="" && s > now ) {
			alert("发布时间不能大于当前时间");
			return false;
		} else if(s>e){
			alert("发布时间不能大于失效时间");
			return false;
		} else if(frm.beginDate.value != "" && frm.endDate.value != "" && frm.beginDate.value == frm.endDate.value) {
			alert("失效时间与发布时间不能相等");
			return false;
		} else {
			frm.submit();
		}
	}
	function forView(content, id) {
		document.getElementById(id).title = content;
	}
	function showAnnouncement(id) {
		var url = "${basePath}/tradeManage/announcement/showAnnouncement.action?obj.id="+id;
		ecsideDialog(url,null,610,560);
	}
	</script>
</html>