# Interfaz común para procesadores de pago
class PaymentProcessor:
    def process_payment(self, amount):
        pass

# Clase existente que implementa la interfaz
class BankPaymentProcessor(PaymentProcessor):
    def process_payment(self, amount):
        print(f"Pago procesado a través del banco por: ${amount:.2f}")

# Clase del procesador externo (incompatible con nuestra interfaz)
class ExternalPaymentGateway:
    def make_payment(self, amount):
        print(f"Pago procesado a través del gateway externo por: ${amount:.2f}")

# Clase Adapter que convierte ExternalPaymentGateway a PaymentProcessor
class PaymentAdapter(PaymentProcessor):
    def __init__(self, external_gateway):
        self.external_gateway = external_gateway

    def process_payment(self, amount):
        # Llama al método del gateway externo adaptado
        self.external_gateway.make_payment(amount)

# Clase principal para probar el Adapter
if __name__ == "__main__":
    # Uso del procesador de pagos del banco
    bank_processor = BankPaymentProcessor()
    bank_processor.process_payment(100.0)

    # Uso del procesador externo adaptado
    external_gateway = ExternalPaymentGateway()
    adapted_processor = PaymentAdapter(external_gateway)
    adapted_processor.process_payment(200.0)
