<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<%@ include file="/WEB-INF/jsp/common/title.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${ctx}/ui_widget/ztree/css/demo.css">
<script type="text/javascript">
	
	function save_click() {
		$("#tsysPostForm").validationEngine({ promptPosition:"bottomRight"});
		var bool = $("#tsysPostForm").validationEngine('validate');
		if (bool == true) {
			$.ajax({
				url : "${ctx}/carController.do?method=ajaxSave",
				type : "POST",
				data : $("#tsysPostForm").serialize(),
				dataType : 'json',
				error : function() {
					jQuery.messager.alert('提示:','发生错误!', '');
				},
				success : function(data) {
					if (data.flag) {
						jQuery.messager.alert('提示:', data.msg, 'info', function(){
							reloadList();
							back_click();
						});
					} else {
						jQuery.messager.alert('提示:', data.msg, 'info');
					}
				}
			});
		}
	}
	
	function reloadList(){
		parent.reloadlist();
	}
	function back_click() {
		parent.closeDialog();
	}
	
	function clear(){
/* 		$("#postName").val("");
		$("#remark").val("");
		$("#postType").val("4"); // 把岗位类型重置成下来菜单的第一个
 */		$("#parentPostName").val("");
		$("#parentPostid").val("");
	}
	
</script>
</head>
<body>
	<!-- 表单布局设计begin -->
	<cbitedu:form bean="car" scope="request">
		<form action="${ctx}/carController.do?method=ajaxSave" method="post" name="tsysPostForm" id="tsysPostForm">
			<input type="hidden" name="carId" />
			<div class="easyui-layout easyui-panel">
				<table class="FormView" border="0" cellspacing="1" cellpadding="0">
					<col class="Label" />
					<col class="Data" />
					<col class="Label" />
					<col class="Data" />

					<tr>
						<td>品牌id</td>
						<td><input type="text" name="brandId" />
						<td>审核id</td>
						<td><input type="text" name="auditId" /></td>
					</tr>
					<tr>
						<td>汽车类型</td>
						<td><input type="text" name="carType" /></td>
						<td>汽车名称</td>
						<td><input type="text" name="carName" /></td>
					</tr>
					<tr>
						<td>汽车颜色</td>
						<td><input type="text" name="carColor" /></td>
						<td>汽车保障</td>
						<td><input type="text" name="carGuar" /></td>
					</tr>
					<tr> 
						<td>汽车商家</td>
						<td><input type="text" name="carSeller" /></td>
						<td>联系电话</td>
						<td><input type="text" name="phone" /></td>
					</tr>
					<tr>
						<td>价格区间</td>
						<td><input type="text" name="priceRange" /></td>
						<td>汽车发布时间</td>
						<td><input type="datetime-local" name="carReleTime" /></td>
					</tr>
					<tr>
						<td>汽车状态</td>
						<td><input type="text" name="carState" /></td>
						<td>汽车原价</td>
						<td><input type="text" name="carOldPrice" /></td>
					</tr>
					<tr>
						<td>汽车折扣价</td>
						<td><input type="text" name="carNowPrice" /></td>
						<td>汽车特点</td>
						<td><input type="text" name="carCharacteristic" /></td>
					</tr>
					<tr>
						<td>汽车详细内容</td>
						<td><input type="text" name="carContent" /></td>
						<td>汽车销量</td>
						<td><input type="text" name="carSellNum" /></td>
					</tr>
					<tr>
						<td>库存</td>
						<td><input type="text" name="stock" /></td>
						<td>创建人</td>
						<td><input type="text" name="creater" /></td>
					</tr>
					<tr>
						<td>创建时间</td>
						<td><input type="datetime-local" name="createDate" /></td>
						<td>修改时间</td>
						<td><input type="datetime-local" name="editDate" /></td>
					</tr>
				</table>
			</div>
		</form>
		<!-- 表单布局设计end -->
		<!-- 表单内的按钮设计begin -->
		<div align="center" class="foot-buttons" style="margin-top: 5px">
			<a id="btn_save" onclick="save_click();" class="easyui-linkbutton" iconCls="icon-save">保存</a>
			<a id="btn_save" onclick="back_click();" class="easyui-linkbutton" iconCls="icon-back">返回</a>
		</div>
	</cbitedu:form>
	<div id="menuContent" class="menuContent" style="display: none; position: absolute;">
		<ul id="treeDemo" class="ztree" style="margin-top: 0; height : 140px; width: 160px; " ></ul>
	</div>
</body>
</html>