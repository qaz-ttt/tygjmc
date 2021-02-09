<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="shortcut icon" href="${ctx }/img/favicon.ico">
<!-- Global CSS  -->
<link rel="stylesheet" href="${ctx }/css/bootstrap.min.css">
<!--Custom Css-->
<link rel="stylesheet" href="${ctx }/css/ty.css">
<link rel="stylesheet" href="${ctx }/css/ty-mobil.css">
<!-- CSS Implementing Plugins -->
<link rel="stylesheet" href="${ctx }/css/line-icons.css">
<link rel="stylesheet" href="${ctx }/css/font-awesome.min.css">
<link rel="stylesheet" href="${ctx }/normalize.css">
<link rel="stylesheet" href="${ctx }/css/sidebar.css">
<script type="text/javascript" src="${ctx }/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/js/bootstrap.min.js"></script>
<script type="text/javascript">
    	$(()=>{
    		$("#news").addClass("active");
    	})
</script>
<script type="text/javascript">
    window.onload = autologin;
	window.onresize = autologin;
  
    /*登录界面自动宽高*/
function autologin(){
	var browserH = document.documentElement.clientHeight;
	
	var hostbodyH = document.getElementById("cont");
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
    
    <!--[if !IE]>面包屑导航_Begin<![endif]-->
    <div style="background-color:#efefef">
        <div class="container">    
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <ol class="breadcrumb cb-breadcrumb">
                      <li><a href="index.html">首页</a></li>
                      <li><a href="${ctx }/api/NewsController.do?method=queryEnterprise">新闻中心</a></li>
                      <li class="active">${news.newType }</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <div id="cont">        
        <div class="container">
            <div class="row">
                <div class="col-sm-3 cb-img-adapt">
                    <img src="${news.img.imgUrl }">
                </div>
                <div class="col-sm-9 cb-img-adapt">
                    <ul class="cb-newsread-box">
                        <li class="cb-title">${news.newTitle }</li>
                        <li class="cb-editTime">
                            <font><b>发布者</b>：${news.newReleMan }</font><font><b>发布时间</b>：${news.newReleTime }</font></li>
                        <li class="cb-content">
                           ${news.newContent} 
                        </li>
                        <li class="cb-context">
                          <b>上一篇：</b> <a href="${ctx }/api/NewsController.do?method=queryContent&id=${last.newId}">${last.newTitle }</a><br> 
                          <b>下一篇：</b> <a href="${ctx }/api/NewsController.do?method=queryContent&id=${next.newId}">${next.newTitle }</a>
                        </li>                    
                    </ul>
                </div>
            </div>
        </div>
       
    </div>
    
<%@ include file="/WEB-INF/jsp/car/foot.jsp"%>

</body>