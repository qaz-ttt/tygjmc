<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<%@ include file="/WEB-INF/jsp/common/title.jsp"%>
</head>
<script type="text/javascript">
	$(function() {

		$("#tsys_manager_list").flexigrid({
			url : "${ctx}/carController.do?method=query",// ajax方式对应的url地址
			type : 'post',// 数据发送方式 
			dataType : 'json',// 数据加载的类型(xml/json)        
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			sortname : "carId",//排序
			sortorder : "asc",
			useRp : true,
			radio : true,// 是否要多选框
			idProperty : 'carId',// 多选框绑定行的id
			singleSelect : true, //仅允许选择单行 
			rp : 15,
			showTableToggleBtn : false,
			width : 'auto',// 宽度值 
			height : $("body").height() - 120,// 插件的高度，单位为px   
			striped : true,// 是否显示斑纹效果，默认是奇偶交互的形式
			resizable : false,// 是否可伸缩   
			errormsg : '发生错误', //错误提升信息
			usepager : true, // 是否分页
			nowrap : true, //是否不换行               
			rpOptions : [ 10, 15, 20, 30, 40, 50 ],
			proitemg : '正在处理数据，请稍候 ...', //正在处理的提示信息    

			colModel : [ {
				display : '序号',
				name : 'rownum_',
				width : 50,
				sortable : true,
				align : 'center',
				process : displayID   //displayID是扩展函数
			}, 
			{display : '品牌',name : 'brandId.brandName',width : 150,sortable : true,align : 'center'},
			/* {display :'图片预览',
				 name : 'img[0]',
				width : 50,
				sortable : true,
				align : 'center',
				 process : function(num1) {
					var href = num1.innerHTML;
					console.log(href);
					num1.innerHTML="<a href="+href+" target='_blank'>预览图片</a>"
				return num1;

					} 
			}, */
			{display : '审核状态',name : 'audit.auditState',width : 150,sortable : true,align : 'center'},
			{display : '汽车类型',name : 'carType.dictValue',width : 150,sortable : true,align : 'center'},
			{display : '汽车名称',name : 'carName',width : 150,sortable : true,align : 'center'},
			{display : '汽车颜色',name : 'carColor',width : 150,sortable : true,align : 'center'},
			{display : '汽车保障',name : 'carGuar',width : 150,sortable : true,align : 'center'},
			{display : '汽车商家',name : 'carSeller',width : 150,sortable : true,align : 'center'},
			{display : '联系电话',name : 'phone',width : 150,sortable : true,align : 'center'},
			{display : '价格区间',name : 'priceRange.dictValue',width : 150,sortable : true,align : 'center'},
			{display : '汽车发布时间',name : 'carReleTime',width : 150,sortable : true,align : 'center'},
			{display : '汽车状态',name : 'carState',width : 150,sortable : true,align : 'center'},
			{display : '汽车原价',name : 'carOldPrice',width : 150,sortable : true,align : 'center'},
			{display : '汽车折扣价',name : 'carNowPrice',width : 150,sortable : true,align : 'center'},
			{display : '汽车特点',name : 'carCharacteristic',width : 150,sortable : true,align : 'center'},
			{display : '审核结果',name : 'audit.auditResult',width : 150,sortable : true,align : 'center'},
			{display : '汽车销量',name : 'carSellNum',width : 150,sortable : true,align : 'center'},
			{display : '库存',name : 'stock',width : 150,sortable : true,align : 'center'},
			{display : '创建人',name : 'creater',width : 150,sortable : true,align : 'center'},
			{display : '创建时间',name : 'createDate',width : 150,sortable : true,align : 'center'}, 
			{display : '修改时间',name : 'editDate',width : 150,sortable : true,align : 'center'}]
		});

		function displayID(value, i) {
			//返回当前页码
			var p = $("div.pGroup>.pcontrol>input").val();
			//返回数据行数组
			var tbl = $("#tsys_manager_list>tbody>tr");
			//返回当前行
			var $tr = $("#row" + i);
			//返回当前序号起始值,其中*前面为当前页码,后面为每页显示条数
			var startNum = (p - 1) * parseInt($("select[name='rp']").val());
			//index+startNum,序号值
			var numID = (tbl.index($tr) + 1) + startNum;
			//为对象赋值
			value.innerHTML = numID;

			return value;
		};

		$("#container").layout();

		$(window).resize(function() { // 当窗口的大小改变是触发这个resize事件
			$("#container").layout();
		});

		$("#btn_query").click(function() {
			$('#tsys_manager_list').flexOptions({
				params : [{"name" : "car_brandName",
							"value" : $("#brandName").val()
						}, {"name" : "car_carType",
							"value" : $("#carType").val()
						}, {"name" : "car_priceRange",
							"value" : $("#priceRange").val()
						} ],
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				newp : 1
				}).flexReload();
		});

		$("#btn_edit").click(function() {
			if ($(".trSelected").length != 1) {
				jQuery.messager.alert('提示:', '请先选中一条记录!', 'info');
				return false;
			}
			var handler = function() {
				var hid = function() {
					win.window("close");
				};
				$("input[type='button']").click(hid);
			};
			var id = $(".trSelected", $("#tsys_manager_list")).attr("data-id");
			
			dialogFun = sy.modalDialog({
				title : '修改汽车基本信息',
				width : 800,
				height : 500,
				resizable : true,
				url : '${ctx}/carController.do?method=modify&id='+id
			});
		});
		$("#preview").click(function() {
			if ($(".trSelected").length != 1) {
				jQuery.messager.alert('提示:', '请先选中一条记录!', 'info');
				return false;
			}
			var handler = function() {
				var hid = function() {
					win.window("close");
				};
				$("input[type='button']").click(hid);
			};
			var id = $(".trSelected", $("#tsys_manager_list")).attr("data-id");
			
			dialogFun = sy.modalDialog({
				title : '预览汽车基本信息',
				width : 750,
				height : 500,
				resizable : true,
				url : '${ctx}/carController.do?method=preview&id='+id
			});
		});

		$("#btn_del").click(
				function() {
					if ($(".trSelected").length == 0) {
						jQuery.messager.alert('提示:', '请先选中一条记录!', 'info');
						return false;
					}
					
					jQuery.messager.confirm('提示:', '你确认要删除吗?', function(event) {
						if (event) {
							var carIds = [];
							$(".trSelected", $("#tsys_manager_list")).each(
									function() {
										carIds.push($(this).attr("data-id"));
									});
							
							$.ajax({
								url : "${ctx}/carController.do",
								data : {
									method : "del",
									carIds : carIds
								},
								traditional : true, // 加上这个属性，可以直接传数组类型的数据
								type : 'post',
								dataType : 'json',
								success : function(data) {
									if (data.flag) {
										jQuery.messager.alert('提示:', '删除成功！',
												'', function() {
													reloadlist(); // 只刷新列表就可以了
												});
									} else {
										jQuery.messager.alert('提示:', '删除失败！',
												'warning');
									}
								}
							});
						}
					});
				});
	});

	function reloadlist(){
		$('#tsys_manager_list').flexOptions({
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			newp : 1
		}).flexReload();
	}
	
	var dialogFun = null;
	var btn_add = function() {
		dialogFun = sy.modalDialog({
			title : '汽车基本信息',
			width : 800,
			height : 550,
			resizable : true,
			url : '${ctx}/carController.do?method=add'
		});
	};

	// 关闭窗口
	function closeDialog() {
		dialogFun.dialog('close');
	}
</script>
<body>
		<div style="position: relative;" id="container" fit="true"
		class="easyui-layout">
		<div region="north" border="false">
			<div id="query_area">
				<!-- 按钮栏布局end -->
				<!-- 查询条件区域begin-->
				<table class="FormView" border="0" cellspacing="1" cellpadding="0">
					<col class="Label" />
					<col class="Data" />
					<col class="Label" />
					<col class="Data" />
					<col class="Label" />
					<col class="Data" />
					<tr>
						<td align="left"><!-- 品牌名称 -->
							<fmt:message key="brand_name" />
						</td>
						<td colspan="1">
							<select name="car_brandName" id="brandName">
		                		<option value="">请选择</option>
		                		<c:forEach var="list" items="${brand}">
		                    	 <option value="${list.brandName}" >${list.brandName}</option>
		                     	</c:forEach>
		                    <select>
						</td>
						
						<td align="left"><!-- 车辆类型 -->
							<fmt:message key="car_dist" />
						</td>
						<td colspan="1">
							<select name="car_carType" id="carType">
		                		<option value="">请选择</option>
		                		<c:forEach var="list" items="${type}">
		                    	 <option value="${list.dictValue}" >${list.dictValue}</option>
		                     	</c:forEach>
		                    <select>
						</td>
						
						<tr>
						<td ><!-- 价格区间 -->
						
							<fmt:message key="price_range" />
						</td>
						<td colspan="4">
							<select name="car_priceRange" id="priceRange">
		                		<option value="">请选择</option>
		                		<c:forEach var="list" items="${price}">
		                    	 <option value="${list.dictValue}" >${list.dictValue}</option>
		                     	</c:forEach>
		                    <select>
						</td>
						<tr>
					</tr>
				</table>
			</div>
			<!-- 查询条件布局end-->
			<!-- 按钮栏布局begin -->
			<div id="toolbar_area" border="false">
				<a class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="btn_add()">
					新增
				</a>
				<a class="easyui-linkbutton" iconCls="icon-edit" plain="true" id="btn_edit">
					编辑
				</a>
				<a class="easyui-linkbutton" iconCls="icon-remove" plain="true" id="btn_del">
					删除
				</a>
				<a class="easyui-linkbutton" iconCls="icon-query" plain="true" id="btn_query">
					查询
				</a>
				<a class="easyui-linkbutton" iconCls="icon-add" plain="true" id="preview">
					预览
				</a>
			</div>
		</div>
		<!-- 列表布局begin -->
		<div id="grid-body" class="grid-body" region="center">
			<div id="tsys_manager_list"></div>
		</div>
	</div>
</body>
</html>
