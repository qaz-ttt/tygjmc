<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
</head>
<% 
	String type=(String)request.getSession().getAttribute("type");

%>
<!--[if !IE]>注释规范_Begin<![endif]-->
<!--[if !IE]>注释规范_End<![endif]-->
<body>

  <%@ include file="/WEB-INF/jsp/car/head.jsp"%>
    <img class="img-responsive" src="${ctx }/images/aboutus-page-header-img.jpg">
   

    <div class="cb-modular">
        <div class="container-fluid">
            <!--[if !IE]>tab_Begin<![endif]-->
            <div class="row">
                <div class="col-md-12">
                    <ul id="typeTab" class="nav nav-tabs cb-tabs">
                       <c:choose>
							<c:when test="${type eq 'enterprise' || type==null}">
								<li class="active">
							</c:when>
								
							<c:otherwise>
								<li>
							</c:otherwise>
								
						</c:choose>
                        	
                        	<a href="${ctx }/api/NewsController.do?method=queryEnterprise&type=enterprise">企业新闻</a>
                        </li>
                        
                        <c:choose>
							<c:when test="${type eq 'industry'}">
								<li class="active">
							</c:when>
								
							<c:otherwise>
								<li>
							</c:otherwise>
								
						</c:choose>
                        	<a href="${ctx }/api/NewsController.do?method=queryEnterprise&type=industry"> 行业动态</a>
                        </li>
                    </ul> 
                </div>
            </div>
            <div class="tab-content">
                <!--[if !IE]>企业新闻列表_Begin<![endif]-->
                <div class="tab-pane active" id="typeTab1">
                    <div class="row">
                    <c:forEach items="${news }" var="data">
                        <div class="col-md-3 col-sm-4">
                    		<a href='${ctx }/api/NewsController.do?method=queryContent&id=${data.newId}'>
                        		<div class="cb-news-box">
                        			
                            		<div class="cb-img-box"><img class="img-responsive" src="${data.img.imgUrl}"></div>
                            		<div class="cb-news-title cb-texthidden">${data.newTitle }</div>
                            		<div class="cb-news-date cb-texthidden"><span class="glyphicon glyphicon-time"></span>${data.newReleTime }</div>
                            		
                        		</div>
                    		</a>
                		</div>	
                		</c:forEach>
                	</div>
                
                </div>                      
                
                 <!--[if !IE]>分页_End<![endif]-->
                <div class="row">
                <div class="col-sm-10">
                    <ul class="pagination cb-pagination">
                      <li><a href="${ctx}/api/NewsController.do?method=queryEnterprise&type=${type}&pageNum=${page.pageNum ==1 ? 1 :page.pageNum-1 }&pageSize=8">&laquo;</a></li>
                      <c:forEach var="p" begin="1" end="${page.pages }">
                      <li <c:if test="${page.pageNum == p}">class="active"</c:if>><a href="${ctx}/api/NewsController.do?method=queryEnterprise&type=${type}&pageNum=${p}&pageSize=8">${p}</a></li>
                      
                      </c:forEach>                  
                      <li><a href="${ctx}/api/NewsController.do?method=queryEnterprise&type=${type}&pageNum=${page.pageNum ==page.pages?page.pages:page.pageNum+1 }&pageSize=8">&raquo;</a></li>
                    </ul>
                </div>
            
            </div>
            
            </div>
        </div>
    </div>
<%@ include file="/WEB-INF/jsp/car/foot.jsp"%>

</body>