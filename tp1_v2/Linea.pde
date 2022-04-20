//esta clase dibujar lineas

//aca, se van a dibujar las primeras lineas
//se dibujan el largo segun la duracion del sonido, y la curvatura segun el volumen
//y la direccion agudo y grave
//el color de la paleta y la opacidad usada es random

float MIN_VAR_ANGULAR = 6;
float MAX_VAR_ANGULAR = 10;
int MIN_TIEMPO_AVANZA = 100;
int MAX_TIEMPO_AVANZA = 500;
int MIN_TIEMPO_FINALIZA = 100;
int MAX_TIEMPO_FINALIZA = 400;

class Caminante {

  float x, y;
  float antesX, antesY;
  float dir, vel;
  color relleno;
  float variacionAngular;
  String estado;
  long marcaEnElTiempo, marcaEnElTiempo2;
  int tiempoEnEspera;
  int tiempoFinaliza;

  Caminante() {
    x = random(width);
    y = random(height);
    vel = 4;
    dir = 0;
    //dir = radians( random(360) );
    relleno = color( random(255), random(255), random(255));
    reiniciar();
  }
  
  void reiniciar(){
    variacionAngular = radians( random( MIN_VAR_ANGULAR, MAX_VAR_ANGULAR ) );
    estado = "avanza";
    marcaEnElTiempo = millis();
    marcaEnElTiempo2 = millis();
    tiempoEnEspera = int( random( MIN_TIEMPO_AVANZA, MAX_TIEMPO_AVANZA ) );
    tiempoFinaliza = int( random( MIN_TIEMPO_FINALIZA, MAX_TIEMPO_FINALIZA ) );
  }

  void actualizar() {

    if ( estado.equals( "avanza" ) ) {
      mover();
      long ahora = millis();
      if ( ahora > marcaEnElTiempo + tiempoEnEspera ) {
        estado = "cambia";
      }
      if ( ahora > marcaEnElTiempo2+tiempoFinaliza ) {
        estado = "fin";
      }
    } else if ( estado.equals( "cambia" ) ) {
      variacionAngular = radians( random( MIN_VAR_ANGULAR, MAX_VAR_ANGULAR ) );
      estado = "avanza";
      marcaEnElTiempo = millis();
      tiempoEnEspera = int( random( MIN_TIEMPO_AVANZA, MAX_TIEMPO_AVANZA ) );
    } else if ( estado.equals( "fin" ) ) {
    }
  }

  void asignarColor( color nuevoColor ) {
    relleno = nuevoColor;
  }

  void dibujarLinea() {
    pushStyle();
    stroke( relleno );
    strokeWeight(20);
    line( x, y, antesX, antesY );
    popStyle();
  }

  void mover() {

    antesX = x;
    antesY = y;

    dir = dir + variacionAngular;

    //transformación de polares a cartesianas
    float dx = vel * cos( dir );
    float dy = vel * sin( dir );

    //cartesianas
    x = x + dx;
    y = y + dy;

    //toroidal
    x = ( x>width ? x-width : x );
    x = ( x<0 ? x+width : x );
    y = ( y>height ? y-height : y );
    y = ( y<0 ? y+height : y );

    if ( dist( x, y, antesX, antesY ) > vel*2 ) {
      antesX = x;
      antesY = y;
    }
  }
}
