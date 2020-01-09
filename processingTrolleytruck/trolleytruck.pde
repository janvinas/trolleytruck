import processing.serial.*;

Serial port;
int valor;
int motorspeed = 0;
int displayspeed;

void setup(){
  println(Serial.list());
  port = new Serial(this, Serial.list()[1], 9600);
  size(800, 400);
}

void draw(){
  if(port.available() > 0){
    valor = port.read();
  }
  background(0);
  fill(255);
  rect(10,50,300,10);
  fill(90,200,230);
  updateSpeed(motorspeed);
  rect(10,50,map(displayspeed, 0, 100, 0, 300), 10);
  textSize(20);
  text("current speed:", 10,30);
  text(motorspeed + "%", 200,30);
  textSize(10);
  text(round(frameRate) + " FPS", 750, 390);
}

void keyPressed(){
  if(key == 'a'){
      motorspeed = motorspeed + 5;
    }else if(key == 'z'){
      motorspeed = motorspeed - 5;
    }

    if(motorspeed > 100){
        motorspeed = 100;
    }else if(motorspeed < 0){
        motorspeed = 0;
    }
  //port.write(round(map(motorspeed, 0, 100, 0, 255)));
  println(round(map(motorspeed, 0, 100, 0, 255)));
}

void updateSpeed(int target){
  if(target > displayspeed){
    displayspeed++;
  }
  else if(target < displayspeed){
    displayspeed--;
  }
  else{
  }
}
