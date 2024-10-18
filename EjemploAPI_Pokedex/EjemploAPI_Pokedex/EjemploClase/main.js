// Obtenemos los datos de todos 
//los pokemon  con esta funcion
function fechPokemon(id){
fetch(`https://pokeapi.co/api/v2/pokemon/${id}/`)
        .then(response => response.json())
        .then(json => {
          crearpokemon(json);
        });
      }
     // Funcion que crea el ciclo para 
     //listar los pokemnes en en cantidad   
function printPokemons(number) {
  for(let i=1 ;i<=number;i++){
    fechPokemon(i);
  }}

  // Pinta el pokemo enviado insertando un HTML dentro del #container
function crearpokemon(pokemon){
  container.innerHTML = `
  ${container.innerHTML}
  <div class="card">
  <img src="${pokemon.sprites.front_default}"/>
  <span>Nº.${pokemon.id}</span>
  <h2>${pokemon.name}</h2>
  </card>
`;
}
//Ejecutamos la funcion enviando la cantidad de pokemon a pintar.
printPokemons(30);
