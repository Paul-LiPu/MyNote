<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Simple Sidebar - Start Bootstrap Template</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/simple-sidebar.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<!-- Sidebar -->
	<div id="sidebar-wrapper">
		<ul class="sidebar-nav">
			<li class="sidebar-brand"><a href="#"> Sidebar 1 </a>
			</li>
			<li><a class="menu-toggle">Dashboard</a>
			</li>
			<li><a href="#">Shortcuts</a>
			</li>
			<li><a href="#">Overview</a>
			</li>
			<li><a href="#">Events</a>
			</li>
			<li><a href="#">About</a>
			</li>
			<li><a href="#">Services</a>
			</li>
			<li><a href="#">Contact</a>
			</li>
		</ul>
	</div>
	<!-- /#sidebar-wrapper -->

	<!-- Sidebar -->
	<div id="sidebar-wrapper2">
		<ul class="sidebar-nav">
			<li class="sidebar-brand"><a href="#"> Sidebar 2 </a>
			</li>
			<li><a class="menu-toggle3">Dashboard2</a>
			</li>
			<li><a href="#">Shortcuts2</a>
			</li>
			<li><a href="#">Overview2</a>
			</li>
			<li><a href="#">Events2</a>
			</li>
			<li><a href="#">About2</a>
			</li>
			<li><a href="#">Services2</a>
			</li>
			<li><a href="#">Contact2</a>
			</li>
		</ul>
	</div>
	<!-- /#sidebar-wrapper -->


	<!-- Page Content -->
	<div id="wrapper">
		<ul id="myTab" class="nav nav-tabs">
			<li class="active"><a href="#home" data-toggle="tab">
					W3Cschool Home </a>
			</li>
			<li><a href="#ios" data-toggle="tab">iOS</a></li>
			<li class="dropdown"><a href="#" id="myTabDrop1"
				class="dropdown-toggle" data-toggle="dropdown">Java <b
					class="caret"></b> </a>
				<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
					<li><a href="#jmeter" tabindex="-1" data-toggle="tab">jmeter</a>
					</li>
					<li><a href="#ejb" tabindex="-1" data-toggle="tab">ejb</a></li>
				</ul>
			</li>
		</ul>
		<!-- 
<div id="page-content-wrapper" class="tab-content">
   <div class="tab-pane fade in active" id="home">
      <p>W3Cschoool菜鸟教程是一个提供最新的web技术站点，本站免费提供了建站相关的技术文档，帮助广大web技术爱好者快速入门并建立自己的网站。菜鸟先飞早入行——学的不仅是技术，更是梦想。</p>
   </div>
   <div class="tab-pane fade" id="ios">
      <p>iOS 是一个由苹果公司开发和发布的手机操作系统。最初是于 2007 年首次发布 iPhone、iPod Touch 和 Apple 
      TV。iOS 派生自 OS X，它们共享 Darwin 基础。OS X 操作系统是用在苹果电脑上，iOS 是苹果的移动版本。</p>
   </div>
   <div class="tab-pane fade" id="jmeter">
      <p>jMeter 是一款开源的测试软件。它是 100% 纯 Java 应用程序，用于负载和性能测试。</p>
   </div>
   <div class="tab-pane fade" id="ejb">
      <p>Enterprise Java Beans（EJB）是一个创建高度可扩展性和强大企业级应用程序的开发架构，部署在兼容应用程序服务器（比如 JBOSS、Web Logic 等）的 J2EE 上。
      </p>
   </div>
</div>
        <!-- /#page-content-wrapper -->
		-->
	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Menu Toggle Script -->
	<script>
		$(".menu-toggle").each(function() {
			$(this).click(function(e) {
				e.preventDefault();
				$("#wrapper").toggleClass("toggled");
			});
		});

		$(".menu-toggle2").each(function() {
			$(this).click(function(e) {
				e.preventDefault();
				$("#wrapper").toggleClass("toggled2");
			});
		});

		$(".menu-toggle3").each(function() {
			$(this).click(function(e) {
				e.preventDefault();
				$("#wrapper").toggleClass("toggled");
				$("#wrapper").toggleClass("toggled2");
			});
		});
	</script>

</body>

</html>
