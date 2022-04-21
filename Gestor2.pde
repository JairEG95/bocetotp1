//clase de dirrecion con el mouse arriba y abajo
// =
//volumen (alto o bajo)

class Gestor2 {

  Dir_y_Vel mouse;
  boolean seMovia;
  boolean arriba;
  boolean abajo;
  
  Gestor2() {
    mouse = new Dir_y_Vel();
  }

  void actualizar() {
    mouse.calcularTodo(mouseX, mouseY);

    // que pasa con el mouse aca
    boolean seMueveElmouseAca = false;
    float sensibilidad = 100;
    if (mouse.velocidad()>sensibilidad) {
      seMueveElmouseAca = true;
    }
    arriba = false;
    abajo = false;

    if (seMueveElmouseAca && !seMovia) {
      arriba = mouse.direccionY()<-sensibilidad?true:false;
      abajo = mouse.direccionY()>sensibilidad?true:false;
    }
    // dejo listo todo para el siguiente frame
    seMovia = seMueveElmouseAca;
  }
}
