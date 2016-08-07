<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>军民融合综合评估中心</title>
<link rel="stylesheet" type="text/css" href="css/public.css" />
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
<script type="text/javascript">

function resize(element, maxWidth, maxHeight){ 
	if(element.width > maxWidth || element.height > maxHeight){ 
		if(element.width / element.height > maxWidth / maxHeight){ 
			element.height = maxHeight;
		}
		else{ 
			element.width = maxWidth;  
		} 
	} 
};

$(function(){
	/*jQuery处理函数*/
	
	//幻灯效果
    var isRun=true;
    var slideNum=$('#slideWrap ul.slide>li').length;//页码数量以及幻灯数量
    var slideNumHtml='<ul class="num">';
    for(var i=1;i<=slideNum;i++){
		slideNumHtml+='<li>'+i+'</li>';
    }
    slideNumHtml+='</ul>';
    $('#slideWrap ul.slide').after(slideNumHtml);
    function showSlide(num){
        if(num==$('#slideWrap ul.num>li').index($('#slideWrap ul.num>li.current'))){
            return null;
        }
        $('#slideWrap ul.slide>li')
            .finish()
            .filter(':visible')
            .fadeOut()
            .css({'z-index':0})
            .end()
            .eq(num)
            .fadeIn()
            .css({'z-index':1});
        $('#slideWrap ul.num>li').filter('.current').removeClass('current').end().eq(num).addClass('current');
    }
    showSlide(0);
    $('#slideWrap ul.num>li').on('mouseenter.trigger',function(){
        showSlide($('#slideWrap ul.num>li').index(this));
    });
    $('#slideWrap ul.slide,#slideWrap ul.num>li').hover(function(){
        isRun=false;  
    },function(){
        isRun=true;
    });
    setInterval(function(){
        if(isRun) {
            if($('#slideWrap ul.num>li.current').next().length==0) {
                $('#slideWrap ul.num>li').eq(0).triggerHandler('mouseenter.trigger');
            }else{
                $('#slideWrap ul.num>li.current').next().triggerHandler('mouseenter.trigger');
            }
        }
    },5000);
    //幻灯效果结束
});
</script>
</head>
<!--头部结束-->

<iframe id="head" src="head.html" frameborder="false" scrolling="no" style="border:none;" width="100%" height="223px" allowtransparency="true"></iframe>
<body>
	<div class="navImg">	<!--导航菜单下的图片-->
		<div class="w1000">
			<img src="images/banner/index.jpg"/>
		</div>
	</div>
	<div class="mainbody w1000"> <!--主页内容部分-->
		<!--正文左侧-->
		<div class="left"> 
			<ul class="leftNav">  <!--左侧导航菜单-->
				<li>
					<a id="left_1" href="#" target="_blank">
						<span></span>区域试点申请
					</a>
				</li>
				<li>
					<a id="left_2" href="#" target="_blank">
						<span></span>企业试点申请
					</a>
				</li>
				<li>
					<a id="left_3" href="#" target="_blank">
						<span></span>联盟加入申请
					</a>
				</li>
				<li>
					<a id="left_4" href="#" target="_blank">
						<span></span>区域评估申请
					</a>
				</li>
				<li>
					<a id="left_5" href="#" target="_blank">
						<span></span>企业评估申请
					</a>
				</li>
				<li>
					<a id="left_6" href="#" target="_blank">
						<span></span>项目评估申请
					</a>
				</li>
				<li>
					<a id="left_7" href="#" target="_blank">
						<span></span>技术评估申请
					</a>
				</li>
			</ul>
			<div id="QRcode">	<!--二维码-->
				<a><img src="images/app.png"/></a>
			</div>
		</div>
		
		<!--中部导航栏-->
		<div class="center"> 
			<div class="rzpx">
				<a class="title" href="#"><span></span>认证培训</a>
			</div>
			<div class="rzpx_list_1">
				<a id="rzpx_1" href="#"><span></span>申请开课</a>
				<a id="rzpx_2" href="#"><span></span>课程咨询</a>
				<a id="rzpx_3" href="#"><span></span>课程管理</a>
				<a id="rzpx_4" href="#"><span></span>专家简介</a>
				<a id="rzpx_5" href="#"><span></span>课程报名</a>
				<a id="rzpx_6" href="#"><span></span>人才招募</a>
			</div>

			<div class="rzpx_list_2">
				<ul>
					<li><a href="#" target="_blank" id="rzpx_7">讨论区</a></li>
					<li><a href="#" target="_blank" id="rzpx_8">资质认证</a></li>
					<li><a href="#" target="_blank" id="rzpx_9">用户认证</a></li>
				</ul>
			</div>
			
			<div class="rzpx_list_3">
				<ul>
					<#list aList as stu>
						<li><a href="${stu.href}" target="_blank">${stu.content}</a></li>
					</#list> 
					<!--<li><a href="#" target="_blank">同时其它地方使用可作为独占一行</a></li>
					<li><a href="#" target="_blank">同时其它地方使用可作为独占一行</a></li>
					<li><a href="#" target="_blank">同时其它地方使用可作为独占一行</a></li>
					<li><a href="#" target="_blank">同时其它地方使用可作为独占一行</a></li>
					<li><a href="#" target="_blank">同时其它地方使用可作为独占一行</a></li>-->
				</ul>
			</div>
			
			<div class="info">
				<a class="title" href="#"><span></span>信息公开</a>
			</div>
			<div class="info_list">
				<ul>
					<li><a href="#" target="_blank" id="info_1">联盟信息</a></li>
					<li><a href="#" target="_blank" id="info_2">认证信息</a></li>
					<li><a href="#" target="_blank" id="info_3">评估信息</a></li>
				</ul>
			</div>
		</div>
		
		<!--右侧信息栏-->
		<!--右侧信息栏-->
		<div class="right">	
			<div class="news">
				<a class="title" href="#"><span></span>新闻资讯</a>
				<a class="more" href="#">更多>></a>
			</div>
			<div class="news_list">
				<div id="slideWrap"> <!--滚动图片-->
					<ul class="slide">
						<#list list_slide_news as stu>
						<li>
							<div class="news_img">
								<a href="${stu.href}" target="_blank"><img src="${stu.src}" onload="resize(this, 260, 160);"/></a>
							</div>
							<div class="news_content">
								<a class="title" href="${stu.href}" target="_blank">${stu.title}</a>
								</br>
								<a class="content" href="${stu.href}" target="_blank">${stu.content}</a>
							</div>
						</li>
						</#list>
						<!--
						<li>
							<div class="news_img">
								<a><img src="images/img1.jpg" onload="resize(this, 260, 160);"/></a>
							</div>
							<div class="news_content">
								<a class="title" href="#" target="_blank">标题1...</a>
								</br>
								<a class="content" href="#" target="_blank">内容1...</a>
							</div>
						</li>
						<li>
							<div class="news_img">
								<a><img src="images/img2.jpg" onload="resize(this, 260, 160);"/></a>
							</div>
							<div class="news_content">
								<a class="title" href="#" target="_blank">标题2...</a>
								</br>
								<a class="content" href="#" target="_blank">内容2...</a>
							</div>
						</li>
						<li>
							<div class="news_img">
								<a><img src="images/img3.jpg" onload="resize(this, 260, 160);"/></a>
							</div>
							<div class="news_content">
								<a class="title" href="#" target="_blank">标题3...</a>
								</br>
								<a class="content" href="#" target="_blank">内容3...</a>
							</div>
						</li>
						<li>
							<div class="news_img">
								<a><img src="images/img4.jpg" onload="resize(this, 260, 160);"/></a>
							</div>
							<div class="news_content">
								<a class="title" href="#" target="_blank">标题4</a>
								</br>
								<a class="content" href="#" target="_blank">内容4...</a>
							<div>
						</li>
						<li>
							<div class="news_img">
								<a><img src="images/img5.jpg" onload="resize(this, 260, 160);"/></a>
							</div>
							<div class="news_content">
								<a class="title" href="#" target="_blank">标题5</a>
								</br>
								<a class="content" href="#" target="_blank">内容5...</a>
							</div>
						</li>-->
					</ul>
				</div>
			</div>
			
			<div class="tech">
				<a class="title" href="#"><span></span>技术前沿</a>
				<a class="more" href="#">更多>></a>
			</div>
			<div class="tech_list">
				<div class="imgNews">	<!--图片新闻-->
					<a href="#" target="_blank"><img src="images/img6.jpg" onload="resize(this, 150, 150);"></a>
				</div>
				<div class="topNews">	<!--头条新闻-->
					<ul>
						<#list list_tech as stu>
						<li>
							<a href="${stu.href}" target="_blank">${stu.title}</a>
							<span>${stu.time}</span>
						</li>
						</#list>
						<!--
						<li>
							<a href="g/news/1470285958146" target="_blank">习近平向2名晋升为上将军官颁发命令...</a>
							<span>07-30</span>
						</li>
						<li>
							<a href="#" target="_blank">习近平向2名晋升为上将军官颁发命令...</a>
							<span>07-30</span>
						</li>
						<li>
							<a href="#" target="_blank">习近平向2名晋升为上将军官颁发命令...</a>
							<span>07-30</span>
						</li>
						<li>
							<a href="#" target="_blank">习近平向2名晋升为上将军官颁发命令...</a>
							<span>07-30</span>
						</li>
						<li>
							<a href="#" target="_blank">习近平向2名晋升为上将军官颁发命令...</a>
							<span>07-30</span>
						</li>
						<li>
							<a href="#" target="_blank">习近平向2名晋升为上将军官颁发命令...</a>
							<span>07-30</span>
						</li>-->
					</ul>
				</div>
			</div>
			
			<div class="policy">
				<a class="title" href="#"><span></span>政策解读</a>
				<a class="more" href="#">更多>></a>
			</div>
			<div class="policy_list">
				<div class="imgNews">	<!--图片新闻-->
					<a href="#" target="_blank"><img src="images/icon111.jpg" height="82" width="112"></a>
				</div>
				<div class="topNews">	<!--头条新闻-->
					<ul>
						<#list list_policy_1 as stu>
						<li>
							<a href="${stu.href}" target="_blank">${stu.title}</a>
							<span>${stu.time}</span>
						</li>
						</#list>
						<!--
						<li>
							<a href="#" target="_blank">习近平向2名晋升为上将军官颁发命令...</a>
							<span>07-30</span>
						</li>
						<li>
							<a href="#" target="_blank">习近平向2名晋升为上将军官颁发命令...</a>
							<span>07-30</span>
						</li>
						<li>
							<a href="#" target="_blank">习近平向2名晋升为上将军官颁发命令...</a>
							<span>07-30</span>
						</li>-->
					</ul>
				</div>
			</div>

			<div style='border-bottom:1px solid #dbdbdb'></div> <!--添加一条横线-->
			
			<div class="policy_list">
				<div class="imgNews">	<!--图片新闻-->
					<a href="#" target="_blank"><img src="images/icon111.jpg" height="82" width="112"></a>
				</div>
				<div class="topNews">	<!--头条新闻-->
					<ul>
						<#list list_policy_2 as stu>
						<li>
							<a href="${stu.href}" target="_blank">${stu.title}</a>
							<span>${stu.time}</span>
						</li>
						</#list>
						<!--
						<li>
							<a href="#" target="_blank">习近平向2名晋升为上将军官颁发命令...</a>
							<span>07-30</span>
						</li>
						<li>
							<a href="#" target="_blank">习近平向2名晋升为上将军官颁发命令...</a>
							<span>07-30</span>
						</li>
						<li>
							<a href="#" target="_blank">习近平向2名晋升为上将军官颁发命令...</a>
							<span>07-30</span>
						</li>-->
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div style="clear:both;"></div>
</body>
</html>
<iframe id="footer" src="footer.html" frameborder="false" scrolling="off" style="border:none;" width="100%" height="150px" allowtransparency="true"></iframe>


