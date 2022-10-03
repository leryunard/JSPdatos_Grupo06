<%@page contentType="text/html" pageEncoding="iso-8859-1" import="java.sql.*,net.ucanaccess.jdbc.*" %>
 <html>
 <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Actualizar, Eliminar, Crear registros.</title>
 </head>
 <body>
   <p>
      <a href="https://www.mozilla.org/es-ES/"><H1>MANTENIMIENTO DE LIBROS</H1></a>.
      </p>
<form action="matto.jsp" method="post" name="Actualizar">
 <table>
 <tr>
 <td>ISBN<input type="text" name="isbn" id="isbn" value="" size="40"/>
</td>
  </tr>
 <tr>
 <td>Titulo<input type="text" name="titulo" id="titulo" value="" size="50"/></td>
 
 </tr>
 <tr><td> Action <input type="radio" name="Action" id="actualizar"  value="Actualizar" /> Actualizar
      <input type="radio" name="Action"  value="Eliminar" /> Eliminar
      <input type="radio" name="Action"  value="Crear" checked /> Crear
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
String filePath= "c:\\Apache\\Tomcat8Java7\\webapps\\SUCARNET\\data\\datos.mdb";
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
      out.println("<table border=\"1\"><tr><td>Num.</td><td>ISBN</td><td>Titulo</td><td>Accion</td></tr>");
      int i=1;
      while (rs.next())
      {
         String opcion = rs.getString("isbn");
         String tituloC = rs.getString("titulo");
         %>
      <tr>
         <td><%=i%></td>
         <td><%=opcion%></td>
         <td><%=tituloC%></td>
         <td> 
           
               <input type='text' name="isbn-<%=i%>" id="isbn-<%=i%>" size='40' value="<%=opcion%>" hidden/>
               <input type='text' name="titulo-<%=i%>" id="titulo-<%=i%>" size='40' value="<%=tituloC%>" hidden/>
               <input type='button' value='actualizar' onclick='validateFormOnSubmit("<%=i%>")'>
               <input type='button' value='eliminar' onclick='validateFormOnSubmit("<%=i%>")'>
         </td>
         


         
      </tr>
   
         <%
         i++;
      }
      out.println("</table>");

      // cierre de la conexion
      conexion.close();
   
}

%>
<script type="text/javascript">
   MyFunction = function(isbn){
      alert(isbn)
   }
   function validateFormOnSubmit(theForm) {
      var str = document.getElementById("isbn-"+theForm).value;
      var str2 = document.getElementById("titulo-"+theForm).value;
      document.getElementById('isbn').value = str;
      document.getElementById('titulo').value = str2;
      document.getElementById('actualizar').checked = true;
}
</script>
 </body>

