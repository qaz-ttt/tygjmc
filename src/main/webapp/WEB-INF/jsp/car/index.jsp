
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

<!-- Favicon -->${ctx }
<link rel="shortcut icon" href="img/favicon.ico">
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
<!--[if lt IE 9]>
<script src="${ctx }/js/html5shiv.js"></script>
<script src="${ctx }/js/respond.min.js"></script>
<![endif]-->
</head>
<!--[if !IE]>注释规范_Begin<![endif]-->
<!--[if !IE]>注释规范_End<![endif]-->
<body>
<script type="text/javascript">
    $(()=>{
    	$("#index").addClass("active");
    })
</script>
    <%@ include file="/WEB-INF/jsp/car/head.jsp"%>
    
    <!--[if !IE]>轮播广告_Begin<![endif]-->
    <div id="imgCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#imgCarousel" data-slide-to="0"
                class="active"><div></div></li>
            <li data-target="#imgCarousel" data-slide-to="1"><div></div></li>
            <li data-target="#imgCarousel" data-slide-to="2"><div></div></li>
        </ol>
     
        <!-- Wrapper for slides-->
        <div class="carousel-inner" role="listbox">
        	<div class="item active">
                	<a href="#"><img alt="Responsive image" src="${lb[0].imgUrl}"></a>
           	</div>
        	<c:forEach var="modelImg" items="${lb}" begin="1">
	        	<div class="item">
	                	<a href="#"><img alt="Responsive image" src="${modelImg.imgUrl}"></a>
	           	</div>
        	</c:forEach>
            
           
            
        </div> 
        
        <!-- Controls -->
        <a class="left carousel-control" href="#imgCarousel" data-slide="prev">
            <div class="p-blockLeft">
                <span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>
            </div>
        </a> 
        <a class="right carousel-control" href="#imgCarousel" data-slide="next">
            <div class="p-blockRight">
                <span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
            </div>
        </a>
    </div>
    
    <!--[if !IE]>平行进口车_Begin<![endif]-->
    <div class="cb-import-index">
        <!--[if !IE]>全部分类_Begin<![endif]-->
        <div class="cb-left-area">
            <div class="cb-recom">
                <font>| 全部分类</font>
            </div>
            <!--[if !IE]>品牌_Begin<![endif]-->
            <div class="cb-type-area">
                <div class="cb-type-header">
                    <div class="cb-type-title">品牌</div>
                    <a class="pull-right" href="${ctx}/api/rulecar.do?method=query">更多品牌</a>
                </div>
                
                

                <div class="cb-type-body">
	                <c:forEach var="modelBrand" items="${brand}" begin="1" end="12">
			        	<div class="cb-type-box">
	                        <a href="${ctx }/api/rulecar.do?method=query&brandName=${modelBrand.brandName}">
	                            <img class="img-responsive" src="${modelBrand.img.imgUrl }">
	                            <div class="cb-brand-name cb-texthidden">${modelBrand.brandName }</div>
	                        </a>
                    	</div>
	        		</c:forEach>
                    
                   
                </div>
            </div>
            <!--[if !IE]>价格_Begin<![endif]-->
            <div class="cb-type-area">
                <div class="cb-type-header">
                    <div class="cb-type-title">价格区间</div>
                </div>
                
                <div class="cb-type-body">
                
                	<c:forEach var="modelPrice" items="${price}" begin="1" end="12">
			        	<div class="cb-type-pricerange">
                        	<a href="${ctx }/api/rulecar.do?method=query&priceRange=${modelPrice.dictValue}">${modelPrice.dictValue }</a>
                   		 </div>
	        		</c:forEach>
                
                </div>
            </div>
            <!--[if !IE]>车型_Begin<![endif]-->
            <div class="cb-type-area">
                <div class="cb-type-header">
                    <div class="cb-type-title">类型</div>
                </div>
                
                <div class="cb-type-body">
                    <c:forEach var="modelType" items="${type}" begin="1" end="12">
			        	<div class="cb-type-pricerange">
                        	<a href="${ctx }/api/rulecar.do?method=query&carType=${modelType.dictValue}">${modelType.dictValue }</a>
                   		 </div>
	        		</c:forEach>
                   
                </div>
            </div>     
        </div>
        
        <!--[if !IE]>平行进口车_Begin<![endif]-->
        <div class="cb-right-area">
            <div class="cb-recom">
                <font>| 平行进口车</font>原装体验
            </div>
            
            <div class="cb-car-body">
            	
            	<c:forEach var="modelCar" items="${car}">
			        <div class="cb-car-child">
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
    
    <!--[if !IE]>新推荐_Begin<![endif]-->
    <div class="cb-recom-index">
        <div class="cb-recom">
            <font>| 新推荐</font>为您在第一时间带来最新体验
        </div>
        <div class="cb-recom-area">
        
        	<c:forEach var="modelCar" items="${recommend}">
			        <div class="cb-recommend-box">
		                <div class="cb-car-img" >
		                    <a href="${ctx}/api/rulecar.do?method=queryById&carId=${modelCar.carId}"><img class="img-responsive" src="${modelCar.img[0].imgUrl}"></a>
		                </div>
		                <div class="cb-car-info">
		                    <div class="cb-car-name cb-texthidden">
		                        	${modelCar.carName}
		                    </div>
		                    <div class="cb-car-otherinfo">
		                       		${modelCar.carCharacteristic}
		                    </div>
		                    <div class="cb-car-price">￥:<font>${modelCar.carNowPrice }w</font>起</div>
		                    <div class="cb-btn-line"><a class="cb-btn" href="car-read.html">立即查看</a></div>
		                </div>
           		 </div>
	        	</c:forEach>
        
        </div>
    </div>
    
    <!--[if !IE]>热销_Begin<![endif]-->
    <div class="cb-recom-index">
        <div class="cb-recom">
            <font>| 热销</font>大数据告诉您市场人气车型，款款火爆
        </div>
        <div class="cb-recom-area">
        	
        	<c:forEach var="modelCar" items="${sellCar}">
			   <div class="cb-recommend-box">
	                <div class="cb-car-img" >
	                    <a href="car-read.html"><img class="img-responsive" src="${modelCar.img[0].imgUrl}"></a>
	                </div>
	                <div class="cb-car-info">
	                    <div class="cb-car-name cb-texthidden">
	                        	${modelCar.carName}
	                    </div>
	                    
	                    <div class="cb-car-otherinfo">
	                       ${modelCar.carCharacteristic}
	                    </div>
	                    <div class="cb-car-price">￥:<font>${modelCar.carNowPrice }w</font>起</div>
	                    <div class="cb-btn-line"><a class="cb-btn" href="car-read.html">立即查看</a></div>
	                </div>
            	</div>
	        </c:forEach>
        
        </div>
    </div>
    
    
    <!--[if !IE]>新闻_Begin<![endif]-->
    <div class="cb-news-index">
        <div class="cb-recom">
            <font>| 天逸动态</font> 凭借众多资深行业精英人才和经验丰富的专业队伍，秉承“诚信为本，顾客至上”的经营理念
        </div>
        <div class="container-fulid">
            <div class="row">
                <div class="col-md-6">
                    <div class="cb-hot-img">
                        <img class="img-responsive" src="${new2[0].img.imgUrl}">
                    </div>
                    
                    <div class="cb-hot-news">
                        <div class="cb-news-line">
                            <div class="cb-news-title cb-texthidden"><span class="glyphicon glyphicon-menu-right"></span><a href="${ctx }/api/NewsController.do?method=queryContent&id=${new2[0].newId}">${new2[0].newTitle }</a></div>
                            <div class="cb-news-date">2017-04-30</div>
                        </div>
                        <div class="cb-news-info">
                            	${new2[0].newContent}
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6">
                	<c:forEach var="modelNew" items="${new1}" varStatus="xh">
                		<div class="cb-newsline-box">
	                        <div class="cb-news-sort">${xh.count}</div>
	                        <div class="cb-news-line">
	                        	
	                            <div class="cb-news-title cb-texthidden"><span class="glyphicon glyphicon-menu-right"></span><a href="${ctx }/api/NewsController.do?method=queryContent&id=${modelNew.newId}">${modelNew.newTitle }</a></div>
	                            <div class="cb-news-date">${modelNew.createDate}</div>
	                        </div>
	                        <div class="cb-news-info">
	                            	${modelNew.newContent}
	                        </div>
                   		 </div>
                	</c:forEach>
                
                    
                </div>
            </div>
        </div>
    </div>
    
    <!--[if !IE]>综合_Begin<![endif]-->
    <div class="cb-comprehensive-index">
        <!--[if !IE]>关于我们_Begin<![endif]-->
        <div class="cb-comprehensive-us">
            <div class="cb-recom">
                <font>| 关于我们</font>
            </div>
            <div class="cb-us-img">
                <img class="img-responsive" src="/images/ty.jpg">
            </div>
            <div class="cb-us-index">
                天逸凯腾汽车贸易有限公司成立于2016年，坚持"以科学管理创效益，以优质服务求发展"的宗旨，实行低成本、低利润、高服务的营销策略来争取用户，占领市场，针对市场找差距，找对策，对用户实施"三满意"政策，即"质量满意、服务满意、价格满意"，以客户需求为导向，制定适应市场变化的营销方针满足不同客户群体的需求。
            </div>
        </div>
        <!--[if !IE]>平行进口车常见问题_Begin<![endif]-->
        <div class="cb-comprehensive-knowledge">
            <div class="cb-recom">
                <font>| 平行进口车常见问题</font><a href="${ctx }/api/questionMore.do" class="btn btn-default" style="float:right">更多问题</a>
            </div>
            <ul class="cb-knowledge-list">
            
            	<c:forEach var="modelQuestion" items="${question}" >
            		  <li class="cb-knowledge-question"><span class="glyphicon glyphicon-question-sign"></span><a href="${ctx}/api/questionContent.do?id=${modelQuestion.questionId}">${modelQuestion.questionTitle}</a></li>
               		 <li class="cb-knowledge-answer">
                    	${modelQuestion.questionContent}
                </li>
            	
            	
            	</c:forEach>
            
            </ul>
        </div>
    </div>
    
    <!--[if !IE]>页脚_Begin<![endif]-->
   <%@ include file="/WEB-INF/jsp/car/foot.jsp"%>
</body>