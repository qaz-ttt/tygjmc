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
	<cbitedu:form bean="recruit" scope="request">
		<form name="modelRecruit" id="modelRecruit">
			<input type="hidden" name="recruitId" />
			<div class="easyui-layout easyui-panel">
				<table class="FormView" border="0" cellspacing="1" cellpadding="0">
					<col class="Label" />
					<col class="Data" />
					
					<tr>
						<td><fmt:message key="recruit_title" /></td>
						<td>
							${recruit.recruitTitle }
						</td>
					</tr>
					<tr>
						<td><fmt:message key="reruit_name" /></td>
						<td>					
							${recruit.reruitName }
						</td>
					</tr>
					
					<tr>
						<td><fmt:message key="reruit_pay" /></td>
						<td>
							${recruit.reruitPay }
						</td>
					</tr>
					<tr>
						<td><fmt:message key="reruit_num" /></td>
						<td>
							${recruit.reruitNum }
						</td>
					</tr>
					
					<tr>
						<td><fmt:message key="reruit_man" /></td>
						<td>
							${recruit.reruitMan }
						</td>
					</tr>
					<tr>
						<td><fmt:message key="reruit_contacts_phone" /></td>
						<td>
							${recruit.reruitContactsPhone }
						</td>
					</tr>
					
					<tr >
						<td><fmt:message key="end_time" /></td>
						
						<td>
							${recruit.endTime }
						</td>
						
					</tr>
					
					<tr>
						<td><fmt:message key="reruit_content" /></td>

						<td>
							${recruit.reruitContent }
						</td>
					</tr>
				</table>
			</div>
		</form>
		<!-- 表单布局设计end -->
		
	</cbitedu:form>
	<div id="menuContent" class="menuContent" style="display: none; position: absolute;">
		<ul id="treeDemo" class="ztree" style="margin-top: 0; height :140px; width:160px; " ></ul>
	</div>
</body>
</html>