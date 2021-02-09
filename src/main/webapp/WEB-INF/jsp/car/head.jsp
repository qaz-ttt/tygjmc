<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${ctx}/css/sidebar.css">
 <!--[if !IE]>导航_Begin<![endif]-->
    <div class="header">
        <!--[if !IE]>header-bar_Begin<![endif]-->
        <div class="cb-header-tool">
            <div class="container-fluid">
                <div class="col-md-3 col-sm-3 cb-cp-logo hidden-xs">
                    <img class="img-responsive" src="/images/cp-logo.png">
                </div>
                
                <div class="col-md-3 col-md-offset-1 col-sm-4">
                    <div class="input-group hidden">
                        <input type="text" class="form-control">
                        <span class="input-group-btn"><button class="btn btn-default" type="button">搜索</button></span>
                    </div>
                </div>
                
                <div class="col-md-5 col-sm-5 hidden-xs">
                    <div class="cb-cp-tel"><i>服务热线：0731 - 82181033</i><a name="top"></a></div>
                </div>
            </div>
        </div>
        
        <!--[if !IE]>网站导航_Begin<![endif]-->
        <nav class="navbar navbar-default cb-navbar" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle cb-navbar-toggle" data-toggle="collapse"
                            data-target="#example-navbar-collapse">
                        <span class="sr-only">切换导航</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a href="#" title="#"><img class="img-responsive visible-xs-block" src="/images/cp-logo.png"></a>
                </div>
                <div class="collapse navbar-collapse cb-navbar-nav" id="example-navbar-collapse">
                    <ul class="nav navbar-nav cb-navbar-nav pull-right">
                        <li id="index"><a href="${ctx}/api/index.do"><span class="glyphicon glyphicon-play"></span>天逸名车</a></li>
                        <li id="parallel"><a href="${ctx}/api/rulecar.do?method=query"><span class="glyphicon glyphicon-play"></span>平行进口</a></li>
                        <li id="rule"><a href="${ctx}/api/rulecar.do?method=query"><span class="glyphicon glyphicon-play"></span>中规车</a></li>
                        <li id="news"><a href="${ctx}/api/NewsController.do?method=queryEnterprise"><span class="glyphicon glyphicon-play"></span>新闻中心</a></li>
                        <li id="after"><a href="${ctx}/api/after.do?method=query"><span class="glyphicon glyphicon-play"></span>售后服务</a></li>
                        <li id="about"><a href="${ctx}/api/about.do?method=query"><span class="glyphicon glyphicon-play"></span>关于我们</a></li>
                        <li id="contact"><a href="${ctx}/api/about.do?method=queryContact"><span class="glyphicon glyphicon-play"></span>联系我们</a></li>
                        <li id="recruit"><a href="${ctx}/api/RecruitController.do?method=list"><span class="glyphicon glyphicon-play"></span>招聘信息</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
<%@ include file="/WEB-INF/jsp/car/sidebar.jsp"%>
    