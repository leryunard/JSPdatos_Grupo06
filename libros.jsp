<%@page contentType="text/html" pageEncoding="iso-8859-1" import="java.sql.*,net.ucanaccess.jdbc.*" %>
 <html>
 <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Actualizar, Eliminar, Crear registros.</title>
 </head>
 <body>

<H1>MANTENIMIENTO DE LIBROS</H1>
<form action="matto.jsp" method="post" name="Actualizar">
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
<br><br>
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
out.write("OK");
 
      Statement st = conexion.createStatement();
      ResultSet rs = st.executeQuery("select * from libros" );

      // Ponemos los resultados en un table de html
      out.println("<table id='table' border=\"1\"><tr><td>Num.</td><td>ISBN</td><td>Titulo</td><td colspan='2'>Accion</td></tr>");
      int i=1;
      while (rs.next())
      {

         out.println("<tr id='delete'>");
         out.println("<td>"+ i +"</td>");
         out.println("<td id ='id'>"+rs.getString("isbn")+"</td>");
         out.println("<td>"+rs.getString("titulo")+"</td>");
         out.println("<td>"+"<a>Actualizar</a>"+"</td>");
         out.println("<td><a href='javascript:getId("+i+");'>Eliminar</a></td>");
         out.println("</tr>");
         i++;
      }
      out.println("</table>");

      // cierre de la conexion
      conexion.close();
}

%>
 </body>
 <script>
 const id = document.getElementById('id').innerText;
 const eliminar = document.querySelector('.delete');
function getId(id) {
    let ISB = table.firstChild.children[id].cells[1].innerText;
    window.location.href = "http://localhost:8080/SUCARNET/delete.jsp?id="+ISB;
}
</script>
