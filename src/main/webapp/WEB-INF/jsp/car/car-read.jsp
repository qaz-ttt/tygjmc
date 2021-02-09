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
    	$("#car").addClass("active");
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
                      <li><a href="parallel-car.html">平行进口</a></li>
                      <li class="active">${car.carName}</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    
    <div id="cont"> 
        <div class="container">
            <div class="row">
                <!--[if !IE]>车辆图片_Begin<![endif]-->
                <div class="col-sm-7">
                    <div id="carCarousel" class="carousel slide">
                        <!-- 轮播（Carousel）项目 -->
                        <div class="carousel-inner">
                            <div class="item active">
                                <img src="${img[1].imgUrl }" alt="First slide">
                            </div>
                            <c:forEach var="modelImg" items="${img}" begin="2" varStatus="xh" >
	                            <div class="item">
	                                <img src="${modelImg.imgUrl}" alt="Second slide">
	                            </div>
                            </c:forEach>
                          
                        </div>
                        
                        <!-- 轮播（Carousel）指标 -->
                        <ol class="carousel-indicators">
                         		<li data-target="#carCarousel" data-slide-to="0" 
	                                class="active">
	                                <img src="${img[1].imgUrl}">
	                            </li>
                        	 <c:forEach var="modelImg" items="${img}" begin="2" varStatus="xh" >
	                        	 <li data-target="#carCarousel" data-slide-to="${xh.count}">
		                                <img src="${modelImg.imgUrl }">
		                            </li>
	                         </c:forEach>
                            
                        
                        </ol>
                    </div> 
                </div>
                <!--[if !IE]>车辆简介_Begin<![endif]-->
                <div class="col-sm-5">
                    <ul class="cb-car-introduce">
                        <li class="cb-car-name">${car.carName}</li>
                        <li class="cb-car-price">
                            一口价￥:<font class="cb-special-price">${car.carOldPrice}</font>W<font class="cb-proposal-price"><i>市场价￥:${car.carNowPrice}W</i></font> 
                        </li>
                        <li class="cb-car-other"><b>规格</b>：<i>${car.carType.dictValue}</i></li>
                        <li class="cb-car-other"><b>颜色</b>：<i>${car.carColor}</i></li>
                        <li class="cb-car-other"><b>保障</b>：<i>${car.carGuar}</i></li>
                        <li class="cb-car-other"><b>商家</b>：<i>${car.carSeller}</i></li>
                        <li class="cb-car-other"><b>联系电话</b>：<i>${car.phone}</i></li>
                        <li class="cb-car-other"><b>发布时间</b>：<i>${car.carReleTime}</i></li>
                        <li class="cb-car-other hidden"><a class="cb-btn" href="#">我要购车</a></li>
                    </ul>
                </div>
                <div class="col-sm-12"><div class="cb-car-driver"></div></div>
            </div>
        
            <div class="row">
                <!--[if !IE]>购车事项_Begin<![endif]-->
                <div class="col-md-9 cb-img-adapt">
                    <div class="cb-recom hidden"><font><span class="glyphicon glyphicon-cog"></span>车型配置</font></div>
                    <table class="table table-bordered table-responsive hidden">
                        <thead>
                            <tr>
                                <th colspan="2">2017款路虎发现神行HSE版（指导价46.8万）</th>
                            </tr>
                        </thead>
                        
                        <tbody>
                            <tr>
                              <td><b>长*宽*高（mm）</b></td>
                              <td>4599*1894*1724</td>
                            </tr>
                            <tr>
                              <td><b>变速箱</b></td>
                              <td>9速手自一体</td>
                            </tr>
                            <tr>
                              <td><b>发动机</b></td>
                              <td>2.0T 241马力  L4</td>
                            </tr>
                            <tr>
                              <td><b>整车质量（kg）</b></td>
                              <td>1995</td>
                            </tr>
                            <tr>
                              <td><b>工信部综合油耗（L/100km）</b></td>
                              <td>8.5</td>
                            </tr>
                            <tr>
                              <td><b>油箱容积(L)</b></td>
                              <td>70</td>
                            </tr>
                            <tr>
                              <td><b>最大马力（Ps）</b></td>
                              <td>241</td>
                            </tr>
                            <tr>
                              <td><b>最大扭矩（N.m）</b></td>
                              <td>340</td>
                            </tr>
                            <tr>
                              <td><b>燃油标号</b></td>
                              <td>95号汽油</td>
                            </tr>
                            <tr>
                              <td><b>环保标准</b></td>
                              <td>欧五</td>
                            </tr>
                            <tr>
                              <td><b>驱动模式</b></td>
                              <td>前置四驱</td>
                            </tr>
                            <tr>
                              <td><b>车辆结构</b></td>
                              <td>承载式</td>
                            </tr>
                            <tr>
                              <td><b>级别</b></td>
                              <td>中型SUV</td>
                            </tr>
                            <tr>
                              <td><b>重点配置</b></td>
                              <td>前后雷达、胎压监测、ESP、定速巡航、全景天窗、倒车影像、R19轮、无钥匙进入/启动、真皮座椅、记忆套件、七座、前座椅加热、GPS导航、氙灯、自动头灯、后视镜防炫目、感应雨刮、花粉过滤、脚感电尾</td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <!-- <img src="images/car/discovery/c-1.jpg"> -->
                    <div>${car.carContent}</div>
                
                    <div class="cb-recom"><font><span class="glyphicon glyphicon-check"></span>购车流程</font></div>
                    <ul class="cb-buy-flow">
                        <li><span>1</span>选定您中意的车型，点击"我要购车"</li>
                        <li><span>2</span>天逸购车顾问与您确认，具体购车事宜</li>
                        <li><span>3</span>确认车辆信息及提车方式，"自提"或"物流发车"，物流发车需自付物流费用</li>
                        <li><span>4</span>预约提车的时间及地点</li>
                        <li><span>5</span>4s店或门店提车，结清尾款</li>
                    </ul>
                    
                    <div class="cb-recom"><font><span class="glyphicon glyphicon-exclamation-sign"></span>注意事项</font></div>
                    <ul class="cb-buy-attention">
                        <li>1、<b>牌照办理：</b>门店有偿代办或自行办理。<br>（于户口所在地缴纳车辆购置税后再到对应所在地车管所上牌即可。）</li>
                        <li>2、<b>售后服务：</b>所购车辆是全国联保的，售后、保养、维修等服务均可到当地4S店。</li>
                        <li>3、<b>平行进口：</b>在本店购买质保险，享受全国含4s店三年六万公里（先到为准）整车质保。</li>
                    </ul>
                    
                    <div class="cb-recom"><font><span class="glyphicon glyphicon-heart"></span>温馨提示</font></div>
                    <ul class="cb-buy-attention">
                        <li>1、本店所有车型全国销售（区域限制另行标注），请放心选购。</li>
                        <li>2、本店所有车型支持车源地自提或者门店自提（其中车源地到门店物流费用自理）。</li>
                        <li>3、所有车型支持全款购车或分期按揭，具体需求可门店或来电咨询。</li>
                    </ul>                
                </div>
                
                <div class="col-md-3">
                    <div class="cb-recom"><font>| 看过的人还看</font></div>
                    <div class="row">
                        
                        <c:forEach var="modelCar" items="${sellCar}">
			         <div class="col-md-12 col-sm-4">
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
                    
                    <div class="cb-recom"><font>| 热门推荐</font></div>
                    <div class="row">
                        <c:forEach var="modelCar" items="${recommend}">
			         <div class="col-md-12 col-sm-4">
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
        </div>
    </div>
<%@ include file="/WEB-INF/jsp/car/foot.jsp"%>
</body>