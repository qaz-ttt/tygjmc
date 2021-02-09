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
<script type="text/javascript" src="${ctx}/js/jquery.form.js"></script>
<meta http-equiv="Content-Type" content="multipart/form-data;charset=utf-8" />
<!-- 配置文件 -->
<script type="text/javascript" src="${ctx}/ui_widget/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="${ctx}/ui_widget/ueditor/ueditor.all.js"></script>
<!-- 实例化编辑器 -->
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
<body style="overflow:auto">
	<!-- 表单布局设计begin -->
	<cbitedu:form bean="new" scope="request" >
		<form name="newfrom" id="newfrom" enctype="multipart/form-data">
			<input type="hidden" name="newId" />
			<div class="easyui-layout easyui-panel">
				<table class="FormView" border="0" cellspacing="1" cellpadding="0">
					<col class="Label" />
					<col class="Data" />
					<tr>
						<td><fmt:message key="new_title" /></td>
						<td>					
							${new.newTitle }
						</td>
					</tr>
					<tr>
						<td><fmt:message key="new_type" /></td>
						<td><!-- <input type="text" id="newType" name="newType" class="text validate[required,maxSize[15]]" /> -->							
							${new.newType }
						</td>
					</tr>
					<tr>
						<td><fmt:message key="new_rele_man" /></td>
						<td>		
							${new.newReleMan } 
						</td>
					</tr>
					<tr>
						<td><fmt:message key="new_content" /></td>
						<td colspan="3">
							${new.newContent}
						</td>
					</tr>
					<%-- <tr>
						<td>新闻图片</td>
						<td>
						<img src="${new.img.imgUrl}">
						</td>
					</tr>  --%>
						
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