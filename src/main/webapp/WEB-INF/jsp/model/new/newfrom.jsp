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
$(function(){
    //初始化
		var ue = UE.getEditor('editor');
		 ue.ready(function() {
		 	ue.setContent('${new.newContent}');
		 });
		 });

	function save_click() {
		var content = UE.getEditor('editor').getContent();
		//判断内容是否为空
		if (!UE.getEditor('editor').hasContents()) {
			$.messager.alert('提示:', '内容不能为空!', 'info');
			return false;
		}
		$("#newContent").val(content);
		
		$("#newfrom").validationEngine({ promptPosition:"bottomRight"});
		var bool = $("#newfrom").validationEngine('validate');
		if (bool == true) {
			var formFile = new FormData();
			var fileObj = document.getElementById("reportXML").files[0]; // js 获取文件对象
            if (typeof (fileObj) == "undefined" || fileObj.size <= 0) {
            }else{
                formFile.append("file", fileObj); //加入文件对象
            }
            formFile.append("newTitle", document.getElementById("newTitle").value); 
            formFile.append("newType", document.getElementById("newType").value);  
            //formFile.append("newReleMan", document.getElementById("newReleMan").value);
            formFile.append("newContent", document.getElementById("newContent").value);
            formFile.append("newId",document.getElementsByName("newId")[0].value); 
            //formFile.append("newReleTime", document.getElementById("newReleTime").value);
            

            //第一种  XMLHttpRequest 对象
            //var xhr = new XMLHttpRequest();
            //xhr.open("post", "/Admin/Ajax/VMKHandler.ashx", true);
            //xhr.onload = function () {
            //    alert("上传完成!");
            //};
            //xhr.send(formFile);

            //第二种 ajax 提交

            var data = formFile;
            $.ajax({
                url: "${ctx}/NewController.do?method=ajaxSave",
                data: data,
                type: "Post",
                dataType: "json",
                cache: false,//上传文件无需缓存 
                processData: false,//用于对data参数进行序列化处理 这里必须false
                contentType: false, //必须 
                success: function (data) {
                	if (data.flag) {
						jQuery.messager.alert('提示:', data.msg, 'info', function(){
							reloadList();
							back_click();
						});
					} else {
						jQuery.messager.alert('提示:', data.msg, 'info');
					}
                },
            })
		}
		else {
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
	<cbitedu:form bean="new" scope="request" >
		<form action="${ctx}/NewController.do?method=ajaxSave" method="post" name="newfrom" id="newfrom" enctype="multipart/form-data">
			<input type="hidden" name="newId" />
			<div class="easyui-layout easyui-panel">
				<table class="FormView" border="0" cellspacing="1" cellpadding="0">
					<col class="Label" />
					<col class="Data" />
					<tr>
						<td><fmt:message key="new_title" /></td>
						<td>
							<input type="text" id="newTitle" name="newTitle" class="text validate[required,maxSize[30]]" />
							<font color="red">*</font>
						</td>
					</tr>
					<tr>
						<td><fmt:message key="new_type" /></td>
						<td><!-- <input type="text" id="newType" name="newType" class="text validate[required,maxSize[15]]" /> -->
							<select name="newType" class="text" id="newType">

                				<option value="企业动态">企业动态</option>
                				<option value="行业动态">行业动态</option>
                				<option value="首页新闻">首页新闻</option>

                			 </select>
							<font color="red">*</font>
						</td>
					</tr>
					<%-- <tr>
						<td><fmt:message key="new_rele_man" /></td>
						<td>
							<input type="text" id="newReleMan" name="newReleMan" class="text validate[required,maxSize[15]]" />
							<font color="red">*</font> 
						</td>
					</tr> --%>
					<tr>
						<td><fmt:message key="new_content" /></td>
						<td colspan="3"><input type="hidden" id="newContent"
							name="newContent" /> <script id="editor" name="editor"
								type="text/plain" style="width:605px;height:300px;"></script>
						</td>
					</tr>
					<tr>
						<td>新闻封面</td>
						<td>
							<input type="file" name="file" id="reportXML" accept="image/png,image/jpeg"/>
						</td>
					</tr> 
					
				</table>
			</div>
		</form>
		<!-- 表单布局设计end -->
		<!-- 表单内的按钮设计begin -->
		<div align="center" class="foot-buttons" style="margin-top: 5px">
			<a id="btn_save" onclick="save_click()" class="easyui-linkbutton" iconCls="icon-save">
				<fmt:message key="button.save" />
			</a>
			<a id="btn_save" onclick="back_click()" class="easyui-linkbutton" iconCls="icon-back">
				<fmt:message key="button.back" />
			</a>
		</div>
	</cbitedu:form>
	<div id="menuContent" class="menuContent" style="display: none; position: absolute;">
		<ul id="treeDemo" class="ztree" style="margin-top: 0; height : 140px; width: 160px; " ></ul>
	</div>
</body>
</html>