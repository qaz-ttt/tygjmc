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
<link href="${ctx}/css/gdt-style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(()=>{
    	$("#about").addClass("active");
    })
</script>
<script type="text/javascript">
    window.onload = autologin;
	window.onresize = autologin;
  
    /*登录界面自动宽高*/
function autologin(){
	var browserH = document.documentElement.clientHeight;
	
	var hostbodyH = document.getElementById("aboutus");
	hostbodyH.style.minHeight = browserH - 100 + "px";	
}
</script>
<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->
</head>
<!--[if !IE]>注释规范_Begin<![endif]-->
<!--[if !IE]>注释规范_End<![endif]-->
<body>
    <%@ include file="/WEB-INF/jsp/car/head.jsp"%>
    
    <div id="aboutus">
        <div class="cb-modular11">
            <div class="cb-about-name">湖南天逸凯腾汽车贸易有限公司</div>
            <div id="c-about" class="carousel slide" data-ride="carousel">
                <!-- 轮播（Carousel）指标 -->
             
                <div class="carousel-indicators">
                    <c:forEach var="info" items="${info}" begin="0" end="4">
	                  <div data-target="#c-about" data-slide-to="${info.orderId}"
	                  <c:if test="${info.orderId == 0}">class="active"</c:if>>${info.infoName}</div>
	                  </c:forEach>
                </div>
                
                <!-- 轮播（Carousel）项目 -->
                <div class="carousel-inner">
                
                    
                    
                    <c:forEach var="info" items="${info}" begin="0" end="4">
	                   <div class="item <c:if test="${info.orderId ==0}">active</c:if>">
                        <div class="c-infoBox">
                            <div class="c-abUs">
                                ${info.infoValue}
                             </div>
                        </div>
                    </div>
	               </c:forEach>
                    
                </div>
                <!-- 轮播（Carousel）导航 -->
            </div>
        </div>
    </div>
<%@ include file="/WEB-INF/jsp/car/foot.jsp"%>

</body>