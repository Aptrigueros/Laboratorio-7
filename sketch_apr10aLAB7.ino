const int potenciometro = A3;
const int pushButton1 = 2;
const int pushButton2 = 3;
const int pushButton3 = 4;
const int led1 = 8;
const int led2 = 9;
const int led3 = 10;

// Declaración de variables
int valorPotenciometro;

void setup() {
  // Configuración de los pines
  Serial.begin(9600); // Inicia la comunicación serial
  pinMode(pushButton1, INPUT);
  pinMode(pushButton2, INPUT);
  pinMode(pushButton3, INPUT);
  pinMode(led1, OUTPUT);
  pinMode(led2, OUTPUT);
  pinMode(led3, OUTPUT);
}

void loop() {
  // Lee el valor del potenciómetro y lo envía a JAVA a través del puerto serie
  valorPotenciometro = analogRead(potenciometro);
  Serial.println(valorPotenciometro);
  delay(50); // Pequeña pausa para evitar una transmisión muy rápida de datos por el puerto serie
  int buttonState1 = digitalRead(pushButton1);
  int buttonState2 = digitalRead(pushButton2);
  int buttonState3 = digitalRead(pushButton3);

  if (buttonState1 == HIGH) {
    digitalWrite(led1, HIGH);
  } else {
    digitalWrite(led1, LOW);
  }

  if (buttonState2 == HIGH) {
    digitalWrite(led2, HIGH);
  } else {
    digitalWrite(led2, LOW);
  }
   if (buttonState3 == HIGH) {
    digitalWrite(led3, HIGH);
  } else {
    digitalWrite(led3, LOW);
  }
}
