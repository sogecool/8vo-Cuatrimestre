from abc import ABC, abstractmethod

# Clase Producto Abstracta
class Salon(ABC):
    @abstractmethod
    def configuracion(self):
        pass

# Clases Producto Concretas
class SalonBodas(Salon):
    def configuracion(self):
        return "Salón de Bodas: Incluye decoraciones especiales."

class SalonConferencias(Salon):
    def configuracion(self):
        return "Salón de Conferencias: Equipado con TV gigantes."

class SalonBaile(Salon):
    def configuracion(self):
        return "Salón de Baile: Piso encerado ideal para bailar."

# Clase Factory Abstracta
class SalonFactory(ABC):
    @abstractmethod
    def crear_salon(self):
        pass

# Clases Factory Concretas
class SalonBodasFactory(SalonFactory):
    def crear_salon(self):
        return SalonBodas()

class SalonConferenciasFactory(SalonFactory):
    def crear_salon(self):
        return SalonConferencias()

class SalonBaileFactory(SalonFactory):
    def crear_salon(self):
        return SalonBaile()

# Función para mostrar el menú y crear el salón solicitado
def gestionar_salon():
    print("Seleccione el tipo de salón que desea crear:")
    print("1. Salón de Bodas")
    print("2. Salón de Conferencias")
    print("3. Salón de Baile")
    opcion = input("Ingrese el número de su opción: ")

    # Diccionario de fábricas
    fabricas = {
        "1": SalonBodasFactory(),
        "2": SalonConferenciasFactory(),
        "3": SalonBaileFactory()
    }

    # Crear salón según la opción del usuario
    fabrica = fabricas.get(opcion)
    if fabrica:
        salon = fabrica.crear_salon()
        print(salon.configuracion())
    else:
        print("Opción no válida. Por favor, elija una opción correcta.")

# Ejecutar la función
gestionar_salon()
