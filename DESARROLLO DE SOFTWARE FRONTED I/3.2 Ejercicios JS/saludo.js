// Importar módulo para leer entrada del usuario
const readline = require('readline');

// Crear interfaz para leer desde la terminal
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Preguntar el nombre al usuario
rl.question("¿Cuál es tu nombre? ", function(nombre) {
    // Imprimir el saludo en la terminal
    console.log("Hola " + nombre + "!");
    // Cerrar la interfaz
    rl.close();
});
