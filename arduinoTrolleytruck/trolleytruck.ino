#define en 10
#define motor1 9
#define motor2 8

char input;
int motorspeed = 0;
int speedpercent = 0;

void setup(void){
  pinMode(en, OUTPUT);
  pinMode(motor1, OUTPUT);
  pinMode(motor2, OUTPUT);

  Serial.begin(9600);
}

void loop(void){
  if(Serial.available()){
    input = Serial.read();
    /*
    if(input == 'a'){
      motorspeed = motorspeed + 10;
    }else if(input == 'z'){
      motorspeed = motorspeed - 10;
    }

    if(motorspeed > 255){
        motorspeed = 255;
    }else if(motorspeed < 0){
        motorspeed = 0;
    }
    speedpercent = map(motorspeed, 0, 255, 0, 100);
    Serial.println(speedpercent);
    */
  }
  digitalWrite(motor1, HIGH);
  digitalWrite(motor2, LOW);
  analogWrite(en, input);
  
}
