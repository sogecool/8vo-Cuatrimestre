document.addEventListener('DOMContentLoaded', function () {
  const apiUrl = 'https://fakestoreapi.com/products/';
  const btnActualizar = document.getElementById('btn-actualizar');
  const tablaProductos = document.getElementById('tabla-productos');
  function limpiarTabla() {
    console.log('Entra');
    tablaProductos.querySelector('tbody').innerHTML = '';
  }
  function actualizarTabla() {
    // Uso de los métodos de las instancias
    fetch(apiUrl)
    .then(response => {
      if (!response.ok) {
        throw new Error('Ocurrió un error al recuperar los datos.');
      }
      return response.json();
    })
    .then(data => {
      
      // Limpiar la tabla antes de agregar nuevos datos
      tablaProductos.querySelector('tbody').innerHTML = '';
      // Llenar la tabla con los datos obtenidos
      data.forEach(producto => {
        const fila = document.createElement('tr');
        fila.innerHTML = `
          <td>${producto.id}</td>
          <td>${producto.title}</td>
          <td>${producto.price}</td>
          <td>${producto.category}</td>
          <td><img src="${producto.image}" alt="${producto.title}" style="width: 100px; height: auto;"></td>
          <!-- Agrega más celdas si la API devuelve más datos -->
        `;
        tablaProductos.querySelector('tbody').appendChild(fila);
      });
    })
    .catch(error => {
      console.error('Hubo un problema con la solicitud fetch:', error);
    });
  }
  // Agregar un evento de clic al botón que llame a la función 'ejecutarScript'
  btnActualizar.addEventListener('click', limpiarTabla());
  actualizarTabla();
});
