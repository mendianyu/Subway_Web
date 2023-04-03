package Dao;

import Bean.bean;
import Util.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class dao

{
    public void searchlines(String line)
    {

        ResultSet rs=null;
        //声明数据库字段
        String stationName="";
        Connection connection = null;
        try
        {
            connection = util.getConnection();
        } catch (ClassNotFoundException | SQLException e)
        {
            e.printStackTrace();
        }
        PreparedStatement preparedStatement = null;
        try
        {
            String sql="select 车站名 from 线路表 where 线路号=?";
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,line);
            rs = preparedStatement.executeQuery();
            while(rs.next())
            {
                stationName=rs.getString("车站名");
                System.out.println(stationName+"，");
            }
        } catch (SQLException e)
        {
            e.printStackTrace();
        } finally
        {
            util.close(preparedStatement);
            util.close(connection);
        }
    }
}
