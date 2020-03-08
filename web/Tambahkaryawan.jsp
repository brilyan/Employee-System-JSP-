<%-- 
    Document   : Tambahkaryawan
    Created on : 08/03/2020, 10:48:06 AM
    Author     : Brily Branco
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.sql.*"%>
<%@page  import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tambah Karyawan</title>
    </head>
    <body>
        <%! 
            Connection connection;
            ResultSet resultset;
            PreparedStatement prepare;
        %>
        <% 
            if(request.getParameter("btnsimpan")!=null){
            try{
                Class.forName("com.mysql.jdbc.Driver");
                connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
                prepare=connection.prepareStatement("insert into karyawan(nama,alamat,jobdesk)values(?,?,?)");
                prepare.setString(1,request.getParameter("txtnama"));
                prepare.setString(2,request.getParameter("txtalamat"));
                prepare.setString(3,request.getParameter("txtjobdesk"));
                prepare.executeUpdate();
                response.sendRedirect("./Karyawan.jsp");
            }catch(ClassNotFoundException e){
                out.println("Koneksi Gagal "+e.getMessage());
            }catch(Exception f){
                out.println("Error "+f.getMessage());
            }
            }
        %>
    <center>
        <h1>Tambah Karyawan Baru</h1>
        <a href="Karyawan.jsp">Kembali</a>
        <form id="frmkaryawan" action="" method="POST">
            <table border="0" cellspacing="5" cellpadding="5">
                <tbody>
                    <tr>
                        <td>Nama Karyawan</td>
                        <td><input type="text" name="txtnama" id="txtnama"/></td>
                    </tr>
                    <tr>
                        <td>Alamat</td>
                        <td><input type="text" name="txtalamat" id="txtalamat"/></td>
                    </tr>
                    <tr>
                        <td>Job Description</td>
                        <td><input type="text" name="txtjobdesk" id="txtjobdesk"/></td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="btnsimpan" id="btnsimpan" value="Simpan"/></td>
                        <td></td>
                    </tr>
                    
                </tbody>
            </table>    
        </form>
    </center>
    </body>
</html>
