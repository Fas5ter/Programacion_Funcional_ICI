/* void main(List<String> args) {
  // Animal Tigre = Animal(nombre: 'Tigre', patas: 10);
  // Tigre.info();
  // Tigre.correr();
  Perro perrito = Perro('Pug');
  perrito.caminar();
  perrito.patas = 4;
  perrito.nombre = 'Pancho';
  perrito.ladrar();
  perrito.info();
}

class Animal {
  int? patas;
  String? nombre;

  void info() {
    print('El animal ${nombre} tiene ${patas} patas');
  }

  void caminar() {
    print('Animal caminando');
  }

  Animal({this.nombre, this.patas});
}

class Perro extends Animal {
  String? _raza;

  void ladrar() {
    print('guau guau');
  }

  void caminar() {
    print("Perro caminando");
  }

  void info() {
    print('El animal ${_raza} tiene ${patas} patas y se llama ${nombre}');
  }


  Perro(this._raza);
}

class Ave extends Animal {
  String? _raza;

  void volar() {
    print("Ave volando");
  }

  Ave(this._raza);

  void info() {
    print('El Ave de raza ${_raza} tiene ${patas} patas y se llama ${nombre}');
  }
} */

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
