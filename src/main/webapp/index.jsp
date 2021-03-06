<%@page import="top.jacktu.page.service.MainService"%>
<%@page import="javax.annotation.Resource"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<link rel="icon" type="image/x-icon" href="icons/jacktu.ico" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <meta charset="utf-8" /> -->
<title>Jacktu's Personal Page</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<!---- start-smoth-scrolling---->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	var rootpath =  "<%= this.getServletContext().getContextPath() %>";
	console.log(rootpath)
	//保存请求信息
	$.ajax({
		type : 'get',
		data : "",
		url : rootpath+"/main/saveVisitor.do",
		dataType : "text",
		success : function(data) {
			if (data == "successful") {
				console.log("保存成功!");
			} else {
				console.log("保存失败!",data);
			}
		},
		error : function() {
			console.log("错误!");
		}
	})
	//图标点击跳转
	function go_to(url) {
		window.open(url);
	}
	//页面就绪事件
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});
		//保存 留言
		$("#submitMsg").click(function() {
			console.log("进入事件");
			$.ajax({
				type : 'post',
				data : $("#form-msg").serialize(),
				url : rootpath+"/main/send_msg.do",
				dataType : "text",
				success : function(data) {
					if (data == "successful") {
						$("#aeraMsg").val("").focus();
						alert("提交成功!");
					} else {
						alert("提交失败!");
					}
				},
				error : function() {
					alert("错误!");
				}
			})
		});
	});
</script>
<!---- start-smoth-scrolling---->
<script type="application/x-javascript">
addEventListener("load", function() {
			setTimeout(hideURLbar, 0);
		}, false);
		function hideURLbar() {
			window.scrollTo(0, 1);
		}

</script>
<!----webfonts--->
<link
	href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Playball'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="css/jquery.hoverGrid.css">
<!---//webfonts--->
<!----start-top-nav-script---->
<script>
	$(function() {
		var pull = $('#pull');
		menu = $('nav ul');
		menuHeight = menu.height();
		$(pull).on('click', function(e) {
			e.preventDefault();
			menu.slideToggle();
		});
		$(window).resize(function() {
			var w = $(window).width();
			if (w > 320 && menu.is(':hidden')) {
				menu.removeAttr('style');
			}
		});
	});
</script>
<!----//End-top-nav-script---->
</head>
<body>
	<!----- start-header---->
	<div id="home" class="header">
		<div class="top-header">
			<div class="container">
				<div class="logo">
					<a href="#">Jacktu</a>
				</div>
				<!----start-top-nav---->
				<nav class="top-nav">
					<ul class="top-nav">
						<li class="active"><a href="#home" class="scroll">Home</a></li>
						<li class="page-scroll"><a href="#team" class="scroll">ABOUT ME</a></li>
						<li class="page-scroll"><a href="#work" class="scroll">BLOG</a></li>
						<li class="contatct-active" class="page-scroll"><a href="#contact" class="scroll">Contact</a></li>
						<li class="page-scroll"><a href="./download/index.jsp">Download</a></li>
					</ul>
					<a href="#" id="pull"><img src="images/nav-icon.png"
						title="menu" /></a>
				</nav>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!----- //End-header---->
	<!----banner---->
	<div class="banner text-center">
		<div class="container">
			<div class="banner-info">
				<h2>
					<p>
						<b>Welcom&nbsp;&nbsp;To&nbsp;&nbsp;Jacktu's</b>
					</p>
					<p>
						<b>Personal&nbsp;&nbsp;Page</b>
					</p>
				</h2>
				<p>The owner of the web page has an interesting soul</p>
				<label class="page-scroll"><a class="big-btn scroll"
					href="#team"><span> </span></a></label>
			</div>
		</div>
	</div>
	<!--//banner---->
	<!---team--->
	<div id="team" class="team">
		<div class="container">
			<div class="head-one text-center team-head">
				<h2>THIS IS WHAT I DO</h2>
				<span> </span>
				<p>一个自以为很厉害的普通人</p>
			</div>
			<!--个人概述-->
			<div class="team-members">
				<div class="col-md-3">
					<div class="team-member text-center">
						<img class="t-pic" src="images/t1.jpg" title="name" />
						<h3>编程开发</h3>
						<p>不敢说自己是什么大牛</p>
						<p>但至少能够混口饭吃</p>
						<ul class="t-social unstyled-list list-inline">
							<li><a class="twitter" href="#"><span> </span></a></li>
							<li><a class="dribbble" href="#"><span> </span></a></li>
							<li><a class="in" href="#"><span> </span></a></li>
							<div class="clearfix"></div>
						</ul>
					</div>
				</div>
				<div class="col-md-3">
					<div class="team-member text-center">
						<img class="t-pic" src="images/t2.jpg" title="name" />
						<h3>业余生活</h3>
						<p>习惯get下新技能</p>
						<p>另外我亚索贼溜</p>
						<ul class="t-social unstyled-list list-inline">
							<li><a class="twitter" href="#"><span> </span></a></li>
							<li><a class="dribbble" href="#"><span> </span></a></li>
							<li><a class="in" href="#"><span> </span></a></li>
							<div class="clearfix"></div>
						</ul>
					</div>
				</div>
				<div class="col-md-3">
					<div class="team-member text-center">
						<img class="t-pic" src="images/t3.jpg" title="name" />
						<h3>网络社交</h3>
						<p>有时会刷刷空间</p>
						<p>偶尔也发发朋友圈</p>
						<ul class="t-social unstyled-list list-inline">
							<li><a class="twitter" href="#"><span> </span></a></li>
							<li><a class="dribbble" href="#"><span> </span></a></li>
							<li><a class="in" href="#"><span> </span></a></li>
							<div class="clearfix"></div>
						</ul>
					</div>
				</div>
				<div class="col-md-3">
					<div class="team-member text-center">
						<img class="t-pic" src="images/t4.jpg" title="name" />
						<h3>技术博客</h3>
						<p>有时间会写写CSDN</p>
						<p>偶尔也会到GitHub瞥几眼</p>
						<ul class="t-social unstyled-list list-inline">
							<li><a class="twitter" href="#"><span> </span></a></li>
							<li><a class="dribbble" href="#"><span> </span></a></li>
							<li><a class="in" href="#"><span> </span></a></li>
							<div class="clearfix"></div>
						</ul>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<!----//team-members---->
		</div>
	</div>
	<!---//team--->
	<!---work--->
	<div id="work" class="work">
		<div id="work1" class="container">
			<div class="head-one text-center">
				<h2>下方的图片有链接</h2>
				<span> </span>
				<p>不敢说是什么很珍贵的资料,就收藏点有用的东西</p>
				<p>数数跳过的坑,偶尔还写写博客</p>
			</div>
			<!---works--->
			<!---images-hover-effects--->
			<script src="js/jquery.hoverGrid.js"></script>
			<!-- <link rel="stylesheet" type="text/css"
				href="css/jquery.hoverGrid.css"> -->
			<script type="text/javascript">
				$(document).ready(function() {
					$('#whatever').hoverGrid();
				});
			</script>
			<!---images-hover-effects--->
			<div class="tlinks">
				Collect from <a href="#" title="网站模板">网站模板</a>
			</div>
			<div class="works">
				<div id="whatever">
					<div class="col-md-4 work-grid">
						<div class="item"
							onclick="go_to('https://blog.csdn.net/weixin_42144379')">
							<img src="images/w1.jpg" title="name" />
							<div class="caption" style="display: none; cursor: pointer">
								<h2>CSDN</h2>
								<p>个人业余写的技术笔记</p>
							</div>
						</div>
					</div>
					<div class="col-md-4 work-grid">
						<div class="item" onclick="go_to('<%= this.getServletContext().getContextPath() %>/main/java.do')">
							<img src="images/w2.jpg" title="name" />
							<div class="caption" style="display: none; cursor: pointer"">
								<h2>JAVA</h2>
								<p>万金油的编程语言</p>
							</div>
						</div>
					</div>
					<div class="col-md-4 work-grid">
						<div class="item"
							onclick="go_to('https://baijiahao.baidu.com/s?id=1587487208436977475&wfr=spider&for=pc')">
							<img src="images/w3.jpg" title="name" />
							<div class="caption" style="display: none; cursor: pointer"">
								<h2>AI</h2>
								<p>以后转型的首选</p>
							</div>
						</div>
					</div>
					<div class="col-md-4 work-grid">
						<div class="item"
							onclick="go_to('https://www.oracle.com/cn/index.html')">
							<img src="images/w4.jpg" title="name" />
							<div class="caption" style="display: none; cursor: pointer"">
								<h2>DATABASE</h2>
								<p>目前就oracle玩的比较6</p>
							</div>
						</div>
					</div>
					<div class="col-md-4 work-grid">
						<div class="item"
							onclick="go_to('<%= this.getServletContext().getContextPath() %>/vue-todolist/index.html')">
							<img src="images/w5.jpg" title="name" />
							<div class="caption" style="display: none; cursor: pointer"">
								<h2>WEB</h2>
								<p>bootstrap、vue and so on 探索中</p>
							</div>
						</div>
					</div>
					<div class="col-md-4 work-grid">
						<div class="item">
							<!-- onclick="go_to('#')" -->
							<img src="images/w6.jpg" title="name" />
							<div class="caption" style="display: none; cursor: pointer"">
								<h2>OTHER</h2>
								<p>一些其他的东西</p>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!---//works--->

	<!---Contact--->
	<div id="contact" class="contact">
		<div class="container">
			<div class="head-one text-center">
				<h2>contact</h2>
				<span> </span>
			</div>
			<div class="contact-grids">
				<div class="col-md-5 contact-map">
					<p>
						<a
							href="https://www.amap.com/search?
						query=%E5%8D%97%E6%98%8C%E9%AB%98%E6%96%B0%E5%BC%80%E5%8F%91%E5%8C%BA
						&city=360100&geoobj=115.820053%7C28.599053%7C116.074112%7C28.759896&zoom=12"
							target="_blank">How to find me?&nbsp;&nbsp;&nbsp;&nbsp; <b>Click
								Here</b></a>
					</p>
					<iframe src="https://www.amap.com/"></iframe>
				</div>
				<div class="col-md-7 contact-form">
					<p>请在下方评论或者留言:</p>
					<form id="form-msg">
						<!-- Leave me a message... -->
						<textarea id="aeraMsg" name="leave_msg"></textarea>
						<input name="user_name" type="text" value="留个名呗,昵称也行:&nbsp;">
						<input id="submitMsg" type=button value="Send" />
					</form>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!---//Contact--->
	<!---footer--->
	<div class="footer">
		<div class="container">
			<div class="footer-left">
				<p>
					<span>Adress:</span>Nanchang high-tech zone, jiangxi province
				</p>
			</div>
			<div class="footer-right">
				<p>
					Copyright &copy; 2018.Jacktu All rights reserved.More information
					please <a href="#" target="_blank" title="jacktu">contact
						Jacktu</a> - This is <a href="#" title="jacktu" target="_blank">jacktu's
						page</a>
				</p>
				<script type="text/javascript">
					$(document).ready(function() {
						/*
						var defaults = {
							containerID: 'toTop', // fading element id
							containerHoverID: 'toTopHover', // fading element hover id
							scrollSpeed: 1200,
							easingType: 'linear' 
						};
						 */

						$().UItoTop({
							easingType : 'easeOutQuart'
						});
					});
				</script>
				<a href="#" id="toTop" style="display: block;"> <span
					id="toTopHover" style="opacity: 1;"> </span></a>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!---//footer--->
	<div>
		<!-- 播放音乐的组件 -->
		<!-- <audio id="bgMusic" style="display:none" 
	src="audio/西瓜JUN、叶洛洛 - 忆江南.mp3" controls autoplay="autoplay" loop="loop"></audio>  -->
	<audio src="a.mp3"  autoplay loop></audio> 
	</div>
</body>
</html>