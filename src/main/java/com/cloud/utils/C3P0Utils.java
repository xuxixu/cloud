package com.cloud.utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.mchange.v2.c3p0.DataSources;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class C3P0Utils {
    static org.apache.log4j.Logger logger=org.apache.log4j.Logger.getLogger(C3P0Utils.class.getName());
    private static ComboPooledDataSource dataSource = null;
    static {
        dataSource = new ComboPooledDataSource("mysql");
    }

    public static  ComboPooledDataSource getDataSource()
    {
        return dataSource;
    }

    public static Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }
}