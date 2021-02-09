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
<meta http-equiv="Content-Type"
	content="multipart/form-data;charset=utf-8" />

<script type="text/javascript">	
	
	function save_click() {
		$("#tsysPostForm").validationEngine({ promptPosition:"bottomRight"});
		var bool = $("#tsysPostForm").validationEngine('validate');
		var data  = $("#tsysPostForm").serialize();
		console.log(data)
		if (bool == true) {
            var formFile = new FormData();
			var fileObj = document.getElementById("reportXML").files[0]; // js 获取文件对象
            if (typeof (fileObj) == "undefined" || fileObj.size <= 0) {
            }else{
                formFile.append("file", fileObj); //加入文件对象
            }
             
          /*   formFile.append("imgType", document.getElementById("imgType").value);
            formFile.append("imgStartTime", document.getElementById("imgStartTime").value);
            formFile.append("imgEndTime", document.getElementById("imgEndTime").value); */
            
            
            formFile.append("imgId",document.getElementsByName("imgId")[0].value);
            
             

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
                url: "${ctx}/imgController.do?method=ajaxSave",
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
	<cbitedu:form bean="img" scope="request">
		<form method="post" enctype="multipart/form-data" name="tsysPostForm" id="tsysPostForm">
			<input type="hidden" name="imgId" />
			<div class="easyui-layout easyui-panel">
				<table class="FormView" border="0" cellspacing="1" cellpadding="0">
					<col class="Label" />
					<col class="Data" />
					
					<tr>
						<td>图片</td>
						<td>


							<input type="file" name="file" id="reportXML" multiple="multiple"/>
					</td>
					</tr>
					
					<!-- <tr>
						<td>图片生效时间</td>
						<td>
							<input type="datetime-local" name="imgStartTime" id="imgStartTime"/>
						</td>
					</tr>
					<tr>
						<td>图片失效时间</td>
						<td>
							<input type="datetime-local" name="imgEndTime" id="imgEndTime"/>
						</td>
					</tr> -->
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