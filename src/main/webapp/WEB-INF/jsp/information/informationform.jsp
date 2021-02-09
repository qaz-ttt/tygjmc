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
		 	ue.setContent('${Information.salesContents}');
		 	
		 });
		 });

	
	function save_click() {
		var content = UE.getEditor('editor').getContent();
		//判断内容是否为空
		if (!UE.getEditor('editor').hasContents()) {
			$.messager.alert('提示:', '内容不能为空!', 'info');
			return false;
		}
		$("#salesContents").val(content);
	
		
		
		$("#tsysPostForm").validationEngine({ promptPosition:"bottomRight"});
		var bool = $("#tsysPostForm").validationEngine('validate');
		if (bool == true) {
			$.ajax({
				url : "${ctx}/InformationController.do?method=ajaxSave",
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
	<cbitedu:form bean="Information" scope="request">
		<form action="${ctx}/InformationController.do?method=ajaxSave" method="post" name="tsysPostForm" id="tsysPostForm">
			<input type="hidden" name="infoId" />
			<div class="easyui-layout easyui-panel">
				<table class="FormView" border="0" cellspacing="1" cellpadding="0">
					<col class="Label" />
					<col class="Data" />
					<tr>
						<td>售后标题</td>
						<td>
							<input type="text" name="saleTitles"/>
							<font color="red">*</font>
						</td>
					</tr>
					<!-- <tr>
						<td>售后内容</td>
						<td>
							<input type="text" name="salesContents"/>
							<font color="red">*</font>
						</td>
					</tr> -->
					<tr>
						<td>售后内容</td>
						<td colspan="3"><input type="hidden" id="salesContents"
							name="salesContents" /> <script id="editor" name="editor"
								type="text/plain" style="width:605px;height:300px;"></script>
						</td>
					</tr>
					<tr>
						<td>公司名称</td>
						<td>
							<input type="text" name="companyName"/>
							<font color="red">*</font>
						</td>
					</tr>
					<tr>
						<td>公司简介标题</td>
						<td>
							<input type="text" name="aboutBriefTitle"/>
							<font color="red">*</font>
						</td>
					</tr>
					<!-- <tr>
						<td>公司简介内容</td>
						<td>
							<input type="text" name="aboutBriefContent"/>
							<font color="red">*</font>
						</td>
					</tr> -->
					<tr>
						<td>公司简介内容</td>
						<td colspan="3"><input type="hidden" id="aboutBriefContent"
							name="aboutBriefContent" /> <script id="editor2" name="editor2"
								type="text/plain" style="width:605px;height:300px;"></script>
						</td>
					</tr>
					<tr>
						<td>公司服务宗旨标题</td>
						<td>
							<input type="text" name="aboutPurposeTitle"/>
							<font color="red">*</font>
						</td>
					</tr>
					<!-- <tr>
						<td>公司服务宗旨内容</td>
						<td>
							<input type="text" name="aboutPurposeContent"/>
							<font color="red">*</font>
						</td>
					</tr> -->
					<tr>
						<td>公司服务宗旨内容</td>
						<td colspan="3"><input type="hidden" id="aboutPurposeContent"
							name="aboutPurposeContent" /> <script id="editor3" name="editor3"
								type="text/plain" style="width:605px;height:300px;"></script>
						</td>
					</tr>
					<tr>
						<td>价值观标题</td>
						<td>
							<input type="text" name="aboutSenseTitle"/>
							<font color="red">*</font>
						</td>
					</tr>
					<!-- <tr>
						<td>价值观内容</td>
						<td>
							<input type="text" name="aboutSenseContent"/>
							<font color="red">*</font>
						</td>
					</tr> -->
					<tr>
						<td>价值观内容</td>
						<td colspan="3"><input type="hidden" id="aboutSenseContent"
							name="aboutSenseContent" /> <script id="editor4" name="editor4"
								type="text/plain" style="width:605px;height:300px;"></script>
						</td>
					</tr>
					<tr>
						<td>愿景标题</td>
						<td>
							<input type="text" name="aboutHopeTitle"/>
							<font color="red">*</font>
						</td>
					</tr>
					<!-- <tr>
						<td>愿景内容</td>
						<td>
							<input type="text" name="aboutHopeContent"/>
							<font color="red">*</font>
						</td>
					</tr> -->
					<tr>
						<td>愿景内容</td>
						<td colspan="3"><input type="hidden" id="aboutHopeContent"
							name="aboutHopeContent" /> <script id="editor5" name="editor5"
								type="text/plain" style="width:605px;height:300px;"></script>
						</td>
					</tr>
					<tr>
						<td>创建人</td>
						<td>
							<input type="text" name="creater" />
						</td>
					</tr>
					<tr>
						<td>创建时间</td>
						<td>
							<input type="datetime-local" name="createDate"/>
						</td>
					</tr>
					<tr>
						<td>修改时间</td>
						<td>
							<input type="datetime-local" name="editDate"/>
						</td>
					</tr>
					<tr>
						<td>审核状态</td>
						<td>
							<input type="text" name="userPhone"/>
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