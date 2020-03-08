<%-- 
    Document   : Login
    Created on : 08/03/2020, 5:34:03 PM
    Author     : Brily Branco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%! 
            Connection connection;
            ResultSet resultset;
            PreparedStatement prepare;
        %>
        <%
            if(request.getParameter("btnlogin")!=null){
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
                    prepare=connection.prepareStatement("select * from admin where username=? and password=? ");
                    prepare.setString(1,request.getParameter("txtnamalogin"));
                    prepare.setString(2,request.getParameter("txtpassword"));
                    resultset=prepare.executeQuery();
                    if(resultset.next()){
                        response.sendRedirect("./Karyawan.jsp");
                    }
                }catch(ClassNotFoundException c){
                    out.println("Class Tidak Ditemukan "+c.getMessage());
                }catch(Exception e){
                    out.println("Error "+e.getMessage());
                }
                
            }
        %>
    <center>
        <h1>Login</h1>
        <form>
            <table border="0" cellspacing="5" cellpadding="5">
                <tbody>
                    <tr>
                        <td>Username</td>
                        <td><input type="text" name="txtnamalogin" id="txtnamalogin"/></td>
                    </tr>
                    
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="txtpassword" id="txtpassword"/></td>
                    </tr>
                    
                    <tr>
                        <td><input type="submit" name="btnlogin" id="btnlogin" value="Login"/></td>
                    </tr>
                </tbody>
                
            </table>
        </form>
    </center>
    </body>
</html>
