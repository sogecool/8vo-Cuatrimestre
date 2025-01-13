from abc import ABC, abstractmethod


#  --> Clase base: Vehículo <--
class Vehiculo(ABC):
    def __init__(self, marca, modelo, año):
        self.marca = marca
        self.modelo = modelo
        self.año = año

    @abstractmethod
    def detalles(self):
        pass


#  --> Clases derivadas <--
class Automovil(Vehiculo):
    def detalles(self):
        return f"Automóvil: {self.marca} {self.modelo}, Año: {self.año}"


class Motocicleta(Vehiculo):
    def detalles(self):
        return f"Motocicleta: {self.marca} {self.modelo}, Año: {self.año}"


class Camion(Vehiculo):
    def detalles(self):
        return f"Camión: {self.marca} {self.modelo}, Año: {self.año}"


# --> Factory Method: Creamos Vehiculos según el tipo que deseemos agregar. <--
class VehiculoFactory:
    @staticmethod
    def crear_vehiculo(tipo, marca, modelo, año):
        tipo = tipo.lower()
        if tipo == "automovil":
            return Automovil(marca, modelo, año)
        elif tipo == "motocicleta":
            return Motocicleta(marca, modelo, año)
        elif tipo == "camion":
            return Camion(marca, modelo, año)
        else:
            raise ValueError(f"Tipo de vehículo '{tipo}' no es válido.")


#  --> Singleton: Gestor de Vehículos <--
class GestorVehiculos:
    _instancia = None

    def __new__(cls, *args, **kwargs):
        if not cls._instancia:
            cls._instancia = super().__new__(cls, *args, **kwargs)
            cls._instancia._vehiculos = []
        return cls._instancia

    def agregar_vehiculo(self, vehiculo):
        self._vehiculos.append(vehiculo)
        print(f"Vehículo agregado: {vehiculo.detalles()}")

    def mostrar_vehiculos(self):
        print("\nListado de Vehículos:")
        for vehiculo in self._vehiculos:
            print(vehiculo.detalles())


# 
def main():
    #  --> Crear el gestor de vehículos (Singleton) <--
    gestor = GestorVehiculos()

    # --> Crear vehículos usando Factory <--
    auto = VehiculoFactory.crear_vehiculo("automovil", "Toyota", "Corolla", 2020)
    moto = VehiculoFactory.crear_vehiculo("motocicleta", "Yamaha", "R6", 2018)
    camion = VehiculoFactory.crear_vehiculo("camion", "Volvo", "FH16", 2022)

    #  --> Agregar vehículos al gestor <--
    gestor.agregar_vehiculo(auto)
    gestor.agregar_vehiculo(moto)
    gestor.agregar_vehiculo(camion)

    #  --> Mostrar los vehículos registrados <--
    gestor.mostrar_vehiculos()


if __name__ == "__main__":
    main()
