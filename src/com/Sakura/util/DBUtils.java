package com.Sakura.util;

import com.Sakura.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DBUtils {
    //验证是否注册过，如没有注册过则注册。
    public static Connection getConnection()throws Exception{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn=DriverManager.getConnection
                (
                        "jdbc:mysql://localhost:3306/jdbctest?useUnicode=true&characterEncoding=utf-8&useSSL=false&serverTimezone = GMT",
                        "root",
                        "root"

                );
        return conn;

    }

    public static boolean addUser(String username,String password,String email) {
        PreparedStatement statement=null;
        ResultSet set=null;
        PreparedStatement ps=null;
        System.out.println(username);
        boolean result=false;
        Connection conn=null;
        try {
            conn=getConnection();
            String search="SELECT * FROM web WHERE username='"+username+"'";
            statement=conn.prepareStatement(search);
            set=statement.executeQuery();
            if(set.first()) {
                result=false;
            }
            else{
                String sql = "insert into web (username,password,email) values (?,?,?)";  //?占位符
                ps = conn.prepareStatement(sql);
                //可以使用setObject方法处理参数
                ps.setObject(1, username);
                ps.setObject(2, password);
                ps.setObject(3, email);
//			ps.execute();
                int count = ps.executeUpdate();
                System.out.println(count);
                result=true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally
        {
            try {
                set.close();
                statement.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }

        return result;


    };
    public static boolean verifyAccount(String username, String password){
        {
            boolean result=false;
            Connection conn=null;
            PreparedStatement st=null;
            ResultSet rs=null;
            try
            {
                conn=getConnection();
                String login="SELECT * FROM web WHERE username='"+username+"'and password='"+password+"'";
                st=conn.prepareStatement(login);
                rs=st.executeQuery();
                if(rs.next())
                {
                    result=true;
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
            finally
            {
                try {
                    rs.close();
                    st.close();
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }

            }
            return result;
        }

    }

    public List<User> getUser(String sql) throws Exception {
        //查询语句的执行结果为一个表格，即多个学生对象的集合，所有可以创建数组列表对象来存储
        List<User> lst = new ArrayList<User>();
        //获取连接对象
        Connection conn = getConnection();
        try {
            //连接对象conn调用createStatement()方法，创建一个执行SQL语句的对象st
            Statement st = conn.createStatement();
            //执行SQL语句的对象st调用executeQuery()方法，执行查询语句，将查询到的结果返回到一个结果集中
            ResultSet rs = st.executeQuery(sql);
            //遍历结果集对象
            while(rs.next()){
                User stu = new User();
                stu.setid(rs.getInt("id"));
                stu.setusername(rs.getString("username"));
                stu.setEmail(rs.getString("email"));
                lst.add(stu);
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }finally {
            //资源使用完之后，如果没有关闭，则需要关闭
            if (conn!=null){
                conn.close();
            }
        }
        return lst;
    }

    public boolean studentUpdate(String sql) throws Exception {

        Connection conn = getConnection();
        try {
            Statement st = conn.createStatement();
            int cnt = st.executeUpdate(sql);
            return cnt>0; //如果有记录受到影响，则表示更新操作成功
        }catch (Exception e){
            System.out.println(e.getMessage());
            return false;
        }finally {
            if (conn!=null)
                conn.close();
        }
    }

}
