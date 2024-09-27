// Importar módulo para leer entrada del usuario
const readline = require('readline');

// Crear interfaz para leer desde la terminal
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Preguntar el número al usuario
rl.question("Ingresa un número: ", function(numero) {
    // Convertir el valor ingresado a un número entero
    numero = parseFloat(numero);

    // Verificar si el número es mayor, menor o igual a 10
    if (numero < 10) {
        console.log("El número es menor que 10.");
    } else if (numero > 10) {
        console.log("El número es mayor que 10.");
    } else {
        console.log("El número es igual a 10.");
    }

    // Cerrar la interfaz
    rl.close();
});
