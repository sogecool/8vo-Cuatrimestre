// Importar módulo para leer entrada del usuario
const readline = require('readline');

// Crear interfaz para leer desde la terminal
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Preguntar el peso del usuario
rl.question("¿Cuál es tu peso en kg? ", function(peso) {
    // Preguntar la altura del usuario
    rl.question("¿Cuál es tu altura en metros? ", function(altura) {
        // Calcular el BMI
        const bmi = peso / (altura * altura);

        // Imprimir el BMI en la consola
        console.log("Tu BMI es " + bmi);

        // Cerrar la interfaz
        rl.close();
    });
});
