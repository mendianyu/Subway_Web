<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="Util.util" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.mysql.cj.util.StringUtils" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedHashSet" %>
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
            bottom: 0;
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
    String line = (String) request.getParameter("line");
    if (line == "")
    {
        out.print("<script language='javaScript'> alert('输入为空'); window.history.back(-1); </script>");
    } else
    {
%>
<div id="myBox">
    <table border="1" cellspacing="0">
        <tr>
            <td align="center" width=10%>线路号</td>
            <td align="center" width=90%>站点名称</td>
        </tr>
        <%
            int i = 0;
            Connection connection = null;
            try
            {
                connection = util.getConnection();
            }
            catch (ClassNotFoundException | SQLException e)
            {
                e.printStackTrace();
            }
            PreparedStatement preparedStatement = null;
            ResultSet rs = null;
            String linenumber = "";
            ArrayList<String> list = new ArrayList<>();
            try
            {
                String sql = " select * from bj_subway where line_name=? ";
                assert connection != null;
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, line);
                rs = preparedStatement.executeQuery();
                while (rs.next())
                {
                    i++;
                    linenumber = (String) rs.getObject(2);
                    String station = (String) rs.getObject(3);
                    list.add(station);
                }
                List<String> listNew = new ArrayList<String>(new LinkedHashSet<String>(list));

        %>
        <tr>
            <td align="center"><%=linenumber %>
            </td>
            <td><%=listNew%>
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
