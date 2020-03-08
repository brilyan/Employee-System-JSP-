<%-- 
    Document   : Karyawan
    Created on : 08/03/2020, 9:26:49 AM
    Author     : Brily Branco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Karyawan</title>
    </head>
    <body>
        <%!
            Connection connection;
            Statement statement;
            ResultSet resultset;
            PreparedStatement prepare;
            
            int idkaryawan;
        %>
        <% 
           try{
               Class.forName("com.mysql.jdbc.Driver");
               connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
               prepare=connection.prepareStatement("select * from karyawan");
               resultset=prepare.executeQuery();
           }catch(ClassNotFoundException e){
               out.println("Konkesi Gagal "+e.getMessage());
           }catch(Exception f){
               out.println("Error "+f.getMessage());
           }
        %>
        <h3><a href="Login.jsp">Logout</a></h3>
    <center>
        <h1>List Karyawan</h1>
        <a href="Tambahkaryawan.jsp">Tambah Karyawan</a>
        <table border="1" cellspacing="5" cellpadding="5">
            <thead>
            <tr>
                <th>ID Karyawan</th>
                <th>Nama Karyawan</th>
                <th>Alamat</th>
                <th>JobDesk</th>
                <th colspan="2">Actions</th>
            </tr>
            </thead>
            <tbody>
                <% 
                    while(resultset.next()){
                        idkaryawan=resultset.getInt("id");
                        %>
                <tr>
                    <td><%=idkaryawan %></td>
                    <td><%=resultset.getString("nama") %></td>
                    <td><%=resultset.getString("alamat") %></td>
                    <td><%=resultset.getString("jobdesk")%></td>
                    <td><a href="Ubah.jsp?idubah=<%=idkaryawan %>">Ubah</a></td>
                    <td><a href="Hapus.jsp?id=<%=idkaryawan %>" onclick="return confirm('Anda Yakin Ingin Menghapus?')">Hapus</a></td>
                </tr>
                        
                        <%
                    }
                %>
                
            </tbody>
        </table>
    </center>
    </body>
</html>
