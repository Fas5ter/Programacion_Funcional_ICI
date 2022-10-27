# Unidad II: Programación Orientada a Objetos
## Problemas resueltos en clase con Dart
### Ejercicio 1.1. Crear una lista e iterarla imprimiendo cada dato con su indice.
### 1.1 Descripcion del ejercicio
  Se necesita crear una lista para posteriormente iterarla con un ciclo for imprimiendo cada dato con su indice en el arreglo.
#### 1.2 Código
```dart
void main(List<String> args) {
  final miLista = const [1, 2, 3, 4]; // avoid side effects
  print(miLista);
  }
```
 #### 1.3 Implementación
 ```dart
  for (var i = 0; i < miLista.length; i++) {
    stdout.write("$i: ${miLista[i]} | ");
 ```
#### 1.4 Salida
```
[1, 2, 3, 4]
0: 1 | 1: 2 | 2: 3 | 3: 4 | 
```

### Ejercicio 1.2. Calculadora que lea dos numeros del teclado y obtenga suma, resta, multiplicación y division, usando funciones y asingnado valores a dos variables
### 1.1 Descripcion del ejercicio
  Se necesita crear una funcion que indique operacion se va a realizar (suma, resta, multiplicacion o división) y crear varias funciones para hacer la operacion ingresada por el usuario. 
#### 1.2 Código
```dart
String leerDatos(String mensaje) {
  print(mensaje);
  String data = (stdin.readLineSync()!);
  return data;
}

String calculadora(String op, int n1, int n2) {
  if (op == "+") {
    return "$n1 + $n2 = ${suma(n1, n2)}";
  } else if (op == "-") {
    return "$n1 - $n2 = ${resta(n1, n2)}";
  } else if (op == "*") {
    return "$n1 * $n2 = ${multi(n1, n2)}";
  } else if (op == "/") {
    return "$n1 / $n2 = ${divi(n1, n2)}";
  } else {
    return "Operación inválida";
  }
}

int suma(int num1, int num2) => num1 + num2;
int resta(int num1, int num2) => num1 - num2;
int multi(int num1, int num2) => num1 * num2;
int divi(int num1, int num2) => num1 ~/ num2;
```
 #### 1.3 Implementación
 ```dart
 import 'dart:io';
void main() {
  String op = leerDatos("Indica la operación [+,-,*,/]");
  int num1 = int.parse(leerDatos("Dame el primer número"));
  int num2 = int.parse(leerDatos("Dame el segundo número"));
  print("${calculadora(op, num1, num2)}");
}
 ```
#### 1.4 Salida
```
Indica la operación [+,-,*,/]
+
Dame el primer número
3
Dame el segundo número
4
3 + 4 = 7
```

### Ejercicio 1.3. Una funcion que reciba dos numeros y la operacion, por argumentos dados al compilar el programa en la terminal.
### 1.1 Descripcion del ejercicio
  Se necesita crear una funcion que reciba dos numeros y la operacion a realizar dando los argumentos al momento de compilar el programa.
#### 1.2 Código
```dart
class Calculadora {
  int o = 0;
  int a = 0;
  int b = 0;
  int suma(int a, int b) => a + b; // Declarativa
  int resta(int a, int b) => a - b;
  int multi(int a, int b) => a * b;
  double divi(int a, int b) => a / b;
  void mensaje(res) {
    print("El resultado es: $res");
  }

  void Calcular(int a, int b, String op) {
    switch (op) {
      case '+':
        print(suma(a, b));
        break;
      case '*':
        print(multi(a, b));
        break;
      case '/':
        print(divi(a, b));
        break;
      case '-':
        print(resta(a, b));
        break;
      default:
        print("Opcion invalida");
        break;
    }
  }
}
```
 #### 1.3 Implementación
 ```dart
 void main(List<String> args) {
  Calculadora calc = new Calculadora();
  if (args.length == 3) {
    var a = int.parse(args[0]);
    var b = int.parse(args[1]);
    calc.Calcular(a, b, args[2]);
  } else {
    print("Error de argumentos.");
    print("Ejemplo: dart main.dart 3 15 +");
  }
}
 ```
#### 1.4 Salida
```
dart main.dart 9 8 +
17
```

### Ejercicio 1.4. Crear una clase Persona que tenga las propiedades de nombre, apellido paterno, apellido materno y año de nacimiento, una funcion de calcular la edad y mostrar las propiedades del objeto en pantalla.
### 1.1 Descripcion del ejercicio
  Se necesita crear un objeto a partir de la clase Persona, tenga propiedades de nombre, apellido paterno, apellido materno, y año de nacimiento, con una funcion para mostrar los datos en pantalla y una funcion para calcular la edad.
#### 1.2 Código
```dart
class Persona {
  String nombre = "";
  String aPaterno = "";
  String aMaterno = "";
  int aNacimiento = 0;

  int calcularEdad(int aNacimiento) => 2022 - aNacimiento;

  void showName(String nombre, String aPaterno, String aMaterno) {
    print("$aPaterno $aMaterno $nombre");
  }

  void showname2() {
    print("$aPaterno $aMaterno $nombre");
  }
}
```
 #### 1.3 Implementación
 ```dart
 void main(List<String> args) {
  Persona cristian = new Persona();
  cristian.aMaterno = "Bravo";
  cristian.aPaterno = "Larios";
  cristian.nombre = "Cristian";
  cristian.aNacimiento = 2003;

  cristian.showName(cristian.nombre, cristian.aPaterno, cristian.aMaterno);
  print("Tienes ${cristian.calcularEdad(cristian.aNacimiento)} años");
  cristian.showname2();
}
 ```
#### 1.4 Salida
```
Larios Bravo Cristian
Tienes 19 años
Larios Bravo Cristian
```

### Ejercicio 1.5. Simulacro de examen practico
### 1.1 Descripcion del ejercicio
  Simulacro de examen practico. Crear una clase Vehiculo, que tenga las propiedades de numero de llantas, color, modelo, marca , una funcion para mostrar las propiedades en pantalla, tres metodos y que use setters, getters y un constructor.
#### 1.2 Código
```dart
class vehiculo {
  int? _num_llantas;
  String? _color;
  String? _modelo;
  String? _marca;

  void imprimircaracteristicas() {
    print(
        "Modelo: $_modelo\nColor: $_color\nMarca: $_marca\nNumero de llantas: $_num_llantas");
  }

  void arrancar() {
    if (_num_llantas == 4) {
      print('El auto se esta encendiendo....tucutucutucu.');
    } else {
      print('Le faltan llantas al vehiculo, no puede arrancar');
    }
  }

  void correr() {
    print("Rrrrrrrrr, el vehiculo va en movimiento");
  }

  void frenar() {
    print('Issshhhh, el vehiculo se ha detenido.');
  }

  void set llantas(int llantas) => _num_llantas = llantas;
  void set color(String color) => _color = color;
  void set modelo(String modelo) => _modelo = modelo;
  void set marca(String marca) => _marca = marca;   //setters

  int get llantas => llantas;
  String get color => color;  // getters
  String get modelo => modelo;
  String get marca => marca;

  vehiculo(int llantas, String color, String marca, String modelo) {
    this._num_llantas = llantas;
    this._color = color; // constructor
    this._marca = marca;
    this._modelo = modelo;
  }

//   vehiculo(this._num_llantas, this._color, this._marca, this._modelo);
//   vehiculo.marca(this._marca);  // Constructor resumido
}

void showVehiculo(vehiculo miCarro) {
  print('Marca        ${miCarro.marca}');
  print('Modelo');
  print('Color');
  print('No de llantas:');
}
```
 #### 1.3 Implementación
 ```dart
 void main(List<String> args) {
   vehiculo miJeep = new vehiculo(4, 'Plata', 'Jeep', 'Rubicon');
  // vehiculo miJetta = new vehiculo(5, 'Plata', 'VW', 'Jetta');
  print('');
  miJeep.imprimircaracteristicas();
  print('');
  // showVehiculo(miJetta);
}
 ```
#### 1.4 Salida
```

Modelo: Rubicon
Color: Plata
Marca: Jeep
Numero de llantas: 4

```

### Ejercicio 1.6. Crear una clase padre Animal con dos clases hijo (Perro y Ave) y que la clase Perro tenga una clase hijo (Monstruo).
### 1.1 Descripcion del ejercicio
  Se necesita crear 4 clases de las cuales se hara uso de la herencia en Dart. Donde se heredaran las propiedades y metodos de las clases
#### 1.2 Código
```dart
class Animal {
  String _especie = "";
  String _habitat = "";
  String _color = "";
  int _patas = 0;

  Animal();
  Animal.data(this._especie, this._habitat, this._color, this._patas);

  void correr() {
    print("Animal Corriendo");
  }

  void caminar() {
    print("Perro Caminando");
  }

  void volando() {
    print("Ave squox squox squox");
  }

  void showAnimal() {
    print("Especie: $_especie");
    print("Habitad: $_habitat");
    print("Color: $_color");
    print("Patas: $_patas");
  }
}

class Perro extends Animal {
  String _raza = "";

  Perro.data(_especie, _habitat, _color, _patas, this._raza)
      : super.data(_especie, _habitat, _color, _patas);

  void ladrar() {
    print("Grrr guau guau guau");
  }

  void caminar() {
    super.caminar();
  }

  void showPerro() {
    super.showAnimal();
    print("Raza: $_raza");
  }
}

class Ave extends Animal {
  int _alas = 0;

  Ave();
  Ave.data(_especie, _habitat, _color, _patas, this._alas)
      : super.data(_especie, _habitat, _color, _patas);

  void volando() {
    super.volando();
  }

  void asustando() {
    print("Monstruo asustando");
  }

  void showAve() {
    super.showAnimal();
    print("Alas: $_alas");
  }
}

class Monstruo extends Ave {
  String _asusta = "";

  Monstruo.data(_especie, _habitat, _color, _patas, _alas, this._asusta)
      : super.data(_especie, _habitat, _color, _patas, _alas);

  void asustando() {
    super.asustando();
  }

  void showMonstruo() {
    super.showAve();
    print("Asusta: $_asusta");
  }
}
```
 #### 1.3 Implementación
 ```dart
 void main() {
  print("");
  Animal gatito = new Animal.data("Gato", "Casa", "Naranja", 4);
  gatito.showAnimal();
  gatito.correr();
  print("");

  Perro pitbull = new Perro.data("Perro", "Casa", "Cafe", 4, "pitbull");
  pitbull.showPerro();
  pitbull.ladrar();
  pitbull.caminar();
  print("");

  Ave tucan = new Ave.data("Tucan", "Arboles", "Nueces", 2, 2);
  tucan.showAve();
  tucan.volando();
  print("");

  Monstruo frankenstein = new Monstruo.data(
      "Experimento", "Ginebra", "Capa y blanco", 2, 2, "Si");
  frankenstein.showMonstruo();
  frankenstein.asustando();
  print("");
}
 ```
#### 1.4 Salida
```
Especie: Gato   
Habitad: Casa   
Color: Naranja  
Patas: 4        
Animal Corriendo

Especie: Perro
Habitad: Casa
Color: Cafe
Patas: 4
Raza: pitbull
Grrr guau guau guau
Perro Caminando

Especie: Tucan
Habitad: Arboles
Color: Nueces
Patas: 2
Alas: 2
Ave squox squox squox

Especie: Experimento
Habitad: Ginebra
Color: Capa y blanco
Patas: 2
Alas: 2
Asusta: Si
Monstruo asustando
```
