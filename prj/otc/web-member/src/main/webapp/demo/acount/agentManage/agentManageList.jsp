 <%@ page contentType="text/html;charset=GBK"%>
 <%@ include file="/common/public/common.jsp"%>
	<meta http-equiv="Content-Type" content="text/html; charset=GBK">
	<META HTTP-EQUIV="pragma" CONTENT="no-cache">
	<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
	<META HTTP-EQUIV="expires" CONTENT="0">
<html>
	<head>
		<title>经纪人信息</title>
		<script type="text/javascript" src="../widgets/ecside/js/prototype_mini.js"></script>
		<script type="text/javascript" src="../widgets/ecside/js/ecside_msg_gbk_cn.js"></script>
		<script type="text/javascript" src="../widgets/ecside/js/ecside.js"></script>
		<link rel="stylesheet" type="text/css" href="../widgets/ecside/css/ecside_style.css" />
	</head>
	<body>
		<br />
		<br />
		<form name="myForm" action="http://127.0.0.1:8088/staticPages/ecside/ecside.action" method="post">
			<fieldset>
				<legend style="font-weight:bold; ">
						设置查询条件
				</legend>
				<table width="667">
					<tr>
					  <td width="235">机构：
					    <label>
					    <input type="text" name="textfield">
				      </label></td>
					  <td width="287">  登录账号： 
				      <input type="text" name="" value=""/>&nbsp;&nbsp;&nbsp;</td>
						<td width="129"><input type="submit" value="查询"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重置"/></td>
					</tr>
			</table>
			</fieldset>
		</form>
		<br />
	    
		
		
		
<form id="ec"  method="post"  style="width:100%;visibility :hidden;"  nearPages="3"  filterable="true"  canResizeColWidth="true"  maxRowsExported="1000000"  minColWidth="45" 
 action="http://127.0.0.1:8088/staticPages/ecside/ecside.action" >
<div class="ecSide"  id="ec_main_content"  style="width:100%;" >
<!-- ECS_AJAX_ZONE_PREFIX__begin_ ec_ECS_AJAX_ZONE_SUFFIX -->
<div>
<input type="hidden"  name="ec_i"  value="ec" />
<input type="hidden"  name="eti" />
<input type="hidden"  name="eti_p" />
<input type="hidden"  name="ec_efn" />
<input type="hidden"  name="ec_ev" />
<input type="hidden"  name="ec_crd"  value="6" />
<input type="hidden"  name="ec_f_a" />
<input type="hidden"  name="ec_p"  value="1" />
<input type="hidden"  name="ec_s_checkboxId" />
<input type="hidden"  name="ec_s_id" />
<input type="hidden"  name="ec_s_account" />
<input type="hidden"  name="ec_s_name" />
<input type="hidden"  name="ec_s_balance" />
<input type="hidden"  name="ec_s_drift" />
<input type="hidden"  name="ec_s_value" />
<input type="hidden"  name="ec_s_available" />
<input type="hidden"  name="ec_s_occupy" />
<input type="hidden"  name="ec_s_freeze" />
<input type="hidden"  name="ec_s_risk" />
<input type="hidden"  name="ec_s_rate" />
<input type="hidden"  name="ec_totalpages"  value="1" />
<input type="hidden"  name="ec_totalrows"  value="6" />
<input type="hidden"  name="ec_f_checkboxId" /><input type="hidden"  name="ec_f_id" /><input type="hidden"  name="ec_f_account" /><input type="hidden"  name="ec_f_name" /><input type="hidden"  name="ec_f_balance" /><input type="hidden"  name="ec_f_drift" /><input type="hidden"  name="ec_f_value" /><input type="hidden"  name="ec_f_available" /><input type="hidden"  name="ec_f_occupy" /><input type="hidden"  name="ec_f_freeze" /><input type="hidden"  name="ec_f_risk" /><input type="hidden"  name="ec_f_rate" />
 
</div>
<div class="headZone"  id="ec_headZone" >
<table border="0"  cellspacing="0"  cellpadding="0"  class="tableRegion"  style="table-layout:fixed;table-layout:fixed;" width="130%">
	<thead id="ec_table_head" ><tr><td valign="middle"  columnName="checkboxId"   class="tableHeader"  onmouseover="ECSideUtil.lightHeader(this,'ec');"  onmouseout="ECSideUtil.unlightHeader(this,'ec');" width="2%"><span class="columnSeparator" >&#160;</span><div class="headerTitle" ><span class="checkboxHeader"  onclick="ECSideUtil.checkAll(this,'checkboxId','ec');" >&#160;</span></div></td>
<td valign="middle"  columnName="id"  sortable="true"  resizeColWidth="true"  editTemplate="ecs_t_input"    class="tableHeader  tableResizeableHeader editableColumn"  onmouseover="ECSideUtil.lightHeader(this,'ec');"  onmouseout="ECSideUtil.unlightHeader(this,'ec');"  oncontextmenu="ECSideUtil.showColmunMenu(event,this,'ec');"  onmouseup="ECSideUtil.doSort(event,'id','asc','ec');"  title="排序 Id" ><span onMouseDown="ECSideUtil.StartResize(event,this,'ec');" onMouseUp="ECSideUtil.EndResize(event);" class="columnSeparator columnResizeableSeparator" >&#160;</span>
<div class="headerTitle" >登录账号</div></td>
<td valign="middle"  columnName="account"  sortable="true"  resizeColWidth="true"  editTemplate="ecs_t_input"    class="tableHeader  tableResizeableHeader editableColumn"  onmouseover="ECSideUtil.lightHeader(this,'ec');"  onmouseout="ECSideUtil.unlightHeader(this,'ec');"  oncontextmenu="ECSideUtil.showColmunMenu(event,this,'ec');"  onmouseup="ECSideUtil.doSort(event,'account','asc','ec');"  title="排序 登录账号" ><span onMouseDown="ECSideUtil.StartResize(event,this,'ec');" onMouseUp="ECSideUtil.EndResize(event);" class="columnSeparator columnResizeableSeparator" >&#160;</span>
<div class="headerTitle" >所属经纪</div></td>
<td valign="middle" width="9%"  columnName="id"  sortable="true"  resizeColWidth="true"  editTemplate="ecs_t_input"    class="tableHeader  tableResizeableHeader editableColumn"  onmouseover="ECSideUtil.lightHeader(this,'ec');"  onmouseout="ECSideUtil.unlightHeader(this,'ec');"  oncontextmenu="ECSideUtil.showColmunMenu(event,this,'ec');"  onmouseup="ECSideUtil.doSort(event,'id','asc','ec');"  title="排序 Id" ><span onMouseDown="ECSideUtil.StartResize(event,this,'ec');" onMouseUp="ECSideUtil.EndResize(event);" class="columnSeparator columnResizeableSeparator" >&#160;</span>
<div class="headerTitle" >银行名称</div></td>
<td valign="middle"  columnName="account"  sortable="true"  resizeColWidth="true"  editTemplate="ecs_t_input"    class="tableHeader  tableResizeableHeader editableColumn"  onmouseover="ECSideUtil.lightHeader(this,'ec');"  onmouseout="ECSideUtil.unlightHeader(this,'ec');"  oncontextmenu="ECSideUtil.showColmunMenu(event,this,'ec');"  onmouseup="ECSideUtil.doSort(event,'account','asc','ec');"  title="排序 登录账号" ><span onMouseDown="ECSideUtil.StartResize(event,this,'ec');" onMouseUp="ECSideUtil.EndResize(event);" class="columnSeparator columnResizeableSeparator" >&#160;</span>
<div class="headerTitle" >银行账户</div></td>
<td valign="middle"  columnName="name"  sortable="true"  resizeColWidth="true"  editTemplate="ecs_t_input"    class="tableHeader  tableResizeableHeader editableColumn"  onmouseover="ECSideUtil.lightHeader(this,'ec');"  onmouseout="ECSideUtil.unlightHeader(this,'ec');"  oncontextmenu="ECSideUtil.showColmunMenu(event,this,'ec');"  onmouseup="ECSideUtil.doSort(event,'name','asc','ec');"  title="排序 用户名称" ><span onMouseDown="ECSideUtil.StartResize(event,this,'ec');" onMouseUp="ECSideUtil.EndResize(event);" class="columnSeparator columnResizeableSeparator" >&#160;</span>
<div class="headerTitle" >用户名称</div></td>
<td valign="middle"  columnName="name"  sortable="true"  resizeColWidth="true"  editTemplate="ecs_t_input"    class="tableHeader  tableResizeableHeader editableColumn"  onmouseover="ECSideUtil.lightHeader(this,'ec');"  onmouseout="ECSideUtil.unlightHeader(this,'ec');"  oncontextmenu="ECSideUtil.showColmunMenu(event,this,'ec');"  onmouseup="ECSideUtil.doSort(event,'name','asc','ec');"  title="排序 用户名称" ><span onMouseDown="ECSideUtil.StartResize(event,this,'ec');" onMouseUp="ECSideUtil.EndResize(event);" class="columnSeparator columnResizeableSeparator" >&#160;</span>
<div class="headerTitle" >英文名称</div></td>
<td valign="middle"  columnName="balance"  sortable="true"  resizeColWidth="true"  editTemplate="ecs_t_input"    class="tableHeader  tableResizeableHeader editableColumn"  onmouseover="ECSideUtil.lightHeader(this,'ec');"  onmouseout="ECSideUtil.unlightHeader(this,'ec');"  oncontextmenu="ECSideUtil.showColmunMenu(event,this,'ec');"  onmouseup="ECSideUtil.doSort(event,'balance','asc','ec');"  title="排序 余额" ><span onMouseDown="ECSideUtil.StartResize(event,this,'ec');" onMouseUp="ECSideUtil.EndResize(event);" class="columnSeparator columnResizeableSeparator" >&#160;</span>
<div class="headerTitle" >性别</div></td>
<td valign="middle"   columnName="drift"  sortable="true"  resizeColWidth="true"  editTemplate="ecs_t_input"    class="tableHeader  tableResizeableHeader editableColumn"  onmouseover="ECSideUtil.lightHeader(this,'ec');"  onmouseout="ECSideUtil.unlightHeader(this,'ec');"  oncontextmenu="ECSideUtil.showColmunMenu(event,this,'ec');"  onmouseup="ECSideUtil.doSort(event,'drift','asc','ec');"  title="排序 浮动盈亏" ><span onMouseDown="ECSideUtil.StartResize(event,this,'ec');" onMouseUp="ECSideUtil.EndResize(event);" class="columnSeparator columnResizeableSeparator" >&#160;</span>
<div class="headerTitle" >身份证</div></td>
<td valign="middle"  columnName="value"  sortable="true"  resizeColWidth="true"  editTemplate="ecs_t_input"    class="tableHeader  tableResizeableHeader editableColumn"  onmouseover="ECSideUtil.lightHeader(this,'ec');"  onmouseout="ECSideUtil.unlightHeader(this,'ec');"  oncontextmenu="ECSideUtil.showColmunMenu(event,this,'ec');"  onmouseup="ECSideUtil.doSort(event,'value','asc','ec');"  title="排序 净值" ><span onMouseDown="ECSideUtil.StartResize(event,this,'ec');" onMouseUp="ECSideUtil.EndResize(event);" class="columnSeparator columnResizeableSeparator" >&#160;</span>
<div class="headerTitle" >邮箱</div></td>
<td valign="middle"  columnName="available"  sortable="true"  resizeColWidth="true"  editTemplate="ecs_t_input"    class="tableHeader  tableResizeableHeader editableColumn"  onmouseover="ECSideUtil.lightHeader(this,'ec');"  onmouseout="ECSideUtil.unlightHeader(this,'ec');"  oncontextmenu="ECSideUtil.showColmunMenu(event,this,'ec');"  onmouseup="ECSideUtil.doSort(event,'available','asc','ec');"  title="排序 可用保证金" ><span onMouseDown="ECSideUtil.StartResize(event,this,'ec');" onMouseUp="ECSideUtil.EndResize(event);" class="columnSeparator columnResizeableSeparator" >&#160;</span>
<div class="headerTitle" >电话</div></td>
<td valign="middle"  columnName="occupy"  sortable="true"  resizeColWidth="true"  editTemplate="ecs_t_input"    class="tableHeader  tableResizeableHeader editableColumn"  onmouseover="ECSideUtil.lightHeader(this,'ec');"  onmouseout="ECSideUtil.unlightHeader(this,'ec');"  oncontextmenu="ECSideUtil.showColmunMenu(event,this,'ec');"  onmouseup="ECSideUtil.doSort(event,'occupy','asc','ec');"  title="排序 占用保证金" ><span onMouseDown="ECSideUtil.StartResize(event,this,'ec');" onMouseUp="ECSideUtil.EndResize(event);" class="columnSeparator columnResizeableSeparator" >&#160;</span>
<div class="headerTitle" >手机</div></td>
<td valign="middle"  columnName="freeze"  sortable="true"  resizeColWidth="true"  editTemplate="ecs_t_input"    class="tableHeader  tableResizeableHeader editableColumn"  onmouseover="ECSideUtil.lightHeader(this,'ec');"  onmouseout="ECSideUtil.unlightHeader(this,'ec');"  oncontextmenu="ECSideUtil.showColmunMenu(event,this,'ec');"  onmouseup="ECSideUtil.doSort(event,'freeze','asc','ec');"  title="排序 冻结保证金" ><span onMouseDown="ECSideUtil.StartResize(event,this,'ec');" onMouseUp="ECSideUtil.EndResize(event);" class="columnSeparator columnResizeableSeparator" >&#160;</span>
<div class="headerTitle" >传真</div></td>
<td valign="middle"  columnName="risk"  sortable="true"  resizeColWidth="true"  editTemplate="ecs_t_input"    class="tableHeader  tableResizeableHeader editableColumn"  onmouseover="ECSideUtil.lightHeader(this,'ec');"  onmouseout="ECSideUtil.unlightHeader(this,'ec');"  oncontextmenu="ECSideUtil.showColmunMenu(event,this,'ec');"  onmouseup="ECSideUtil.doSort(event,'risk','asc','ec');"  title="排序 风险总阈值" ><span onMouseDown="ECSideUtil.StartResize(event,this,'ec');" onMouseUp="ECSideUtil.EndResize(event);" class="columnSeparator columnResizeableSeparator" >&#160;</span>
<div class="headerTitle" >地址</div></td>
<td valign="middle"  columnName="risk"  sortable="true"  resizeColWidth="true"  editTemplate="ecs_t_input"    class="tableHeader  tableResizeableHeader editableColumn"  onmouseover="ECSideUtil.lightHeader(this,'ec');"  onmouseout="ECSideUtil.unlightHeader(this,'ec');"  oncontextmenu="ECSideUtil.showColmunMenu(event,this,'ec');"  onmouseup="ECSideUtil.doSort(event,'risk','asc','ec');"  title="排序 风险总阈值" ><span onMouseDown="ECSideUtil.StartResize(event,this,'ec');" onMouseUp="ECSideUtil.EndResize(event);" class="columnSeparator columnResizeableSeparator" >&#160;</span>
<div class="headerTitle" >邮编</div></td>
<td valign="middle"  columnName="risk"  sortable="true" width="9%"  resizeColWidth="true"  editTemplate="ecs_t_input"    class="tableHeader  tableResizeableHeader editableColumn"  onmouseover="ECSideUtil.lightHeader(this,'ec');"  onmouseout="ECSideUtil.unlightHeader(this,'ec');"  oncontextmenu="ECSideUtil.showColmunMenu(event,this,'ec');"  onmouseup="ECSideUtil.doSort(event,'risk','asc','ec');"  title="排序 风险总阈值" ><span onMouseDown="ECSideUtil.StartResize(event,this,'ec');" onMouseUp="ECSideUtil.EndResize(event);" class="columnSeparator columnResizeableSeparator" >&#160;</span>
<div class="headerTitle" >所属国家</div></td>
</tr>
	</thead>
</table></div>
<div style="overflow:auto;width:100%;height:580px"  class="bodyZone"  id="ec_bodyZone" >
<table id="ec_table"  border="0"  cellspacing="0"  cellpadding="0"  class="tableRegion"  style="table-layout:fixed;table-layout:fixed;" width="130%">
	<tbody id="ec_table_body" >
		
		<tr class="odd "  ondblclick="update()"  onmouseover="ECSideUtil.lightRow(this,'ec');"  onmouseout="ECSideUtil.unlightRow(this,'ec');"    recordKey="1" >
<td   cellValue="1"  ondblclick="ECSideUtil.editCell(this,'ec')"   ><input type="checkbox"  width="2%"  name="checkboxId"  value="1"  class="checkbox" /></td>
<td style="text-align:center;"    cellValue="1"  ondblclick="ECSideUtil.editCell(this,'ec')"   >303030</td>
<td style="text-align:center;"    cellValue="00211"  ondblclick="ECSideUtil.editCell(this,'ec')"   >dfg</td>
<td style="text-align:center;" width="9%"    cellValue="fxxt11"  ondblclick="ECSideUtil.editCell(this,'ec')"   >中国农业银行</td>
<td style="text-align:center;"   cellValue="0.0"  ondblclick="ECSideUtil.editCell(this,'ec')"   >-</td>
<td style="text-align:center;"    cellValue="0.0"  ondblclick="ECSideUtil.editCell(this,'ec')"   >-</td>
<td style="text-align:center;"    cellValue="0.0"  ondblclick="ECSideUtil.editCell(this,'ec')"   >-</td>
<td style="text-align:center;"    cellValue="0.0"  ondblclick="ECSideUtil.editCell(this,'ec')"   >-</td>
<td style="text-align:center;"     cellValue="0.0"  ondblclick="ECSideUtil.editCell(this,'ec')"   >-</td>
<td style="text-align:center;"    cellValue="0.0"  ondblclick="ECSideUtil.editCell(this,'ec')"   >-</td>
<td style="text-align:center;"    cellValue="0.0"  ondblclick="ECSideUtil.editCell(this,'ec')"   >-</td>
<td style="text-align:center;"    cellValue="0.0"  ondblclick="ECSideUtil.editCell(this,'ec')"   >-</td>
<td style="text-align:center;"    cellValue="0.0" width="9%"  ondblclick="ECSideUtil.editCell(this,'ec')"   >-</td>
<td style="text-align:center;"    cellValue="0.0"  ondblclick="ECSideUtil.editCell(this,'ec')"   >-</td>
<td style="text-align:center;"    cellValue="0.0"  ondblclick="ECSideUtil.editCell(this,'ec')"   >-</td>
<td style="text-align:center;"    cellValue="0.0" width="9%"  ondblclick="ECSideUtil.editCell(this,'ec')"   >-</td>
</tr>		
	</tbody>
</table><iframe style="border:0px;" marginwidth="0" marginheight="0" frameborder="0" border="0" width="0" height="0" id="ec_ecs_export_iframe" name="ec_ecs_export_iframe" ></iframe></div>
 
<div id="ec_toolbar"  class="toolbar"  style="width:100%;" >
	<table id="ec_toolbarTable"  class="toolbarTable"  cellpadding="0"  cellspacing="0" ><tr><td class="pageNavigationTool"  nowrap="nowrap" ><input type="button"  disabled="disabled"  class="pageNav firstPageD"  onclick="ECSideUtil.gotoPage(1,'ec');"  title="第一页" /><input type="button"  disabled="disabled"  class="pageNav prevPageD"  onclick="ECSideUtil.gotoPage(0,'ec');"  title="上一页" /></td><td class="pageNavigationTool"  nowrap="nowrap" ><input type="button"  disabled="disabled"  class="pageNav nextPageD"  onclick="ECSideUtil.gotoPage(2,'ec');"  title="下一页"  disabled="disabled" /><input type="button"  disabled="disabled"  class="pageNav lastPageD"  onclick="ECSideUtil.gotoPage(1,'ec');"  title="最末页"  disabled="disabled" /></td>
<td class="separatorTool" >&#160;</td>
<td class="pageJumpTool"  nowrap="nowrap"  onmouseover="ECSideUtil.NearPagesBar.showMe(this,'ec');"  onmouseout="ECSideUtil.NearPagesBar.hideMe(this,'ec');" ><nobr><input type="button"  class="pageNav jumpPage"  onclick="ECSideUtil.gotoPageByInput(this,'ec');" /><input type="text"  name="ec_pg"  value="1"  class="jumpPageInput"  onkeydown="if (event.keyCode && event.keyCode==13 ) {ECSideUtil.gotoPageByInput(this,'ec');;return false; } " />/1页</nobr></td>
<td class="separatorTool" >&#160;</td>
<td class="pageSizeTool"  nowrap="nowrap" >每页<select name="ec_rd"  onchange="ECSideUtil.changeRowsDisplayed('ec',this);" >
				<option value="5" >5</option><option value="10" >10</option><option value="20" >20</option><option value="50" >50</option><option value="100" >100</option><option value="1000" >1000</option><option value="6"  selected="selected">全部</option>
				</select>条</td>
<td class="separatorTool" >&#160;</td>
<td nowrap="nowrap"  class="exportTool" ><nobr><input type="button"  class="toolButton exportXls"  onclick="ECSideUtil.doExport('xls','用户列表.xls','','ec');"  alt="导出XLS"  title="导出为XLS文件" /><input type="button"  class="toolButton exportCsv"  onclick="ECSideUtil.doExport('csv','用户列表.csv','','ec');"  alt="导出CSV"  title="导出为CSV文件" /></nobr></td>
<td class="separatorTool" >&#160;</td>
<td class="extendTool" ></td>
<td class="separatorTool" >&#160;</td>
<td nowrap="nowrap"  class="statusTool" ><nobr>共6条记录,显示1到6</nobr></td>
</tr>
	</table></div><div id="ec_toolbarShadow"  style="display:none;" ></div>
<!-- ECS_AJAX_ZONE_PREFIX_ _end_ec_ECS_AJAX_ZONE_SUFFIX -->
</div>
</form><div id="ec_waitingBar"  class="waitingBar" ></div><div id="ec_waitingBarCore"  class="waitingBarCore" ></div>
<script type="text/javascript" > 
(function(){ 
 var gird=ECSideUtil.createGird('ec'); 
 gird.useAjax=true;  
 gird.doPreload=false; 
 gird.isClassic=false; 
})();
</script>
 
 
		<br />
		<table align="center">
			<tr>
				<td>
					<input id='delete' type="reset" value="删除"/>
				</td>
				<td>
					<input id='add' type="button" value="添加" onClick="add()"/>
				</td>
			</tr>
		</table>
	</body>
</html>
<script type="text/javascript" > 
	function add(){
		var url="addAgent.jsp";
				var result=window.showModalDialog(url);
	}
	function update(){
		var url="updateAgent.jsp";
		window.showModalDialog(url);
	}
</script>