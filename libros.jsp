<%@page contentType="text/html" pageEncoding="iso-8859-1" import="java.sql.*,net.ucanaccess.jdbc.*" %>
<html>

<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>Ejercio 7-RS20002</title>
   <link href="style.css" rel="stylesheet" type="text/css">
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
</head>

<body>
<%-- Configuración de la conexion a la base de datos --%>
<%!
public Connection getConnection(String path) throws SQLException {
String driver = "sun.jdbc.odbc.JdbcOdbcDriver";
String filePath= path+"\\datos.mdb";
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
<%-- Abriendo la conexion a la base de datos --%>
<%
   ServletContext context = request.getServletContext();
   String path = context.getRealPath("/data");
   Connection conexion = getConnection(path);
%>

   <H1>MANTENIMIENTO DE LIBROS</H1>
   <form action="matto.jsp" method="post" name="Actualizar">
      <table>
         <tr>
            <td>ISBN: <input type="text" name="isbn" value=""/>
            </td>
         </tr>
         <tr>
            <td>Titulo: <input type="text" name="titulo" value="" /></td>
         </tr>
         <tr>
            <td>Editorial: 
             <%
            if (!conexion.isClosed()){
 
            Statement st = conexion.createStatement();
            ResultSet rs = st.executeQuery("select * from editorial" );
            //pongo los resultados en una lista
            out.println("<select name=\"editorial\">");
            out.println("<option>-- Seleccione --</option>");
            while (rs.next())
            {
               String val = rs.getString("nombre");
               out.println("<option value=\" "+val+" \"> "+val+"</option>");
            }
            out.println("</select>");
            }
            %>
            </td>
         </tr>
         <tr>
            <td>Anio: <input type="text" name="anio" value="" /></td>
         </tr>

         <tr>
            <td> Action <input type="radio" name="Action" value="Actualizar" /> Actualizar
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
   <%

   if (!conexion.isClosed()){
   out.println("Libros");
 
      Statement st = conexion.createStatement();
      ResultSet rs = st.executeQuery("select * from libros" );

      // Ponemos los resultados en un table de html
      out.println("<table border=\"1\"><tr><td>Num.</td><td>ISBN</td><td>Titulo</td><td>Editorial</td><td>Anio</td><td>Accion</td></tr>");
      int i=1;
      while (rs.next())
      {
         out.println("<tr>");
         out.println("<td>"+ i +"</td>");
         out.println("<td>"+rs.getString("isbn")+"</td>");
         out.println("<td>"+rs.getString("titulo")+"</td>");
         out.println("<td>"+rs.getString("edito")+"</td>");
         out.println("<td>"+rs.getString("anio")+"</td>");
         out.println("<td>"+"Actualizar<br>Eliminar"+"</td>");
         out.println("</tr>");
         i++;
      }
      out.println("</table>");

      

      // cierre de la conexion
      conexion.close();
   }
   %>
   
  
</body>