document.getElementById('convert').addEventListener('click', function() {
    const amount = parseFloat(document.getElementById('amount').value);
    const currency = document.getElementById('currency').value;
    let result;

    if (isNaN(amount)) {
        result = 'Por favor, ingresa una cantidad válida.';
    } else {
        switch (currency) {
            case 'dolares-a-pesos':
                result = (amount * 20); // Suponiendo 1 Dólar = 20 Pesos
                result -= result * 0.01; // Comisión del 1%
                break;
            case 'pesos-a-dolares':
                result = (amount / 20); // Suponiendo 20 Pesos = 1 Dólar
                result -= result * 0.05; // Comisión del 5%
                break;
            case 'euros-a-pesos':
                result = (amount * 22); // Suponiendo 1 Euro = 22 Pesos
                result -= result * 0.03; // Comisión del 3%
                break;
            case 'pesos-a-euros':
                result = (amount / 22); // Suponiendo 22 Pesos = 1 Euro
                result -= result * 0.06; // Comisión del 6%
                break;
            case 'dolares-a-euros':
                result = (amount * 0.9); // Suponiendo 1 Dólar = 0.9 Euros
                result -= result * 0.02; // Comisión del 2%
                break;
            case 'euros-a-dolares':
                result = (amount / 0.9); // Suponiendo 0.9 Euros = 1 Dólar
                result -= result * 0.04; // Comisión del 4%
                break;    
            default:
                result = 'Conversión no válida.';
        }
    }

    document.getElementById('result').innerText = `Resultado: ${result.toFixed(2)}`;
});
