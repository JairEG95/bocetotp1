
Ecosistema e;
Paleta paleta;

void setup() {
  size( 1200, 600 );
  paleta = new Paleta("noche_estrellada.jpg");
  e = new Ecosistema( 10, paleta );
  background(255);
}
void draw() {
  e.actualizar();
  e.dibujarLinea();
}
