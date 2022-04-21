//aca declaramos todas las clases
Gestor2 volumen;
Gestor3 duracion;
ArrayList <Linea> linea;

int cantidadR = 10;
float dir = 15;
float angulo = 15;
int largo;
String estado;
int cantidad = 15;

class Obra {

  Obra() {

    volumen = new Gestor2();
    duracion = new Gestor3();
    linea = new ArrayList <Linea> ();
    for (int i =0; i<cantidad; i++) {
      linea.add(new Linea());
    }
    estado = "iniciar";
  }

  void actulizar() {

    println(estado);
    println(duracion.movGrande);

    if (estado.equals("iniciar")) {
      color fondo = 255;
      //aca, se define el color del fondo y pasa al siguiente estado
      //el color de fondo se define por el volumen
      //COMO HACER PARA QUE FUNCIONE MEJOR?????
      background(255);
      volumen.actualizar();
      if (volumen.arriba) {
        fondo = int(random(200, 255));
        pushStyle();
        colorMode(HSB);
        background(fondo, 100, 250);
        popStyle();
        estado = "primeraslineas";
      }
      if (volumen.abajo) {
        fondo = int(random(100, 150));
        pushStyle();
        colorMode(HSB);
        background(fondo, 100, 250);
        popStyle();
        estado = "primeraslineas";
      }
    }
    if (estado.equals("primeraslineas")) {
      //aca, se van a dibujar las primeras lineas
      //se dibujan el largo segun la duracion del sonido, y la curvatura segun el volumen
      //y la direccion agudo y grave
      //el color de la paleta y la opacidad usada es random
      if (duracion.movGrande) {
        largo=int (random(50, 100));
      }
      for (Linea l : linea) {
        l.actualizar(radians(dir), radians(angulo), largo);
        l.dibujarLinea();
      }
    }
    if (estado.equals("segundaslineas")) {
      //aca, se van a dibujar las segundas lineas, que van a variar con un constrain distinto a las primeras
      //se dibujan el largo segun la duracion del sonido, y la curvatura segun el volumen
      //y la direccion agudo y grave
      //el color de la paleta y la opacidad  usada es random
    }
    if (estado.equals("circulos")) {
      //aca, se van a dibujar los circulos
      //se dibujan con la duracion, tiene limites de la diferencia de tamanos
      //el color de la paleta usada es random pero la opacidad se controla el volumen
    }
    if (estado.equals("terceras lineas")) {
      //aca, se van a dibujar las segundas lineas, que van a variar con un constrain distinto a las primeras
      //se dibujan el largo segun la duracion del sonido, y la curvatura segun el volumen
      //y la direccion agudo y grave
      //el color de la paleta y la opacidad  usada es random
      //la cantidad es menor a las otras
    }
    if (estado.equals("firma")) {
      //si se cumple la condicion para terminar el cuadro aparece la firma
      //esa condicion puede ser no movimiento del mouse o el silencio, por x tiempo
      //si esto no se cumple va a estado primeraslineas
    }
  }
}
