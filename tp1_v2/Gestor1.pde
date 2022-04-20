//clase de dirrecion con el mouse derecha e izquierda
// =
//en voz agudo y grave

class Gestor1 {
  Dir_y_Vel mouse;
  boolean seMovia;
  boolean izquierda;
  boolean derecha;
  
  Gestor1() {
    mouse = new Dir_y_Vel();
  }
  void actualizar() {
    mouse.calcularTodo(mouseX, mouseY);

    // que pasa con el mouse aca
    boolean seMueveElmouseAca = false;
    float sensibilidad = 50;
    
    if (mouse.velocidad()>sensibilidad) {
      seMueveElmouseAca = true;
    }
    
    izquierda = false;
    derecha = false;

    if (seMueveElmouseAca && !seMovia) {
      derecha = mouse.direccionX()>sensibilidad?true:false;
      izquierda = mouse.direccionX()<-sensibilidad?true:false;
    }
    // dejo listo todo para el siguiente frame
    seMovia = seMueveElmouseAca;
  }
}
