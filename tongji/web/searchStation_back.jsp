<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="Util.util" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedHashSet" %>
<%@ page import="com.mysql.cj.util.StringUtils" %>
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
            bottom: 0;
            top: 0;
            margin: auto;
            background: url("background.jpg");
            border: 0px solid #a41e1e;
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
    String stationName = (String) request.getParameter("stationName");
    if (stationName == "")
    {
        out.print("<script language='javaScript'> alert('输入为空'); window.history.back(-1); </script>");
    } else
    {
%>
<div id="myBox">
    <table border="1" cellspacing="0">
        <tr>
            <td align="center" width=40%>站点名称</td>
            <td align="center" width=60%>经过该站点的线路</td>

        </tr>
        <%
            int i = 0;
            Connection connection = util.getConnection();
            PreparedStatement preparedStatement = null;
            ArrayList<String> list = new ArrayList<>();
            ResultSet rs = null;
            try
            {
                String sql = " select * from bj_subway where station_name=? ";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, stationName);
                rs = preparedStatement.executeQuery();
                while (rs.next())
                {

                    i++;
                    String line = (String) rs.getObject(2);
                    list.add(line);
                }
                List<String> listNew = new ArrayList<String>(new LinkedHashSet<String>(list));
        %>
        <tr>
            <td align="center"><%=stationName%>
            </td>
            <td align="center"><%=listNew%>
            </td>
        </tr>
        <%
                    if (i == 0)
                    {
                        out.print("<script language='javaScript'> alert('没有查询到有关信息'); window.history.back(-1); </script>");
                    }
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
            }
        %>
    </table>
</div>
</body>
</html>
