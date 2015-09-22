<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,user-scalable=no,maximum-scale=1.0" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="../static/css/sweetalert.css">
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/slides.jquery.js"></script>
<script src="../static/js/sweetalert.min.js"></script>
<script src="js/mjx.js"></script>
<script>    
    phone ="<%=request.getParameter("phone")%>";
    eventId ="<%=request.getParameter("eventId")%>";
    signid ="<%=request.getParameter("signId")%>";
    
    if (applied != true && (phone != "null" && phone != ""))
    {
	    apply ("checkapply");
    }
    //localhost:8080/event/mjx/mjx.jsp?phone=15951853773&eventId=23437130-9d7b-4530-86c9-ab627553c070&signId=4bbe3b2e-91f9-44c8-98a8-b0fe2bea2b91
    // signid = "4bbe3b2e-91f9-44c8-98a8-b0fe2bea2b91";
    // phone = "13851507032";
    // phone = "15951853773";
    // eventId = "23437130-9d7b-4530-86c9-ab627553c070";
    // if (applied != true) {
    // apply("checkapply");
    // }
    
    //invoker by app
    function getUserInfo (userAccount, sourceUID, signId)
    {
	    phone = userAccount;
	    eventId = sourceUID;
	    signid = signId;
	    if (applied != true)
	    {
		    apply ("checkapply");
	    }
    }
</script>
</head>
<body>
	<div class="mjx_i" style="display: none;">
		<p></p>
	</div>
	<div class="mjx_login" style="display: none">
		<input type="text" id="name" style="top: 40.5%" /> <input type="text" id="tel" style="top: 53%" />
		<p></p>
	</div>
	<div class="mjx_sr" style="display: none">
		<img src="images/5.png" alt="" id="boy" /> <img src="images/02.png" alt="" id="girl" /> <input type="text" placeholder="搜索心中的她" class="ss"> <img src="images/shousuo.png" alt="" id="search">
		<div class="dt" style="display: none">
			<img src="images/9-01.png" alt="">
		</div>
		<div class="hd_box">
			<div id="slides" class="visual">
				<ul class="slides_container"></ul>
				<div class="slideControl">
					<p class="slide_rBt" onclick="switch2('r')">
						<a href="#" class="next"></a>
					</p>
					<ul class="pagination"></ul>
					<p class="slide_lBt" onclick="switch2('l')">
						<a href="#" class="prev"></a>
					</p>
				</div>

			</div>
		</div>
		<p id="num"></p>
		<img src="images/PK.png" alt="" id="pk" /> <img src="images/guanzhu.png" alt="" id="gz" /> <img src="images/toupiao.png" alt="" id="post" /> <img src="images/duihua.png" alt="" id="talk" />
	</div>
	<div class="mjx_pk" style="display: none">
		<div class="tk">
			<p onclick="exit()"></p>
		</div>
		<img src="images/15.png" alt="" style="position: absolute; width: 33%; top: 2%; left: 3%" id="back"> <img src="images/08-09.png" alt="" style="width: 100%;">
	</div>
</body>
</html>