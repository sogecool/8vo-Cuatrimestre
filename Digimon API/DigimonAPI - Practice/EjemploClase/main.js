// Obtenemos los datos de todos 
//los Digimons
function fechDigimon(id){
fetch(`https://digi-api.com/api/v1/digimon/${id}/`)
        .then(response => response.json())
        .then(json => {
          creardigimon(json);
        });
      }
     // Funcion que crea el ciclo para 
     //listar los digimones en cantidad   
function printDigimon(number) {
  for(let i=1 ;i<=number;i++){
    fechDigimon(i);
  }}

  // Pinta el Digimon enviado insertando un HTML dentro del #container
function creardigimon(digimon){
  container.innerHTML = `
  ${container.innerHTML}
  <div class="card">
  <img src="${digimon.images}"/>
  <span>Nº.${digimon.id}</span>
  <h2>${digimon.name}</h2>
  </card>
`;
}
//Ejecutamos la funcion enviando la cantidad de Digimos a pintar.
printDigimon(3);
