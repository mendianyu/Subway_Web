<%--
  Created by IntelliJ IDEA.
  User: mendianyu
  Date: 2023/3/15
  Time: 19:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>站点查询</title>
    <style>

        * {
            padding: 0;
            margin: 0;
        }

        body {
            display: flex;
            position: absolute;
            left: 0;
            right: 0;
            bottom: 300px;
            top: 0;
            margin: auto;
            border: 0px solid #ffffff;
            background: url("background.jpg");
        }

        #myBox {
            display: inline-block;
            border: 1px solid rgba(255, 255, 255, 0);
            background: rgba(255, 255, 255, 0);
            color: #000000;
            margin: auto;
        }
    </style>
</head>
<body>
<div id="myBox">
<form action="searchStation_back.jsp" method="get">
    <p style="text-align:center;color: black; font-family: 宋体; font-size: 20px">
        请输入要查询的站点名称
        <br>
        <input type="text" name="stationName">
        <br>
        <input type="submit" value="查询">
        <br>
    </p>
</form>
</div>
</body>
</html>
