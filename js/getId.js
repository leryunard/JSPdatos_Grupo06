const id = document.getElementById('id').innerText;
const eliminar = document.querySelector('.delete');
function getId(id) {
   let ISB = table.firstChild.children[id].cells[1].innerText;
   if (confirm('Are you sure you want to delete this book?')) {
      window.location.href = "http://localhost:8080/JSPdatos_Grupo06/delete.jsp?id=" + ISB;
   }

}