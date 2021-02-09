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
<link rel="stylesheet" type="text/css"
	href="${ctx}/ui_widget/ztree/css/demo.css">
<link href="${ctx }/css/upload.css" rel="stylesheet"/>

<script type="text/javascript" src="${ctx }/js/uploadImg.js"></script>	
	
	
<!-- 配置文件 -->
<script type="text/javascript"
	src="${ctx}/ui_widget/ueditor/ueditor.config.js"></script>
<script type="text/javascript"
	src="${ctx}/ui_widget/ueditor/ueditor.all.js"></script>
<!-- 实例化编辑器 -->
<script type="text/javascript">

$(function(){
	
    var da = ${url};
  	console.log(da);
      var params = {
        container: '#container',
        url: '',
        dragDrop: false,
        data: da,   
        onDragLeave: function(target) {
          console.log(111)
        }
      };
      var uploadImg1 = new UploadImg(params);
   

	
//初始化
		var ue = UE.getEditor('editor');
 		ue.ready(function() {
 		ue.setContent('${car.carContent}');
 		});
	 });
		function save_click() {
		var content = UE.getEditor('editor').getContent();
	//判断内容是否为空
		if (!UE.getEditor('editor').hasContents()) {
		$.messager.alert('提示:', '内容不能为空!', 'info');
		return false;

		}
	$("#carContent").val(content);

	$("#carfrom").validationEngine({ promptPosition:"bottomRight"});
	var bool = $("#carfrom").validationEngine('validate');
	if (bool == true) {
		
	var formFile = new FormData();
	var  fileObj = document.getElementById("reportXML").files; // js 获取文件对象
	console.log(fileObj);

	
	
    if (typeof (fileObj) == "undefined" || fileObj.size <= 0) {
    }else{
        for(let i=0;i<fileObj.length;i++){
        	formFile.append("file", fileObj[i]); //加入文件对象
          }
        
        console.log(formFile);
    }
    formFile.append("brandId", document.getElementById("brandId").value); 
    formFile.append("carSellNum", document.getElementById("carSellNum").value);  
    formFile.append("carType", document.getElementById("carType").value);
    formFile.append("carName", document.getElementById("carName").value);
    formFile.append("carId",document.getElementsByName("carId")[0].value); 
    formFile.append("carColor", document.getElementById("carColor").value);
    formFile.append("carGuar", document.getElementById("carGuar").value);
    formFile.append("carSeller", document.getElementById("carSeller").value);
    formFile.append("phone", document.getElementById("phone").value);
    formFile.append("priceRange", document.getElementById("priceRange").value);
    formFile.append("carReleTime", document.getElementById("carReleTime").value);
    formFile.append("carState", document.getElementById("carState").value);
    formFile.append("carCharacteristic", document.getElementById("carCharacteristic").value);
    formFile.append("carOldPrice", document.getElementById("carOldPrice").value);
    formFile.append("carNowPrice", document.getElementById("carNowPrice").value);
    formFile.append("carContent", document.getElementById("carContent").value);
    formFile.append("stock", document.getElementById("stock").value);
 
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
        url: "${ctx}/carController.do?method=ajaxSave",
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
	function reloadList() {
		parent.reloadlist();
	}
	function back_click() {
		parent.closeDialog();
	}

	function clear() {
		/* 		$("#postName").val("");
		 $("#remark").val("");
		 $("#postType").val("4"); // 把岗位类型重置成下来菜单的第一个
		 */$("#parentPostName").val("");
		$("#parentPostid").val("");
	}
</script>
</head>
<%
	List brand = (List) request.getSession().getAttribute("brand");
	List type = (List) request.getSession().getAttribute("type");
	List price = (List) request.getSession().getAttribute("price");
%>

<body style="overflow: auto">
	<!-- 表单布局设计begin -->
	<cbitedu:form bean="car" scope="request">
		<form action="${ctx}/carController.do?method=ajaxSave" method="post"
			name="carfrom" id="carfrom" enctype="multipart/form-data"	>
			<input type="hidden" name="carId" />
			<div class="easyui-layout easyui-panel">
				<table class="FormView" border="0" cellspacing="1" cellpadding="0">
					<col class="Label" />
					<col class="Data" />
					<col class="Label" />
					<col class="Data" />

					<tr>
						<td>品牌</td>
						<td>
						<select name="brand.brandName" id="brandId" style="width: 160px">
								<c:forEach var="list" items="${brand}">
									<option value="${list.brandId}" <c:if test="${car.brand.brandName eq list.brandName}">selected="selected"</c:if>>${list.brandName}</option>
								</c:forEach>
						</select>
						</td>
						<td>汽车销量</td>
						<td><input type="text" name="carSellNum"  id="carSellNum"/></td>
					</tr>

					<tr>
					
						<td>汽车类型</td>
						<td><select name="carType" id="carType" style="width: 160px">
								<c:forEach var="list" items="${type}">
									<option value="${list.dictId}" <c:if test="${car.carType.dictValue eq list.dictValue}">selected="selected"</c:if>>${list.dictValue}</option>
								</c:forEach>
						</select></td>
						<td>汽车名称</td>
						<td><input type="text" name="carName"  id="carName"/></td>
					</tr>

					<tr>
						<td>汽车颜色</td>
						<td><input type="text" name="carColor"  id ="carColor"/></td>
						<td>汽车保障</td>
						<td><input type="text" name="carGuar"  id ="carGuar"/></td>
					</tr>

					<tr>
						<td>汽车商家</td>
						<td><input type="text" name="carSeller" id="carSeller" /></td>
						<td>联系电话</td>
						<td><input type="text" name="phone"  id = "phone"/></td>
					</tr>
					<tr>
						<td>价格区间</td>
						<td>
						<select name="priceRange" id="priceRange">
								<c:forEach var="list" items="${price}">
									<option value="${list.dictId}"<c:if test="${car.priceRange.dictValue eq list.dictValue}">selected="selected"</c:if>>${list.dictValue}</option>
								</c:forEach>
						<select>
								</td>
						<td>汽车发布时间</td>
						<td><input type="datetime-local" name="carReleTime" id="carReleTime"/></td>
					</tr>
					<tr>
						<td>汽车状态</td>
						<td>
						<select name="carState" id="carState"
							style="width: 160px">
								<option value="上架">上架</option>
								<option value="下架">下架</option>
						</select>
						</td>
						<td>汽车特点</td>
						<td><input type="text" name="carCharacteristic" id="carCharacteristic"/></td>
					</tr>
					<tr>
						<td>汽车原价</td>
						<td><input type="text" name="carOldPrice" id="carOldPrice" /></td>
						<td>汽车折扣价</td>
						<td><input type="text" name="carNowPrice"  id="carNowPrice"/></td>

					</tr>
				
					<tr>
					<td>汽车详细内容</td>
						<td colspan="3"><input type="hidden" id="carContent"
							name="carContent" /> <script id="editor" name="editor"
								type="text/plain" style="width:605px;height:300px;"></script>
						</td>
					<tr>
					
					<tr>
						<td>汽车图片</td>
						<td colspan="3">
							
							 <div id="container">
						      <a href="javascript:void(0)" class="file">选择文件
						      	<input type="file" name="file" id="reportXML" multiple="multiple" accept = 'image/gif,image/jpeg,image/jpg,image/png'/>
						       
						        <input type="hidden" />
						      </a>
						    </div>
						
						</td>
					</tr> 
					<tr>
						<td>库存</td>
						<td><input type="text" name="stock"  id="stock" /></td>
					</tr>

				</table>
			</div>
		</form>
		<!-- 表单布局设计end -->
		<!-- 表单内的按钮设计begin -->
		<div align="center" class="foot-buttons" style="margin-top: 5px">
			<a id="btn_save" onclick="save_click();" class="easyui-linkbutton"
				iconCls="icon-save">保存</a> <a id="btn_save" onclick="back_click();"
				class="easyui-linkbutton" iconCls="icon-back">返回</a>
		</div>
	</cbitedu:form>
	<div id="menuContent" class="menuContent"
		style="display: none; position: absolute;">
		<ul id="treeDemo" class="ztree"
			style="margin-top: 0; height: 140px; width: 160px;"></ul>
	</div>
	  
	
</body>
</html>