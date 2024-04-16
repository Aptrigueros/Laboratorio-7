import processing.serial.*;

Serial puertoSerial; // Objeto para la comunicación serial
int[] leds = new int[3]; // Array para almacenar el estado de los LEDs
int[] buttons = new int[3]; // Array para almacenar el estado de los botones
int potValue = 0; // Valor del potenciómetro

void setup() {
  size(400, 200);
  puertoSerial = new Serial(this, "COM5", 9600); // Cambia "COM3" al puerto que esté utilizando tu Arduino

  // Inicializar los estados de los LEDs y botones
  for (int i = 0; i < leds.length; i++) {
    leds[i] = 0; // Inicialmente apagados
    buttons[i] = 0; // Inicialmente sin presionar
  }
}

void draw() {
  background(255);
  
  // Dibujar LEDs
  for (int i = 0; i < leds.length; i++) {
    fill(leds[i] == 1 ? color(255, 0, 0) : color(150)); // Rojo si está encendido, gris si está apagado
    ellipse(50 + i * 100, 100, 30, 30);
  }
  
  // Dibujar botones
  for (int i = 0; i < buttons.length; i++) {
    fill(buttons[i] == 1 ? color(0, 255, 0) : color(150)); // Verde si está presionado, gris si no lo está
    rect(30 + i * 100, 140, 40, 20);
  }
  
  // Dibujar potenciómetro (slider)
  fill(0);
  rect(30, 30, 300, 20);
  fill(255);
  ellipse(map(potValue, 0, 1023, 30, 330), 40, 20, 20);
}

void serialEvent(Serial puertoSerial) {
  // Leer datos del puerto serial
  String entrada = puertoSerial.readStringUntil('\n');
  if (entrada != null) {
    entrada = trim(entrada);
    if (entrada.length() > 0) {
      // Dividir los datos en partes
      String[] datos = split(entrada, ',');
      if (datos.length == 5) { // Asumiendo que los datos enviados desde Arduino tienen 5 partes separadas por comas
        // Actualizar los estados de los LEDs y botones
        for (int i = 0; i < 3; i++) {
          leds[i] = Integer.parseInt(datos[i]);
          buttons[i] = Integer.parseInt(datos[i + 3]);
        }
        potValue = Integer.parseInt(datos[4]); // Actualizar valor del potenciómetro
      }
    }
  }
}
