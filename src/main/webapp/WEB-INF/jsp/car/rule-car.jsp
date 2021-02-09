<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="zh">
<!--<![endif]-->

<head>
<title>天逸国际</title>
<!-- Meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<!-- 360浏览器默认采用高速模式渲染页面 -->
<meta name="renderer" content="webkit">

<meta name="keywords" content="Demo">
<meta name="description" content="Demo">
<meta name="author" content="">

<!-- Favicon -->
<link rel="shortcut icon" href="img/favicon.ico">
<!-- Global CSS  -->
<link rel="stylesheet" href="${ctx}/css/bootstrap.min.css">
<!--Custom Css-->
<link rel="stylesheet" href="${ctx}/css/ty.css">
<link rel="stylesheet" href="${ctx}/css/ty-mobil.css">
<!-- CSS Implementing Plugins -->
<link rel="stylesheet" href="${ctx}/css/line-icons.css">
<link rel="stylesheet" href="${ctx}/css/font-awesome.min.css">
<link rel="stylesheet" href="normalize.css">
<link rel="stylesheet" href="${ctx }/css/sidebar.css">
<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(()=>{
    	$("#rule").addClass("active");
    })
</script>
<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->
</head>
<!--[if !IE]>注释规范_Begin<![endif]-->
<!--[if !IE]>注释规范_End<![endif]-->

<script type="text/javascript">
	$(function(){
		var brandName ;
		var priceRange;
		var carType;
	})
</script>
	<%
		String brandName=request.getParameter("qaz");
	
		
	%>
<body>
   <%@ include file="/WEB-INF/jsp/car/head.jsp"%>
    
    <img class="img-responsive" src="${ctx}/images/listing-page-header-img.jpg">
	
    <div class="cb-modular">
        <!--[if !IE]>分类_Begin<![endif]-->
        <div class="container-fluid" style="margin:25px 0;">
            <div class="row">
                <div class="col-sm-12">
                    <!--[if !IE]>品牌_Begin<![endif]-->
                    <ul class="nav nav-pills cb-nav-brand">
                        <li class="active">
                            <a href="${ctx }/api/rulecar.do?method=query" title="全部品牌">
                                <img class="img-responsive" src="http://192.168.0.3:8080/img/af4ee203f0e74c918541d933bc48a8e4.jpg">
                                <div class="cb-brand-name">全部品牌</div>
                            </a>
                        </li>
                        <c:forEach var="modelBrand" items="${brand}" begin="1">
                        <c:choose>
						   <c:when test="${modelBrand.brandName eq brandName}"> 
						         <li class="active">
						   </c:when>
						   <c:otherwise>
						    	 <li>
						   </c:otherwise>
						</c:choose>
                         <a href="${ctx }/api/rulecar.do?method=query&brandName=${modelBrand.brandName}" title="${modelBrand.brandName }">
		                            <img class="img-responsive" src="${modelBrand.img.imgUrl}">
		                            <div class="cb-brand-name">${modelBrand.brandName }</div>
		                        </a>
		                     </li>
	                     </c:forEach>
                  
                    </ul>
                    <!--[if !IE]>价格_Begin<![endif]-->
                    <ul class="nav nav-pills cb-nav-brand">
                        <li class="active"><a href="#">全部价格</a></li>
                    <c:forEach var="modelPrice" items="${price}" begin="1" end="12">
			        	<li><a href="${ctx }/api/rulecar.do?method=query&price=${modelPrice.dictValue}">${modelPrice.dictValue }</a></li>
	        		</c:forEach>
                    </ul>
                    <!--[if !IE]>类型_Begin<![endif]-->
                    <ul class="nav nav-pills cb-nav-brand">
                        <li class="active"><a href="#">全部类型</a></li>
                        <c:forEach var="modelType" items="${type}" begin="1" end="12">
                        	<li><a href="${ctx }/api/rulecar.do?method=query&carType=${modelType.dictValue}">${modelType.dictValue }</a></li>
	        		</c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        
        <!--[if !IE]>列表_Begin<![endif]-->
        <div class="container-fluid">
            <div class="row">
              <c:forEach var="modelCar" items="${car}">
			         <div class="col-md-3 col-sm-4">
	                    <div class="cb-car-box"> 
	                        <div class="cb-car-name cb-texthidden">${modelCar.carName}</div>
	                        <div class="cb-img">
	                            <a href="${ctx}/api/rulecar.do?method=queryById&carId=${modelCar.carId}"><img class="img-responsive" src="${modelCar.img[0].imgUrl }"></a>
	                            <a href="${ctx}/api/rulecar.do?method=queryById&carId=${modelCar.carId}" class="cb-btn">立即查看</a>
	                        </div>
	                        <div class="cb-car-price">￥:<font class="cb-special-price">${modelCar.carNowPrice }w</font>起<br class="visible-sm-block"><font class="cb-proposal-price">原价￥:${modelCar.carOldPrice }w</font></div>
	                        <div class="cb-car-info">${modelCar.carCharacteristic }</div>
	                    </div>
               	 	</div>	
	        	</c:forEach>
                </div>
                </div>
            </div>
            
<%-- ${type}
${price} --%>
   <!--[if !IE]>分页_End<![endif]-->
            <div class="row">
                <div class="col-sm-11">
                    <ul class="pagination cb-pagination">
                      <li><a href="${ctx}/api/rulecar.do?method=query&pageNum=${page.pageNum ==1 ? 1 :page.pageNum-1 }&pageSize=12">&laquo;</a></li>
                      <c:forEach var="p" begin="1" end="${page.pages }">
                      <li <c:if test="${page.pageNum == p}">class="active"</c:if>><a href="${ctx}/api/rulecar.do?method=query&pageNum=${p}&pageSize=12">${p}</a></li>
                      </c:forEach>                  
                      <li><a href="${ctx}/api/rulecar.do?method=query&pageNum=${page.pageNum ==page.pages?page.pages:page.pageNum+1 }&pageSize=12">&raquo;</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
<%@ include file="/WEB-INF/jsp/car/foot.jsp"%>

</body>