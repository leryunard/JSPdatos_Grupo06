<%@page contentType="text/html" pageEncoding="iso-8859-1" import="java.sql.*,net.ucanaccess.jdbc.*" %>
 <html>
 <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20,500,0,200" />
 <title>Actualizar, Eliminar, Crear registros.</title>
 </head>
 <style>
body{
  background-color: rgb(18, 32, 61);
  color: #FFFF;
}
ion-icon {
  --ionicon-stroke-width: 50px;
}
 </style>

 <body>

<div class ='container pt-4'>
<h1 class='text-center'>Mantenimiento de libros</h1>
<div class='container'>
<div class='row pt-4'>
<div class='col col-md-4'>
<form action='matto.jsp' method='post' id='form'>
  <div class="mb-3">
    <label for="isb" class="form-label">ISB</label>
    <input type="text" name="isbn" class="form-control" id="isb" aria-describedby="emailHelp">
    <div id="messageIsb" class="form-text text-danger fw-bold d-flex gap-1"></div>

  </div>
  <div class="mb-3">
    <label for="titulo" class="form-label" >Title</label>
    <input type="text" name="titulo" class="form-control" id="titulo">
    <div id="messageTitle" class="form-text text-danger fw-bold"></div>
  </div>
  <div class='d-flex flex-column'>
  <div class="form-check">
    <input class="form-check-input" type="radio" name="Action" value='Actualizar' id="flexRadioDefault1">
  <label class="form-check-label" for="flexRadioDefault1">
   Update
  </label>
  </div>
  <div class="form-check">
    <input class="form-check-input" type="radio" name="Action" value='Eliminar' id="flexRadioDefault1">
  <label class="form-check-label" for="flexRadioDefault1">
   Delete
  </label>
  </div>
  <div class="mb-3 form-check">
    <input class="form-check-input" type="radio" name="Action" value='Crear' id="flexRadioDefault1" checked>
  <label class="form-check-label" for="flexRadioDefault1">
    Create
  </label>
  </div>
  </div>
  <button type="submit" class="btn btn-outline-success w-100">Send</button>
</form>
</div>
<div class='col col-md-8 border-start border-dark'>
<%!
public Connection getConnection() throws SQLException {
String driver = "sun.jdbc.odbc.JdbcOdbcDriver";
String filePath= "c:\\Tomcat8Java7\\webapps\\SUCARNET\\data\\datos.mdb";
String userName="",password="";
String fullConnectionString = "jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=" + filePath;

    Connection conn = null;
try{
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        conn = DriverManager.getConnection(fullConnectionString,userName,password);

}
 catch (Exception e) {
System.out.println("Error: " + e);
 }
    return conn;
}
%>
<%
Connection conexion = getConnection();
   if (!conexion.isClosed()){
      Statement st = conexion.createStatement();
      ResultSet rs = st.executeQuery("select * from libros" );

      // Ponemos los resultados en un table de html
      out.println("<table id='table' class='table text-white'><tr><td>Num</td><td>ISBN</td><td>Title</td><td colspan='2' class='text-center'>Accion</td></tr>");
      int i=1;
      while (rs.next())
      {

         out.println("<tr id='delete'>");
         out.println("<td>"+ i +"</td>");
         out.println("<td id ='id'>"+rs.getString("isbn")+"</td>");
         out.println("<td>"+rs.getString("titulo")+"</td>");
         out.println("<td>"+"<a disabled>Update</a>"+"</td>");
         out.println("<td><a href='javascript:getId("+i+");' class='btn btn-outline-danger btn-sm'  role='button'>Delete</a></td>");
         out.println("</tr>");
         i++;
      }
      out.println("</table>");

      // cierre de la conexion
      conexion.close();
}

%>
</div>
</div>
</div>
</div>

 </body>
 <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
 <script src='./js/getId.js'></script>


