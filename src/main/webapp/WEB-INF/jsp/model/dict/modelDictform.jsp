<%@page import="java.util.List"%>
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
		$("#modelDict").validationEngine({ promptPosition:"bottomRight"});
		var bool = $("#modelDict").validationEngine('validate');
		if (bool == true) {
			$.ajax({
				url : "${ctx}/ModelDictController.do?method=ajaxSave",
				type : "POST",
				data : $("#modelDict").serialize(),
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
<%
	List list=(List)request.getSession().getAttribute("list");

%>
<body>

	<!-- 表单布局设计begin -->
	<cbitedu:form bean="dict" scope="request">
		<form action="${ctx}/ModelDictController.do?method=ajaxSave" method="post" name="modelDict" id="modelDict">
			<input type="hidden" name="dictId" />
			<div class="easyui-layout easyui-panel">
				<table class="FormView" border="0" cellspacing="1" cellpadding="0">
					<col class="Label" />
					<col class="Data" />
					<tr>
						<td><fmt:message key="dict_type" /></td>
						<td>
							<%-- <select name="dictType" id="dictType" style="width:160px">
			                	
			                	<c:forEach var="list" items="${list}">
			                    	<option value="${list.auditType}">${list.auditType}</option>
			                    </c:forEach>
                    		</select> --%>
                    		<input type="text" id="dictType" name="dictType" class="text validate[required,maxSize[15]]" />
							<font color="red">*</font>
						</td>
					</tr>
					<tr>
						<td><fmt:message key="dict_value" /></td>
						<td>
							<input type="text" id="dictValue" name="dictValue" class="text validate[required,maxSize[15]]" />
							<font color="red">*</font>
						</td>
					</tr>
					<tr>
						<td><fmt:message key="dict_no" /></td>
						<td>
							<input type="text" id="dictNo" name="dictNo" class="text validate[required,maxSize[15]]" />
							<font color="red">*</font>
						</td>
					</tr>
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
		<ul id="treeDemo" class="ztree" style="margin-top: 0; height : 140px; width: 160px; " ></ul>
	</div>
</body>
</html>