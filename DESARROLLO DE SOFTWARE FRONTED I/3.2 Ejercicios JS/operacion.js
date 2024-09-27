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
    numero = parseInt(numero);

    // Verificar si el número es múltiplo de 5
    if (numero % 5 === 0) {
        console.log("Sí, el número " + numero + " es múltiplo de 5.");
    } else {
        console.log("No, el número " + numero + " no es múltiplo de 5.");
    }

    // Cerrar la interfaz
    rl.close();
});
