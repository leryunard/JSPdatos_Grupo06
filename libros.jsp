<%@page contentType="text/html" pageEncoding="iso-8859-1" import="java.sql.*,net.ucanaccess.jdbc.*" %>
 <html>
 <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
 <title>Actualizar, Eliminar, Crear registros.</title>
 </head>
 <body>

<div class ='container pt-4'>
<h1 class='text-center'>Mantenimiento de libros</h1>
<div class='container border'>
<div class='row pt-4'>
<div class='col-5'>
<form action='matto.jsp' method='post'>
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">ISB</label>
    <input type="text" name="isbn" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label" >Titulo</label>
    <input type="text" name="titulo" class="form-control" id="exampleInputPassword1">
  </div>
  <div class='d-flex justify-content-center gap-3'>
  <div class="mb-3 form-check">
    <input class="form-check-input" type="radio" name="Action" value='Actualizar' id="flexRadioDefault1">
  <label class="form-check-label" for="flexRadioDefault1">
   Actualizar
  </label>
  </div>
  <div class="mb-3 form-check">
    <input class="form-check-input" type="radio" name="Action" value='Eliminar' id="flexRadioDefault1">
  <label class="form-check-label" for="flexRadioDefault1">
   Eliminar
  </label>
  </div>
  <div class="mb-3 form-check">
    <input class="form-check-input" type="radio" name="Action" value='Crear' id="flexRadioDefault1">
  <label class="form-check-label" for="flexRadioDefault1">
    Crear
  </label>
  </div>
  </div>
  <button type="submit" class="btn btn-dark w-100">Aceptar</button>
</form>
</div>
<div class='col-7 border-start border-dark'>
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
      out.println("<table id='table' class='table'><tr><td>Num.</td><td>ISBN</td><td>Titulo</td><td colspan='2'>Accion</td></tr>");
      int i=1;
      while (rs.next())
      {

         out.println("<tr id='delete'>");
         out.println("<td>"+ i +"</td>");
         out.println("<td id ='id'>"+rs.getString("isbn")+"</td>");
         out.println("<td>"+rs.getString("titulo")+"</td>");
         out.println("<td>"+"<a>Actualizar</a>"+"</td>");
         out.println("<td><a href='javascript:getId("+i+");' class='btn btn-danger btn-sm'  role='button'>Delete</a></td>");
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

<!--<form action="matto.jsp" method="post" name="Actualizar">
 <table>
 <tr>
 <td>ISBN<input type="text" name="isbn" value="" size="40"/>
</td>
  </tr>
 <tr>
 <td>T�tulo<input type="text" name="titulo" value="" size="50"/></td>
 
 </tr>
 <tr><td> Action <input type="radio" name="Action" value="Actualizar" /> Actualizar
 <input type="radio" name="Action" value="Eliminar" /> Eliminar
 <input type="radio" name="Action" value="Crear" checked /> Crear
  </td>
 <td><input type="SUBMIT" value="ACEPTAR" />
</td>
 </tr>
 </form>
 </tr>
 </table>
 </form>
<br><br>-->

 </body>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>

 <script>
 const id = document.getElementById('id').innerText;
 const eliminar = document.querySelector('.delete');
function getId(id) {
    let ISB = table.firstChild.children[id].cells[1].innerText;
    window.location.href = "http://localhost:8080/JSPdatos_Grupo06/delete.jsp?id="+ISB;
}
</script>
