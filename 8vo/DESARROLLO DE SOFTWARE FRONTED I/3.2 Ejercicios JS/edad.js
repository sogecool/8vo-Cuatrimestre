// Importar módulo para leer entrada del usuario
const readline = require('readline');

// Crear interfaz para leer desde la terminal
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Obtener el año actual
const anioActual = new Date().getFullYear();

// Preguntar el año de nacimiento
rl.question("¿Cuál es tu año de nacimiento? ", function(anioNacimiento) {
    // Calcular la edad
    const edad = anioActual - anioNacimiento;

    // Imprimir la edad en la consola
    console.log("Tienes " + edad + " años.");

    // Cerrar la interfaz
    rl.close();
});
