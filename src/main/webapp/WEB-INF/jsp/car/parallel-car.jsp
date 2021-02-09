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
<link rel="stylesheet" href="css/bootstrap.min.css">
<!--Custom Css-->
<link rel="stylesheet" href="css/ty.css">
<link rel="stylesheet" href="css/ty-mobil.css">
<!-- CSS Implementing Plugins -->
<link rel="stylesheet" href="css/line-icons.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="normalize.css">
<link rel="stylesheet" href="${ctx }/css/sidebar.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->
</head>
<!--[if !IE]>注释规范_Begin<![endif]-->
<!--[if !IE]>注释规范_End<![endif]-->
<%@ include file="/WEB-INF/jsp/car/head.jsp"%>
    
    <img class="img-responsive" src="images/car/listing-page-header-img.jpg">

    <div class="cb-modular">
        <!--[if !IE]>分类_Begin<![endif]-->
        <div class="container-fluid" style="margin:25px 0;">
            <div class="row">
                <div class="col-sm-12">
                    <!--[if !IE]>品牌_Begin<![endif]-->
                    <ul class="nav nav-pills cb-nav-brand">
                        <li class="active">
                            <a href="#" title="全部品牌">
                                <img class="img-responsive" src="images/sign/sign-all.jpg">
                                <div class="cb-brand-name">全部品牌</div>
                            </a>
                        </li>
                        <li>
                            <a href="#" title="全部品牌">
                                <img class="img-responsive" src="images/sign/sign1.jpg">
                                <div class="cb-brand-name">路虎</div>
                            </a>
                        </li>
                        <li>
                            <a href="#" title="全部品牌">
                                <img class="img-responsive" src="images/sign/sign2.jpg">
                                <div class="cb-brand-name">大众</div>    
                            </a>
                        </li>
                        <li>
                            <a href="#" title="全部品牌">
                                <img class="img-responsive" src="images/sign/sign3.jpg">
                                <div class="cb-brand-name">mini</div>    
                            </a>
                        </li>
                        <li>
                            <a href="#" title="全部品牌">
                                <img class="img-responsive" src="images/sign/sign4.jpg">
                                <div class="cb-brand-name">丰田</div>    
                            </a>
                        </li>
                        <li>
                            <a href="#" title="全部品牌">
                                <img class="img-responsive" src="images/sign/sign5.jpg">
                                <div class="cb-brand-name">奥迪</div>    
                            </a>
                        </li>
                        <li>
                            <a href="#" title="全部品牌">
                                <img class="img-responsive" src="images/sign/sign7.jpg">
                                <div class="cb-brand-name">英菲尼迪</div>    
                            </a>
                        </li>
                        <li>
                            <a href="#" title="全部品牌">
                                <img class="img-responsive" src="images/sign/sign8.jpg">
                                <div class="cb-brand-name">宝马</div>    
                            </a>
                        </li>
                        <li>
                            <a href="#" title="全部品牌">
                                <img class="img-responsive" src="images/sign/sign9.jpg">
                                <div class="cb-brand-name">凯迪拉克</div>    
                            </a>
                        </li>
                        <li>
                            <a href="#" title="全部品牌">
                                <img class="img-responsive" src="images/sign/sign10.jpg">
                                <div class="cb-brand-name">玛莎拉蒂</div>    
                            </a>
                        </li>
                        <li>
                            <a href="#" title="全部品牌">
                                <img class="img-responsive" src="images/sign/sign11.jpg">
                                <div class="cb-brand-name">奔驰</div>    
                            </a>
                        </li>
                        <li>
                            <a href="#" title="全部品牌">
                                <img class="img-responsive" src="images/sign/sign12.jpg">
                                <div class="cb-brand-name">宾利</div>    
                            </a>
                        </li>
                        <li>
                            <a href="#" title="全部品牌">
                                <img class="img-responsive" src="images/sign/sign13.jpg">
                                <div class="cb-brand-name">雷克萨斯</div>    
                            </a>
                        </li>
                        <li>
                            <a href="#" title="全部品牌">
                                <img class="img-responsive" src="images/sign/sign14.jpg">
                                <div class="cb-brand-name">林肯</div>    
                            </a>
                        </li>
                        <li>
                            <a href="#" title="全部品牌">
                                <img class="img-responsive" src="images/sign/sign15.jpg">
                                <div class="cb-brand-name">雪佛兰</div>    
                            </a>
                        </li>
                    </ul>
                    <!--[if !IE]>价格_Begin<![endif]-->
                    <ul class="nav nav-pills cb-nav-brand">
                        <li class="active"><a href="#">全部价格</a></li>
                        <li><a href="#">6W以下</a></li>
                        <li><a href="#">6~8W</a></li>
                        <li><a href="#">8~15W</a></li>
                        <li><a href="#">15~20W</a></li>
                        <li><a href="#">20~30W</a></li>
                    </ul>
                    <!--[if !IE]>类型_Begin<![endif]-->
                    <ul class="nav nav-pills cb-nav-brand">
                        <li class="active"><a href="#">全部类型</a></li>
                        <li><a href="#">美规</a></li>
                        <li><a href="#">中东</a></li>
                        <li><a href="#">中规</a></li>
                        <li><a href="#">欧版</a></li>
                        <li><a href="#">默版</a></li>
                        <li><a href="#">加版</a></li>
                    </ul>
                </div>
            </div>
        </div>
        
        <!--[if !IE]>列表_Begin<![endif]-->
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3 col-sm-4">
                    <div class="cb-car-box">
                        <div class="cb-car-name cb-texthidden">17款中东版宝马X5 3.0T</div>
                        <div class="cb-img">
                            <a href="car-read.html"><img class="img-responsive" src="images/car/trending-car-img-3.jpg"></a>
                            <a href="car-read.html" class="cb-btn">立即查看</a>
                        </div>
                        <div class="cb-car-price">￥:<font class="cb-special-price">65.83W</font>起<br class="visible-md-block visible-sm-block"><font class="cb-proposal-price">原价￥:83.8W</font></div>
                        <div class="cb-car-info">全景天窗 氙灯 电动尾门 全时四驱 电动座椅</div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-4">
                    <div class="cb-car-box">
                        <div class="cb-car-name cb-texthidden">2017款路虎发现神行2.0THSE</div>
                        <div class="cb-img">
                            <a href="car-read.html"><img class="img-responsive" src="images/car/trending-car-img-4.jpg"></a>
                            <a href="car-read.html" class="cb-btn">立即查看</a>
                        </div>
                        <div class="cb-car-price">￥:<font class="cb-special-price">36.3W</font>起<br class="visible-md-block visible-sm-block"><font class="cb-proposal-price">原价￥:46.8W</font></div>
                        <div class="cb-car-info">七座 19轮 脚感电尾门 无钥匙进入 倒车影像 氙灯 自动头灯</div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-4">
                    <div class="cb-car-box">
                        <div class="cb-car-name cb-texthidden">17款中东版奔驰GLE400</div>
                        <div class="cb-img">
                            <a href="car-read.html"><img class="img-responsive" src="images/car/trending-car-img-5.jpg"></a>
                            <a href="car-read.html" class="cb-btn">立即查看</a>
                        </div>
                        <div class="cb-car-price">￥:<font class="cb-special-price">79.8W</font>起<br class="visible-md-block visible-sm-block"><font class="cb-proposal-price">原价￥:93.8W</font></div>
                        <div class="cb-car-info">电动折叠后视镜、胎压监测、ESP、自动泊车、全景天窗、360环影、真皮座椅</div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-4">
                    <div class="cb-car-box">
                        <div class="cb-car-name cb-texthidden">17款美规福特野马2.3T</div>
                        <div class="cb-img">
                            <a href="car-read.html"><img class="img-responsive" src="images/car/trending-car-img-7.jpg"></a>
                            <a href="car-read.html" class="cb-btn">立即查看</a>
                        </div>
                        <div class="cb-car-price">￥:<font class="cb-special-price">32.98W</font>起<br class="visible-md-block visible-sm-block"><font class="cb-proposal-price">原价￥:39.8W</font></div>
                        <div class="cb-car-info">自动防炫目后视镜、胎压监测、R18轮、LED尾灯、后座椅折叠、无钥匙进入/启动</div>
                        
                    </div>
                </div>
      
                <div class="col-md-3 col-sm-4">
                    <div class="cb-car-box">
                        <div class="cb-car-name cb-texthidden">2016款Levante3.0T</div>
                        <div class="cb-img">
                            <a href="car-read.html"><img class="img-responsive" src="images/car/trending-car-img-8.jpg"></a>
                            <a href="car-read.html" class="cb-btn">立即查看</a>
                        </div>
                        <div class="cb-car-price">￥:<font class="cb-special-price">97.3W</font>起<br class="visible-md-block visible-sm-block"><font class="cb-proposal-price">原价￥:103.8W</font></div>
                        <div class="cb-car-info">前后雷达、胎压监测、ESP、定速巡航、全景天窗、倒车影像、R19轮</div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-4">
                    <div class="cb-car-box">
                        <div class="cb-car-name cb-texthidden">17款中东版丰田陆巡4000</div>
                        <div class="cb-img">
                            <a href="car-read.html"><img class="img-responsive" src="images/car/trending-car-img-9.jpg"></a>
                            <a href="car-read.html" class="cb-btn">立即查看</a>
                        </div>
                        <div class="cb-car-price">￥:<font class="cb-special-price">59.8W</font>起<br class="visible-md-block  visible-sm-block"><font class="cb-proposal-price">原价￥86W</font></div>
                        <div class="cb-car-info">车身稳定控制系统、胎压监测、R17铁轮、冰箱、无钥匙进入/启动、织物座椅、电动座椅、中差速锁</div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-4">
                    <div class="cb-car-box">
                        <div class="cb-car-name cb-texthidden">2016款Levante3.0T</div>
                        <div class="cb-img">
                            <a href="car-read.html"><img class="img-responsive" src="images/car/trending-car-img-10.jpg"></a>
                            <a href="car-read.html" class="cb-btn">立即查看</a>
                        </div>
                        <div class="cb-car-price">￥:<font class="cb-special-price">97.3W</font>起<br class="visible-md-block visible-sm-block"><font class="cb-proposal-price">原价￥:103.8W</font></div>
                        <div class="cb-car-info">前后雷达、胎压监测、ESP、定速巡航、全景天窗、倒车影像、R19轮</div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-4">
                    <div class="cb-car-box">
                        <div class="cb-car-name cb-texthidden">17款中东版丰田陆巡4000</div>
                        <div class="cb-img">
                            <a href="car-read.html"><img class="img-responsive" src="images/car/trending-car-img-11.jpg"></a>
                            <a href="car-read.html" class="cb-btn">立即查看</a>
                        </div>
                        <div class="cb-car-price">￥:<font class="cb-special-price">59.8W</font>起<br class="visible-md-block visible-sm-block"><font class="cb-proposal-price">原价￥86W</font></div>
                        <div class="cb-car-info">车身稳定控制系统、胎压监测、R17铁轮、冰箱、无钥匙进入/启动、织物座椅、电动座椅、中差速锁</div>
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-4">
                    <div class="cb-car-box">
                        <div class="cb-car-name cb-texthidden">2016款Levante3.0T</div>
                        <div class="cb-img">
                            <a href="car-read.html"><img class="img-responsive" src="images/car/trending-car-img-12.jpg"></a>
                            <a href="car-read.html" class="cb-btn">立即查看</a>
                        </div>
                        <div class="cb-car-price">￥:<font class="cb-special-price">97.3W</font>起<br class="visible-md-block visible-sm-block"><font class="cb-proposal-price">原价￥:103.8W</font></div>
                        <div class="cb-car-info">前后雷达、胎压监测、ESP、定速巡航、全景天窗、倒车影像、R19轮</div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-4">
                    <div class="cb-car-box">
                        <div class="cb-car-name cb-texthidden">17款中东版丰田陆巡4000</div>
                        <div class="cb-img">
                            <a href="car-read.html"><img class="img-responsive" src="images/car/trending-car-img-13.jpg"></a>
                            <a href="car-read.html" class="cb-btn">立即查看</a>
                        </div>
                        <div class="cb-car-price">￥:<font class="cb-special-price">59.8W</font>起<br class="visible-md-block visible-sm-block"><font class="cb-proposal-price">原价￥86W</font></div>
                        <div class="cb-car-info">车身稳定控制系统、胎压监测、R17铁轮、冰箱、无钥匙进入/启动、织物座椅、电动座椅、中差速锁</div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-4">
                    <div class="cb-car-box">
                        <div class="cb-car-name cb-texthidden">2016款Levante3.0T</div>
                        <div class="cb-img">
                            <a href="car-read.html"><img class="img-responsive" src="images/car/trending-car-img-14.jpg"></a>
                            <a href="car-read.html" class="cb-btn">立即查看</a>
                        </div>
                        <div class="cb-car-price">￥:<font class="cb-special-price">97.3W</font>起<br class="visible-md-block visible-sm-block"><font class="cb-proposal-price">原价￥:103.8W</font></div>
                        <div class="cb-car-info">前后雷达、胎压监测、ESP、定速巡航、全景天窗、倒车影像、R19轮</div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-4">
                    <div class="cb-car-box">
                        <div class="cb-car-name cb-texthidden">17款中东版丰田陆巡4000</div>
                        <div class="cb-img">
                            <a href="car-read.html"><img class="img-responsive" src="images/car/trending-car-img-2.jpg"></a>
                            <a href="car-read.html" class="cb-btn">立即查看</a>
                        </div>
                        <div class="cb-car-price">￥:<font class="cb-special-price">59.8W</font>起<br class="visible-md-block visible-sm-block"><font class="cb-proposal-price">原价￥86W</font></div>
                        <div class="cb-car-info">车身稳定控制系统、胎压监测、R17铁轮、冰箱、无钥匙进入/启动、织物座椅、电动座椅、中差速锁</div>
                    </div>
                </div>
            </div>
            
            <!--[if !IE]>分页_End<![endif]-->
            <div class="row">
                <div class="col-sm-12"> 
                    <ul class="pagination cb-pagination">
                      <li><a href="#">&laquo;</a></li>
                      <li class="active"><a href="#">1</a></li>
                      <li><a href="#">2</a></li>
                      <li><a href="#">3</a></li>
                      <li><a href="#">4</a></li>
                      <li><a href="#">5</a></li>
                      <li><a href="#">&raquo;</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

<%@ include file="/WEB-INF/jsp/car/foot.jsp"%>

</body>