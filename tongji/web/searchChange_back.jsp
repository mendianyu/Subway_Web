<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="Util.util" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="static Util.util.getConnection" %>
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
<%
    String start = (String) request.getParameter("start");
    String end = (String) request.getParameter("end");
    if (start == "" || end == "")
    {
        out.print("<script language='javaScript'> alert('输入为空'); window.history.back(-1); </script>");
    } else

    {
%>

<table border="1" cellspacing="0" style="text-align:center;">
    <tr>
        <td align="center" width=10%>起始站</td>
        <td align="center" width=10%>终点站</td>
        <td align="center" width=10%>经停站</td>
        <td align="center" width=50%>路线</td>
    </tr>
    <%
        Connection connection = null;
        try
        {
            connection = getConnection();
        }
        catch (ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        try
        {
            String sql = " WITH RECURSIVE transfer (start_station, stop_station, stops, path) AS (" +
                    " SELECT station_name, next_station, 1, CAST(CONCAT(line_name,station_name , '->', line_name,next_station) AS CHAR(1000))" +
                    " FROM bj_subway WHERE station_name = ?" +
                    " UNION ALL " +
                    " SELECT p.start_station, e.next_station, stops + 1, CONCAT(p.path, '->', e.line_name, e.next_station)" +
                    " FROM transfer p" +
                    " JOIN bj_subway e" +
                    " ON p.stop_station = e.station_name AND (INSTR(p.path, e.next_station) = 0)" +
                    ")" +
                    " SELECT * FROM transfer WHERE stop_station = ?;";
            assert connection != null;
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, start);
            preparedStatement.setString(2, end);
            rs = preparedStatement.executeQuery();
            String a = "";
            String b = "";
            int c = 0;
            String d = "";
            int min = 100;
            while (rs.next())
            {
                if (end.equals(rs.getObject(2)))
                {
                    c = Math.toIntExact((long) rs.getObject(3));
                    if (c < min)
                    {
                        min = c;
                        a = (String) rs.getObject(1);
                        b = (String) rs.getObject(2);
                        d = (String) rs.getObject(4);
                    }
                }
            }
    %>
    <tr>
        <td align="center"><%=a %>
        </td>
        <td align="center"><%=b %>
        </td>
        <td align="center"><%=min + 1%>
        </td>
        <td align="center"><%=d %>
        </td>
    </tr>
    <%
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        finally
        {
            util.close(rs);
            util.close(preparedStatement);
            util.close(connection);
        }
    %>

</table>


<% }%>
</body>
