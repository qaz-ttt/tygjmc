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
	
	
	
	function reloadList(){
		parent.reloadlist();
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
<%
	List list=(List)request.getSession().getAttribute("list");

%>
	<!-- 表单布局设计begin -->
	<cbitedu:form bean="audit" scope="request">
		<form action="${ctx}/auditController.do?method=ajaxSave" method="post" name="tsysPostForm" id="tsysPostForm">
			<input type="hidden" name="auditId" />
			<div class="easyui-layout easyui-panel">
				<table class="FormView" border="0" cellspacing="1" cellpadding="0">
					<col class="Label" />
					<col class="Data" />
					
					<tr>
						<td>审核结果</td>
						<td>
							<select name="auditResult">
								<option value=""></option>
			                	<option value="通过">通过</option>
			                	<option value="未通过">未通过</option>
                    		</select>
						</td>
					</tr>
					<tr>
						<td>审核备注</td>
						<td>
							<input type="text" name="auditRemake"/>
							<font color="red">*</font>
						</td>
					</tr>
					<tr>
						<td>审核类型</td>
						<td>
							
                    		<select name=auditType id="auditType">
				                	<option value="">所有类型</option>
			                		<option value="新闻审核">新闻审核</option>
			                		<option value="汽车审核">汽车审核</option>
			                		<option value="站点审核">站点审核</option>
			                		<option value="问题审核">问题审核</option>
	                    		</select>
                    		
                    		
                    		
							<font color="red">*</font>
						</td>
					</tr>
					<tr>
						<td>审核状态</td>
						<td>
							<select name="auditState">
								<option value=""></option>
			                	<option value="已审核">已审核</option>
			                	<option value="未审核">未审核</option>
                    		</select>
       						
						</td>
					</tr>
					
					
				</table>
			</div>
		</form>
		<!-- 表单布局设计end -->
		<!-- 表单内的按钮设计begin -->
	</cbitedu:form>
	<div id="menuContent" class="menuContent" style="display: none; position: absolute;">
		<ul id="treeDemo" class="ztree" style="margin-top: 0; height : 140px; width: 160px; " ></ul>
	</div>
</body>
</html>