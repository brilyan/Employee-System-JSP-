<%-- 
    Document   : Ubah
    Created on : 08/03/2020, 2:18:37 PM
    Author     : Brily Branco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ubah</title>
    </head>
    <body>
        <%!
            Connection connection;
            ResultSet resultset;
            PreparedStatement prepare;
            Integer karyawanubah;
        %>
        
        <% connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
            if(request.getParameter("btnubah")!=null){
                karyawanubah=Integer.parseInt(request.getParameter("hidenama"));
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                
                prepare=connection.prepareStatement("update Karyawan set nama=?, alamat=?,jobdesk=? where id=?");
                prepare.setString(1,request.getParameter("txtnamaubah"));
                prepare.setString(2,request.getParameter("txtalamatubah"));
                prepare.setString(3,request.getParameter("txtjobdeskubah"));
                prepare.setInt(4, karyawanubah);
                prepare.executeUpdate();
                response.sendRedirect("./Karyawan.jsp");
            }catch(ClassNotFoundException c){
                out.println("Class Tidak Ditemukan "+c.getMessage());
            }catch(Exception e){
                out.println("Error "+e.getMessage());
            }
            }
            
            if(request.getParameter("idubah")!=null && request.getParameter("idubah")!=""){
             karyawanubah=Integer.parseInt(request.getParameter("idubah"));
            
            try{
                 Class.forName("com.mysql.jdbc.Driver");
                 
                 prepare=connection.prepareStatement("select * from karyawan where id=?");
                 prepare.setInt(1,karyawanubah);
                 resultset=prepare.executeQuery();
                 resultset.next();
            }catch(ClassNotFoundException c){
                out.println("Class Tidak Ditemukan "+c.getMessage());
            }catch(Exception e){
                out.println("Error "+e.getMessage());
            }
            }
            else{
                response.sendRedirect("./Krayawan.jsp");
            }
        
        %>
        <center>
        <h1>Ubah data karyawan</h1>
        
            <a href="Karyawan.jsp">Kembali</a>
            <form id="frmupdatekaryawan" action="" method="POST">
                <table border="0" cellspacing="5" cellpadding="5">
                <tbody>
                <tr>
                    <td>Nama Karyawan</td>
                    <td>
                         <input type="hidden" name="hidenama" id="hidenama" value="<%=karyawanubah %>"/>
                        <input type="text" name="txtnamaubah" id="txtnamaubah" value="<%=resultset.getString("nama") %>"/>

                    </td>
                </tr>
                
                <tr>
                    <td>Alamat Karyawan</td>
                    <td><input type="text" name="txtalamatubah" id="txtalamatubah" value="<%=resultset.getString("alamat") %>"/>
                        
                    </td>
                </tr>
                
                <tr>
                    <td>Job Description</td>
                    <td><input type="text" name="txtjobdeskubah" id="txtjobdeskubah" value="<%=resultset.getString("jobdesk") %>"/>
                        
                    </td>
                </tr>
                
                <tr>
                    <td><input type="submit" value="Ubah" name="btnubah" id="btnubah"/></td>
                </tr>
            
            
            </tbody>

            </center>
       
        </table>
            </form>
                
                                  
    </body>
</html>
