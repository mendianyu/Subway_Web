<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>线路查询</title>
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
<form action="searchLines_back.jsp" method="get">
    <p style="text-align:center;color: black; font-family: 宋体; font-size: 20px">
        请选择要查询的线路号
        <br>
        <br>
        <select name="line" >
            <option value="1号线">1号线</option>
            <option value="2号线">2号线</option>
            <option value="8号线">3号线</option>
        </select>

        <br>
        <br>
        <input type="submit" value="查询" >
        <br>
    </p>
</form>
</div>
</body>
</html>
