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
<link href="${ctx }/css/recruit.css" rel="stylesheet">
<link rel="stylesheet" href="${ctx }/css/sidebar.css">
<script type="text/javascript" src="${ctx }/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(()=>{
    	$("#recruit").addClass("active");
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
<style>
	section{
		background: url(../images/aoligei.jpg) no-repeat center center
	}
	.job-new-list{
		  background-color: rgba(255,255,255,0.7);
	}
	
</style>
<body>

    <%@ include file="/WEB-INF/jsp/car/head.jsp"%>
	
	<section>
		<div class="container">
		
			
			<div class="row"  style="margin-top: 35px;">
				<div class="col-md-12">
				
					<c:forEach items="${recruit }" var="data">
					<div class="job-new-list">
						<div class="vc-thumb">
							<img class="img-fluid rounded-circle" src="/images/asana.png">
						</div>
						<div class="vc-content">
							<h5 class="title">${data.reruitName }<span class="j-full-time">发布时间：${data.createDate }</span></h5>
							
							<ul class="vc-info-list">
							<li class="list-inline-item"><p style="color:red;font-size:20px;">${data.reruitPay }</p></li>
							<div class="skills">
							<a>招聘人数:</a><span>${data.reruitNum }&nbsp;人</span><a>联系人:</a><span>${data.reruitMan }</span><a>联系方式:</a><span>${data.reruitContactsPhone}</span>
							</div>
							</li>
							</ul>
						</div>
						<a class="btn btn-primary bn-det" href="${ctx }/api/RecruitController.do?method=queryContent&id=${data.recruitId}">申请职位</a>
					</div>
					</c:forEach>
					
				</div>
			</div>
			
		</div>
		 <!--[if !IE]>分页_End<![endif]-->
                <div class="row">
                <div class="col-sm-10">
                    <ul class="pagination cb-pagination">
                      <li><a href="${ctx }/api/RecruitController.do?method=list&pageNum=${page.pageNum ==1 ? 1 :page.pageNum-1 }&pageSize=4">&laquo;</a></li>
                      <c:forEach var="p" begin="1" end="${page.pages }">
                      <li <c:if test="${page.pageNum == p}">class="active"</c:if>><a href="${ctx }/api/RecruitController.do?method=list&pageNum=${p}&pageSize=4">${p}</a></li>
                      
                      </c:forEach>                  
                      <li><a href="${ctx }/api/RecruitController.do?method=list&pageNum=${page.pageNum ==page.pages?page.pages:page.pageNum+1 }&pageSize=4">&raquo;</a></li>
                    </ul>
                </div>
            
            </div>
            
	</section>

<%@ include file="/WEB-INF/jsp/car/foot.jsp"%>

</body>