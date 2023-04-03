<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title>主菜单</title>
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
            background: url("background.jpg ");
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
    <form action="#" method="get">
        <p style="text-align:center;vertical-align:middle; font-size:20px" >
            <br>
            地铁查询系统
            <br>
            <input type="button" value="线路查询" onclick="location.href='searchLines.jsp'" />
            <input type="button" value="站点查询" onclick="location.href='searchStation.jsp'" />
            <input type="button" value="换乘查询" onclick="location.href='searchChange.jsp'" /><br>
        </p>
    </form>
</div>
</body>
</html>