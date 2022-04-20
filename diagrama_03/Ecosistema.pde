class Ecosistema {

  int cantidad;
  ArrayList <Caminante> caminantes;

  Ecosistema( int cantidad_ , Paleta paleta ) {
    cantidad = cantidad_;
    caminantes = new ArrayList();
    for ( int i=0; i<cantidad; i++ ) {
      Caminante c = new Caminante();
      c.asignarColor( paleta.darUnColor() );
      caminantes.add( c );
    }
  }
  
  void actualizar(){
    for( Caminante cadaUno : caminantes ){
      cadaUno.actualizar();
    }
  }
  
  void dibujarLinea(){
    for( Caminante cadaUno : caminantes ){
      cadaUno.dibujarLinea();
    }
  }
}
