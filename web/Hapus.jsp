<%-- 
    Document   : Hapus
    Created on : 08/03/2020, 1:15:33 PM
    Author     : Brily Branco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>

<%! 
    Connection connection;
    ResultSet resulset;
    PreparedStatement pripare;
    Integer idkaryawan;
%>

<% 
    if(request.getParameter("id")!=null && request.getParameter("id")!=""){
    idkaryawan=Integer.parseInt(request.getParameter("id"));
    try{
        Class.forName("com.mysql.jdbc.Driver");
        connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
        pripare=connection.prepareStatement("delete from karyawan where id=?");
        pripare.setInt(1,idkaryawan);
        pripare.executeUpdate();
        response.sendRedirect("./Karyawan.jsp");
    }catch(ClassNotFoundException e){
        out.println("Class Tidak Ditemukan "+e.getMessage());
    }catch(Exception e){
        out.println("Error "+e.getMessage());
    }
    }
%>

