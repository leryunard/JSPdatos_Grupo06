
<%@page contentType="text/html" pageEncoding="iso-8859-1" import="java.sql.*,net.ucanaccess.jdbc.*" %>
<%@page import = "java.sql.*" %>
 
<%
/* Paso 1) Obtener los datos del formulario */
String ls_isbn = request.getParameter("isbn");
String ls_titulo = request.getParameter("titulo");
String ls_autor = request.getParameter("autor");
String ls_action = request.getParameter("Action");
 
/* Paso 2) Inicializar variables */
String ls_result = "Busqueda Realizada...";
String ls_query = "";
ServletContext context = request.getServletContext();
String path = context.getRealPath("/data");
String filePath= path+"\\datos.mdb";
String ls_dburl = "jdbc:odbc:Driver={MicroSoft Access Driver (*.mdb)};DBQ="+filePath;
String ls_usuario = "";
String ls_password = "";
String ls_dbdriver = "sun.jdbc.odbc.JdbcOdbcDriver";
 
 


/*metodo que selecciona de la base de datos el libro a buscar segun el tiulo o autor */
if (ls_action.equals("Buscar")) {
    ls_query = " select * from libros where titulo = ";
    ls_query += "'" + ls_titulo + "'";
    ls_query += " OR autor = ";
    ls_query += "'" + ls_autor + "'";
    }
 
/* Paso4) Conexi�n a la base de datos */
Connection l_dbconn = null;
 
try {
Class.forName(ls_dbdriver);
/*&nbsp; getConnection(URL,User,Pw) */
l_dbconn = DriverManager.getConnection(ls_dburl,ls_usuario,ls_password);
 
/*Creaci�n de SQL Statement */
Statement l_statement = l_dbconn.createStatement();
/* Ejecuci�n de SQL Statement */
ResultSet rs=l_statement.executeQuery(ls_query);
  // Ponemos los resultados en un table de html
     out.println("<h1>Resultados de la Busqueda</h1>");
      out.println("<table border=\"3\"><tr><td>Num.</td><td>ISBN</td><td>Titulo</td>><td>Autor</td></tr>");
      int i=1;
      while (rs.next())
      {
         out.println("<tr>");
         out.println("<td>"+ i +"</td>");
         out.println("<td>"+rs.getString("isbn")+"</td>");
         out.println("<td>"+rs.getString("titulo")+"</td>");
         out.println("<td>"+rs.getString("autor")+"</td>");
         out.println("</tr>");
         i++;
      }
      out.println("</table>");
} catch (ClassNotFoundException e) {
ls_result = " Error creando el driver!";
ls_result += " <br/>" + e.toString();
} catch (SQLException e) {
ls_result = " Error procesando el SQL!";
ls_result += " <br/>" + e.toString();
} finally {
/* Cerramos */
try {
if (l_dbconn != null) {
l_dbconn.close();
}
} catch (SQLException e) {
ls_result = "Error al cerrar la conexi�n.";
ls_result += " <br/>" + e.toString();
}
}
%>
<html>
<head><title>Updating a Database</title>
<link href="estilo.css" rel="stylesheet" type="text/css">
</head>
<body>
La siguiente instrucci�n fue ejecutada:
<br/><br/>
<%=ls_query%>
<br/><br/>
El resultado fue:
<br/><br/>
<%=ls_result%>
<br/><br/>
<a href="libros.jsp">Entre otro valor</a>

</body>
</html>