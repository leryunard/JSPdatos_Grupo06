<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
 
<%
/* Obtengo el id de la url */
String ls_isbn = request.getParameter("id");
/* Paso 2) Inicializar variables */
String ls_result = "Base de datos actualizada...";
String ls_query = "";
String filePath= "c:\\Tomcat8Java7\\webapps\\JSPdatos_Grupo06\\data\\datos.mdb";
String ls_dburl = "jdbc:odbc:Driver={MicroSoft Access Driver (*.mdb)};DBQ="+filePath;
String ls_usuario = "";
String ls_password = "";
String ls_dbdriver = "sun.jdbc.odbc.JdbcOdbcDriver";
 
//CONSULTA
ls_query = " delete from libros where isbn = ";
ls_query += "'" + ls_isbn + "'";
/* Paso4) Conexi�n a la base de datos */
Connection l_dbconn = null;
 
try {
Class.forName(ls_dbdriver);
/*&nbsp; getConnection(URL,User,Pw) */
l_dbconn = DriverManager.getConnection(ls_dburl,ls_usuario,ls_password);
 
/*Creaci�n de SQL Statement */
Statement l_statement = l_dbconn.createStatement();
/* Ejecuci�n de SQL Statement */
l_statement.execute(ls_query);
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
html>
<html>
<head><title>Updating a Database</title></head>
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