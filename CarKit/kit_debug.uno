int E1 = 10; int M1 = 12; int E2 =11; int M2 = 13;

int right = 0;
int left = 0;

int SPEED = 100;

void setup()
{
  Serial.begin(9600);

  pinMode(E1, OUTPUT);
  pinMode(E2, OUTPUT);
  pinMode(M1, OUTPUT);
  pinMode(M2, OUTPUT);
}


void loop() {

  right = digitalRead(5);
  left = digitalRead(6);

  if (right == 1 && left == 1){

    // direct:

      digitalWrite(M1,HIGH);
      digitalWrite(M2, HIGH);
      analogWrite(E1, SPEED);
      analogWrite(E2, SPEED);
    }

   if (right == 0 && left == 1 ){
      digitalWrite(M1,HIGH);
      digitalWrite(M2, HIGH);
      analogWrite(E1, 0);
      analogWrite(E2, SPEED);
    }

    if (right == 1 && left == 0 ){
      digitalWrite(M1,HIGH);
      digitalWrite(M2, HIGH);
      analogWrite(E1, SPEED);
      analogWrite(E2, 0);
    }

    if (right == 0 && left == 0 ){

      // back:

      digitalWrite(M1,HIGH);
      digitalWrite(M2, HIGH);

      analogWrite(E1, SPEED);
      analogWrite(E2, SPEED);

      delay(500);

      digitalWrite(M1,LOW);
      digitalWrite(M2, LOW);

      analogWrite(E1, SPEED);
      analogWrite(E2, SPEED);
    }
}