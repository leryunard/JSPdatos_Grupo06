<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>

<%
/* Paso 1) Obtener los datos del formulario */
String ls_isbn = request.getParameter("isbn");
String ls_titulo = request.getParameter("titulo");
String ls_action = request.getParameter("Action");
String ls_edito = request.getParameter("editorial");
String ls_anio = request.getParameter("anio");
 
/* Paso 2) Inicializar variables */
String ls_result = "Base de datos actualizada...";
String ls_query = "";
ServletContext context = request.getServletContext();
String path = context.getRealPath("/data");
String filePath= path+"\\datos.mdb";
String ls_dburl = "jdbc:odbc:Driver={MicroSoft Access Driver (*.mdb)};DBQ="+filePath;
String ls_usuario = "";
String ls_password = "";
String ls_dbdriver = "sun.jdbc.odbc.JdbcOdbcDriver";
 
/* Paso 3) Crear query&nbsp; */
if (ls_action.equals("Crear")) {
ls_query = " insert into libros (isbn, titulo, edito, anio)";
ls_query += " values (";
ls_query += "'" + ls_isbn + "',";
ls_query += "'" + ls_titulo  + "',";
ls_query += "'" + ls_edito + "',";
ls_query += "'" + ls_anio + "')";
}
 
if (ls_action.equals("Eliminar")) {
ls_query = " delete from libros where isbn = ";
ls_query += "'" + ls_isbn + "'";
}
 
if (ls_action.equals("Actualizar")) {
ls_query = " update libros";
ls_query += " set titulo= " + "'" + ls_titulo + "',";
ls_query += " edito= " + "'" + ls_edito + "',";
ls_query += " anio= " + "'" + ls_anio + "'";
ls_query += " where isbn = " + "'" + ls_isbn + "'";
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
<html>

<head>
    <title>Updating a Database</title>
</head>

<body>

    La siguiente instruccion fue ejecutada:
    <br /><br />
    <%=ls_query%>
    <br /><br />

    El resultado fue:
    <br /><br />
    <%=ls_result%>
    <br /><br />

    <a href="ejercicio 7.jsp">Entre otro valor</a>
</body>

</html>