//Movimientos grandes y chicos
// =
//duracion

class Gestor3 {
  Dir_y_Vel mouse;
  boolean movGrande;
  boolean movChico;
  float tiempoGrande;
  float tiempoChico;

  Gestor3() {
    mouse = new Dir_y_Vel();
  }

  void actualizar() {
    movGrande = false;
    movChico = false;
    mouse.calcularTodo(mouseX, mouseY);
    tiempoGrande--;
    tiempoChico--;
    tiempoGrande = constrain(tiempoGrande, 0, 90);
    tiempoChico = constrain(tiempoChico, 0, 90);

    if (mouse.velocidad()>10) {
      float umbral = 50;
      if (mouse.velocidad()>umbral) {
        tiempoGrande+=10;
        tiempoChico-=10;
      } else {
        if (tiempoGrande<10) {
          tiempoChico+=10;
        }
      }
    }

    if (tiempoGrande>55) {
      movGrande = true;
    }
    if (tiempoChico>55) {
      movChico = true;
    }
  }
}
