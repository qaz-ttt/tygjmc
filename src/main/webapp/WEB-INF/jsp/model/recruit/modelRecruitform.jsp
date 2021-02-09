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
<link rel="stylesheet" type="text/css" href="${ctx}/ui_widget/ztree/css/demo.css"> 
<script type="text/javascript" src="${ctx}/js/jquery.form.js"></script>
<!-- 配置文件 -->
<script type="text/javascript" src="${ctx}/ui_widget/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="${ctx}/ui_widget/ueditor/ueditor.all.js"></script>
<!-- 实例化编辑器 -->
<script type="text/javascript">
$(function(){
    //初始化
		var ue = UE.getEditor('editor');
		 ue.ready(function() {
		 	ue.setContent('${recruit.reruitContent}');
		 });
		 });

	function save_click() {
		var content = UE.getEditor('editor').getContent();
		//判断内容是否为空
		if (!UE.getEditor('editor').hasContents()) {
			$.messager.alert('提示:', '内容不能为空!', 'info');
			return false;
		}
		$("#reruitContent").val(content);
		
		$("#modelRecruit").validationEngine({ promptPosition:"bottomRight"});
		var bool = $("#modelRecruit").validationEngine('validate');
		if (bool == true) {
			$.ajax({
				url : "${ctx}/recruitController.do?method=ajaxSave",
				type : "POST",
				data : $("#modelRecruit").serialize(),
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
		} else {
			jQuery.messager.alert('提示:', '您的表单输入校验不通过，请重填!', 'info');
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
	<cbitedu:form bean="recruit" scope="request">
		<form action="${ctx}/tsysPostController.do?method=ajaxSave" method="post" name="modelRecruit" id="modelRecruit">
			<input type="hidden" name="recruitId" />
			<div class="easyui-layout easyui-panel">
				<table class="FormView" border="0" cellspacing="1" cellpadding="0">
					<col class="Label" />
					<col class="Data" />
					<col class="Label" />
					<col class="Data" />
					<tr>
						<td><fmt:message key="recruit_title" /></td>

						<td>
							<input type="text" id="recruitTitle" name="recruitTitle" class="text validate[required]" />
							<font color="red">*</font>
						</td>
						<td	>
						<fmt:message key="reruit_name"/>
						</td>
						<td>
							<input type="text" id="reruitName" name="reruitName" class="text validate[required,maxSize[15]]" />
							<font color="red">*</font>
						</td>
					</tr>
					
					<tr>
						<td ><fmt:message key="reruit_pay" /></td>
						<td>
							<input type="text" id="reruitPay" name="reruitPay" class="text validate[required,maxSize[15]]" />
							<font color="red">*</font>
						</td>
						
						<td ><fmt:message key="reruit_num" /></td>
						<td>
							<input type="text" id="reruitNum" name="reruitNum" class="text validate[required,custom[integer],maxSize[15],min[0]]" />
							<font color="red">*</font>
						</td>
					</tr>
					
					<tr>
						<td><fmt:message key="reruit_man" /></td>
						<td>
							<input type="text" id="reruitMan" name="reruitMan" class="text validate[required,maxSize[15],]" />
							<font color="red">*</font>
						</td>
						
						<td><fmt:message key="reruit_contacts_phone" /></td>
						<td>
							<input type="text" id="reruitContactsPhone" name="reruitContactsPhone" class="text validate[required,maxSize[11],custom[phone]]" />
							<font color="red">*</font>
						</td>
					</tr>
					
					<tr >

						<td  ><fmt:message key="end_time" /></td>
						<td colspan="3">
							<input type="datetime-local" name="endTime" id="endTime" cssClass="select">
							<font color="red">*</font>
						</td>
						
					</tr>
					
					<tr>
						<td><fmt:message key="reruit_content" /></td>

						<td colspan="3"><input type="hidden" id="reruitContent"
							name="reruitContent" /> <script id="editor" name="editor"
								type="text/plain" style="width:605px;height:300px;"></script>
						</td>
					</tr>
					<%-- <tr>
						<td><fmt:message key="tsyspost.parentPostid" /></td>
						<td>
							<input type="hidden" id="parentPostid" name="parentPostid"  />
							<input type="text" id="parentPostName" name="parentPostName" readonly="readonly" class="text" />&nbsp;
							<a id="menuBtn" href="javascript:void(0)" onclick="showMenu(); return false;">选择</a>
							<a id="menuBtn" href="javascript:void(0)" onclick="clear()">清空</a>
							<!-- <font color="red">*</font> -->
						</td>
					</tr> --%>
				</table>
			</div>
		</form>
		<!-- 表单布局设计end -->
		<!-- 表单内的按钮设计begin -->
		<div align="center" class="foot-buttons" style="margin-top: 5px">
			<a id="btn_save" onclick="save_click();" class="easyui-linkbutton" iconCls="icon-save">
				<fmt:message key="button.save" />
			</a>
			<a id="btn_save" onclick="back_click();" class="easyui-linkbutton" iconCls="icon-back">
				<fmt:message key="button.back" />
			</a>
		</div>
	</cbitedu:form>
	<div id="menuContent" class="menuContent" style="display: none; position: absolute;">
		<ul id="treeDemo" class="ztree" style="margin-top: 0; height :120px; width:190px; " ></ul>
	</div>
</body>
</html>