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
<script type="text/javascript" src="${ctx}/ui_widget/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="${ctx}/ui_widget/ueditor/ueditor.all.js"></script>
<script type="text/javascript">
$(function(){
    //初始化
		var ue = UE.getEditor('editor');
		 ue.ready(function() {
		 	ue.setContent('${question.questionContent}');
		 });
		 });

	
	function save_click() {
		var content = UE.getEditor('editor').getContent();
		//判断内容是否为空
		if (!UE.getEditor('editor').hasContents()) {
			$.messager.alert('提示:', '内容不能为空!', 'info');
			return false;
		}
		$("#questionContent").val(content);
		$("#tsysPostForm").validationEngine({ promptPosition:"bottomRight"});
		var bool = $("#tsysPostForm").validationEngine('validate');
		if (bool == true) {
			$.ajax({
				url : "${ctx}/questionController.do?method=ajaxSave",
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
<body style="overflow:auto">
	<!-- 表单布局设计begin -->
	<cbitedu:form bean="question" scope="request">
		<form action="${ctx}/questionController.do?method=ajaxSave" method="post" name="tsysPostForm" id="tsysPostForm">
			<input type="hidden" name="questionId" />
			<div class="easyui-layout easyui-panel">
				<table class="FormView" border="0" cellspacing="1" cellpadding="0">
					<col class="Label" />
					<col class="Data" />
					<tr>
						<td>问题标题</td>
						<td>
							<input type="text" name="questionTitle"/>
							<font color="red">*</font>
						</td>
					</tr>
					<tr>
						<td>问题内容</td>
							<td colspan="3"><input type="hidden" id="questionContent"
							name="questionContent" /> <script id="editor" name="editor"
								type="text/plain" style="width:605px;height:300px;"></script>
						</td>
						
					</tr>
					<tr>
						<td>修改时间</td>
						<td>
							<input type="datetime-local" name="editDate"/>
						</td>
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