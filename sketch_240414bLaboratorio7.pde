import processing.serial.*;

Serial puertoSerie; // Variable para la comunicación serial
int valorPotenciometro = 0; // Variable para almacenar el valor recibido

void setup() {
  size(400, 200); // Tamaño de la ventana de Processing
  puertoSerie = new Serial(this, "COM5", 9600); // Inicia la comunicación serial con Arduino
}

void draw() {
  background(255); // Fondo blanco
  fill(0); // Texto en negro
  textSize(24); // Tamaño de letra
  text("Valor del potenciómetro: " + valorPotenciometro, 50, 100); // Muestra el valor del potenciómetro
  rect(350,350,30,-valorPotenciometro);
  rectMode(CORNER);
  println(valorPotenciometro);
}

void SerialEvent(Serial puertoSerie) {
  String valor = puertoSerie.readStringUntil('\n');
  if (valor!=null){
    valorPotenciometro = Integer.parseInt(valor.trim()); // Lee el valor enviado por Arduino
  }
}

void serialEvent(Serial puertoSerie) {
  String valor = puertoSerie.readStringUntil('\n');
  if (valor!=null){
    valorPotenciometro = Integer.parseInt(valor.trim()); // Lee el valor enviado por Arduino
  }
}
