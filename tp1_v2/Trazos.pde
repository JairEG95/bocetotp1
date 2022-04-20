//en esta clase van los distintos tipos de trazos

class Trazos {
  float x, y;
  float vx, vy;
  float dir;
  float t = 20;
  float opa = 50;

  Trazos(float x_, float y_) {
    x = x_ ;
    y = y_ ;
  }

  void dibujarLineaRecta() {
    
    /* pushStyle();
     noStroke();
     // hacer que varie la opacidad a lo largo del trazo, con un random
     fill(250, 100, 200, opa);
     ellipse(x, y, t, t);
     popStyle();
     moverLineasRectas();
     }
     void moverLineasRectas() {
     */
  }
  void lineaCurva() {
  }

  void cirCulo() {
  }
}
