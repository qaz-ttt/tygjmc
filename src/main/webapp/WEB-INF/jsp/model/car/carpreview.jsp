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
<script type="text/javascript" src="${ctx }/js/jquery.js"></script>
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
	})


	function reloadList() {
		parent.reloadlist();
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
						<td>${car.brand.brandName }</td>
						<td>汽车销量</td>					
						<td>${car.carSellNum }</td>
					</tr>

					<tr>
					
						<td>汽车类型</td>
						<td>${car.carType.dictValue }</td>
						<td>汽车名称</td>
						<td>${car.carName }</td>
					</tr>

					<tr>
						<td>汽车颜色</td>
						<td>${car.carColor }</td>
						<td>汽车保障</td>
						<td>${car.carGuar }</td>
					</tr>

					<tr>
						<td>汽车商家</td>
						<td>${car.carSeller }</td>
						<td>联系电话</td>
						<td>${car.phone }</td>
					</tr>
					<tr>
						<td>价格区间</td>
						<td>${car.priceRange.dictValue}
						
						</td>
						<td>汽车发布时间</td>
						<td>${car.carReleTime}</td>
					</tr>
					<tr>
						<td>汽车状态</td>
						<td>${car.carState }</td>
						<td>汽车特点</td>
						<td>${car.carCharacteristic }</td>
					</tr>
					<tr>
						<td>汽车原价</td>
						<td>${car.carOldPrice }</td>
						<td>汽车折扣价</td>
						<td>${car.carNowPrice}</td>

					</tr>
				
					<tr>
					<td>汽车详细内容</td>
						<td colspan="3">${car.carContent }
						</td>
					<tr>
					
					<tr>
						<td>库存</td>
						<td colspan="3">${car.stock }</td>
					</tr>
					<tr>
						<td>汽车图片</td>
						<td colspan="3">
							 <div id="container">
							     <input type="hidden" />
							      </a>
							  </div>
						</td>
					</tr>

				</table>
			</div>
		</form>
		<!-- 表单布局设计end -->
		<!-- 表单内的按钮设计begin -->
	</cbitedu:form>
	<div id="menuContent" class="menuContent"
		style="display: none; position: absolute;">
		<ul id="treeDemo" class="ztree"
			style="margin-top: 0; height: 140px; width: 160px;"></ul>
	</div>
	  
	
</body>
</html>