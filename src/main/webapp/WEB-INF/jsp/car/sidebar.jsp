<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="right-button">
        	<!-- id="talkIcon" -->
        		<a target="_blank" href="tencent://message/?uin=1985694928&Site=qq&Menu=yes">
        		<button class="btn iconfont icon-shezhizaixianzixun" data-text="在线咨询" style="background: rgb(255, 255, 255);"></button>
        		<button class="btn iconfont icon-weixin" data-text="关注微信" style="background: rgb(255, 255, 255);"></button>
        		<div class="qrcode">
        			<p>扫描二维码</p>
        			<p>关注公众号</p>
        			<img class="img-responsive" src="/images/cb-weChart.png" alt="">
        		</div>
        		<a href="${ctx}/api/about.do?method=ditu">
        			<button class="btn iconfont icon-ditu" data-text="到这里来" style="background: rgb(255, 255, 255);"></button>
        		</a>
				<a href="#top">
        		<button class="btn iconfont icon-huidaodingbu" data-text="回到顶部" style="background: rgb(255, 255, 255);"></button></a>
</div>