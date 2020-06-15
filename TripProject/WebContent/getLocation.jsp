<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.test.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
	<style>
	
        *,html,body{
            margin: 0;
            padding: 0;
        }
        #con {
            width: 50%;
            height: 50vh;
            border: 1px solid black;
            margin: 0 auto;
            align: center;
        }

        #jelly {
            position: absolute;
            margin: 0;
            left: 0;
            top: 0;
        }
    </style>
</head>

<body>
	<div id="con" onmousemove="myFunction(event)" onclick="clickFunction(event)">
        <img id="jelly" src="img/jelly.png" alt="">
        <p id="demo"></p>           
    </div>
    
    <form action="getLocationProc.jsp" id="test">
		<input type="hidden" id="x_locate" name="x_locate" value="">
		<input type="hidden" id="y_locate" name="y_locate" value="">
   	</form>    
    
    <script>
        var sjelly = document.getElementById("jelly");
        
        function myFunction(e) {
            var x = e.offsetX;
            var y = e.offsetY;
            var a = window.innerWidth * 0.5 / 100;
            var x2=Math.floor(x/a);
            var y2=Math.floor(y/5.19);
            var coor = "Coordinates : (" + x2 + "," + y2 + ")";
            document.getElementById("demo").innerHTML = coor;
            
            sjelly.style.left = x + 'px';
            sjelly.style.top = y + 'px';
        }
     
        function clickFunction(e) {  
        	var xx = e.clientX;
        	var yy = e.clientY;
        	var xx2 = Math.floor(xx/7.34);
            var yy2 = Math.floor(yy/5.19);  
            
            document.getElementById("x_locate").value = xx2+"%";           
            document.getElementById("y_locate").value = yy2+"%";            
            
            document.getElementById("test").submit();
        }
    </script>
</body>
</html>