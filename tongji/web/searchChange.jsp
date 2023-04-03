<%--
  Created by IntelliJ IDEA.
  User: mendianyu
  Date: 2023/3/15
  Time: 19:21
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title>换乘查询</title>
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
            background: url("background.jpg");
            border: 0px solid #ffffff;
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
    <form action="searchChange_back.jsp" method="get">
        <p style="text-align:center;color: black; font-family: 宋体; font-size: 20px">
            请输入起点站
            <input type="text" name="start">
            <br>
            请输入终点站
            <input type="text" name="end">
            <br>
            <input type="submit" value="查询" style="weigh: 50">
            <br>
        </p>
    </form>
</div>
</body>
</html>

