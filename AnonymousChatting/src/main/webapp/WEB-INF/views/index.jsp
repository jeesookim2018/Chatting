<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" contentType="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./resources/css/bootstrap.css">
<link rel="stylesheet" href="./resources/css/custom.css">
<title>JSP AJAX 실시간 익명 채팅 사이트</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="./resources/js/bootstrap.js"></script>

<style>
.media-body {
	color: black;
}
</style>
<title>Home</title>
<script>
$(function(){
	$('#submitBtn').on('click', function(){
		$.ajax({
			url     : "submitChat"
		  , type    : "POST"
		  , data    : {"chatname" : $("#chatname").val(), "chatcontent" : $("#chatcontent").val()}
		  , success : function(data){
			  var chatString = "";			
			  
			  chatString +=	'<div class="row"><div class="col-lg-12"><div class="media"><div class="media"><a class="pull-left" href="#">';
			  chatString +=	'<img class="media-object img-circle" src="./resources/images/camera.png" style="width: 50px; height: 50px;"></a>';
			  chatString +=	'<div class="media-body">';
				  
			  chatString += '<h4 class="media-heading" id="chatnameRes">' + data.chatname;
			  chatString += '<span class="small pull-right" id="chattimeRes">' + data.chattime + '</span></h4>';
			  chatString += '<p id="chatcontentRes">' + data.chatcontent +'</p></div></div></div></div><hr>';
			 $("#chattingwidget").append(chatString);
							
		  } 
		});
	});
	
});
</script>
</head>

<body>
	<div class="container">
		<div class="container bootstrap snippet">
			<div class="row">
				<div class="col-xs-12">
					<div class="portlet portlet-default">
						<div class="portlet-heading">
							<div class="portlet-title">
								<h4>
									<i class="fa fa-circle text-green"></i>실시간 채팅방
								</h4>
								<span id="dataCheck"></span>
							</div>
							<div class="clearfix"></div>
							<div id="chat" class="panel-collapse collapse in">
								<div id="chattingwidget" class="portlet-body chat-widget"
									style="overflow-y: auto; width: auto; height: 300px;">
									<div class="row">
										<div class="col-lg-12">
											<p class="text-center text-muted small">2018년 8월 31</p>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-12">
											<div class="media">
												<a class="pull-left" href="#"> <img
													class="media-object img-circle"
													src="./resources/images/camera.png"
													style="width: 50px; height: 50px;">
												</a>
												<div class="media-body">
													<h4 class="media-heading">
														홍길동 <span class="small pull-right">오전 12:23</span>
													</h4>
													<p>안녕하세요. 홍길동입니다.</p>
												</div>
											</div>
										</div>
									</div>
				
									<hr>

									<div class="row">
										<div class="col-lg-12">
											<div class="media">
												<a class="pull-left" href="#"> <img
													class="media-object img-circle"
													src="./resources/images/camera.png"
													style="width: 50px; height: 50px;">
												</a>
												<div class="media-body">
													<h4 class="media-heading">
														이순신 <span class="small pull-right">오전 12:23</span>
													</h4>
													<p>안녕하세요. 반갑습니다.</p>
												</div>
											</div>
										</div>
									</div>
									
									<hr>
									
									<div class="row">
										<div class="col-lg-12">
											<div class="media">
												<a class="pull-left" href="#"> <img
													class="media-object img-circle"
													src="./resources/images/camera.png"
													style="width: 50px; height: 50px;">
												</a>
												<div class="media-body" id="chatting">
													<h4 class="media-heading" id="chatnameRes">
														 <span class="small pull-right" id="chattimeRes"></span>
													</h4>
													<p id="chatcontentRes"></p>
												</div>
											</div>
										</div>
									</div>
									
									<hr>
									
								</div>
								
								
								
								<form action="submitChat" method="POST">
								<div class="portlet-footer">
									<div class="row">
										<div class="form-group col-xs-4">
											<input style="height: 40px;" type="text" id="chatname" 
												class="form-control" placeholder="이름" maxlength="20">
										</div>
									</div>

									<div class="row" style="height: 90px;">
										<div class="form-group col-xs-10">
											<textarea style="height: 80px;" id="chatcontent" 
												class="form-control" placeholder="메시지를 입력하세요."
												maxlength="100">
											</textarea>
										</div>
										<div class="form-group col-xs-2">
											<input type="button" id="submitBtn" class="btn btn-default pull-right" value="전송">
											<div class="clearfix"></div>
										</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>
