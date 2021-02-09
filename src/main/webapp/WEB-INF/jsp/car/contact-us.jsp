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
    	$("#contact").addClass("active");
    })
</script>
<script type="text/javascript">
    window.onload = autologin;
	window.onresize = autologin;
  
    /*登录界面自动宽高*/
function autologin(){
	var browserH = document.documentElement.clientHeight;
	
	var hostbodyH = document.getElementById("contactus");
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
   
    <div id="contactus">
        <div class="cb-contact-box">
            <div class="cb-contact-word">
                <ul class="cb-ul-info">
                    <li class="cb-cp-name">湖南天逸凯腾汽车贸易有限公司<li>
                    <li class="cb-driver"></li>
                    <c:forEach items="${info }" var="info">
                    <li class="cb-cp-info"><span class="glyphicon glyphicon-earphone p-marginR10"></span>${info.infoName }：${info.infoValue }</li>
                    
                    </c:forEach>
                </ul>
            </div>
            <div class="cb-contact-wechart">
                <div class="cb-wechart-box">
                	
                    <img class="img-responsive" src="${ctx }/images/cb-weChart.png">
                   
                    <div class="cb-wechart-word"><font style="color:#fd0000;">扫扫二维码</font><br>关注天逸</div>
                </div>
            </div>
        </div>
    </div>
<%@ include file="/WEB-INF/jsp/car/foot.jsp"%>

</body>