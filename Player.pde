class Player {
  PVector pos;
  float dir;
  int team, size; 
  int speed, power, endurance; //Stats
  boolean gotBall;
  double kickStrength, kickTimer; //Kicking
  double sprintSpeed, sprintTimer, runD; //Sprinting
  int switcher;
  int timer;
  boolean hoo;
  
  Player(int team, int s, int p, int e) {
    size = 30;
    this.team = team;
    speed = s;
    timer = 16;
    power = p;
    endurance = e;
    gotBall = false;
    kickStrength = 0;
    kickTimer = 0;
    if (team == 0) {
      pos = new PVector(width/4, height/2);
      dir = 90;
    }
    else {
      pos = new PVector(width*3/4, height/2);
      dir = 270;
    }
  }
  
  void display() {
    if (team == 0) {
      image(spritesLeft[switcher], pos.x - 15, pos.y - 40, size * 2, size * 2);
      fill (255, 0, 0);
    }
    else {
      image(spritesRight[switcher], pos.x - 15, pos.y - 40, size * 2, size * 2);
      fill (0, 0, 255);
    }
    //ellipse(pos.x, pos.y, size, size);
    
    update();
  }
  
  void update() {
    move();
    if (team == 0 && leftAction){
        action();  
    } 
    if (team == 1 && rightAction){
      action();
    }
    checkBoundaries();
  }
  
  void move() {
    if (team == 0) {
      if (leftLeft) {
        pos.x -= speed/20 + sprintSpeed;
        dir = PI*3/2;
        if (hoo) {  
            switcher = 8;
            if (timer == 0) {
              hoo = false;
              timer = 16;
            }
            timer--;
          }
          else {
            switcher = 9;
            if (timer < 8) {
              hoo = true;
            }
            timer--;
          }
        if (leftUp) {
          if (hoo) {  
            switcher = 12;
            if (timer == 0) {
              hoo = false;
              timer = 16;
            }
            timer--;
          }
          else {
            switcher = 13;
            if (timer < 8) {
              hoo = true;
            }
            timer--;
          }
          pos.y -= speed/20 + sprintSpeed;
          dir = PI*7/4;
        }
        else if (leftDown) {
          if (hoo) {  
            switcher = 2;
            if (timer == 0) {
              hoo = false;
              timer = 16;
            }
            timer--;
          }
          else {
            switcher = 3;
            if (timer < 8) {
              hoo = true;
            }
            timer--;
          }
          pos.y += speed/20 + sprintSpeed;
          dir = PI*5/4;
        }
      }
      else if (leftRight) {
        pos.x += speed/20 + sprintSpeed;
        dir = PI/2;
        if (hoo) {  
            switcher = 10;
            if (timer == 0) {
              hoo = false;
              timer = 16;
            }
            timer--;
          }
          else {
            switcher = 11;
            if (timer < 8) {
              hoo = true;
            }
            timer--;
          }
        if (leftUp) {
          if (hoo) {  
            switcher = 14;
            if (timer == 0) {
              hoo = false;
              timer = 16;
            }
            timer--;
          }
          else {
            switcher = 15;
            if (timer < 8) {
              hoo = true;
            }
            timer--;
          }
          pos.y -= speed/20 + sprintSpeed;
          dir = PI/4;
        }
        else if (leftDown) {
          if (hoo) {  
            switcher = 4;
            if (timer == 0) {
              hoo = false;
              timer = 16;
            }
            timer--;
          }
          else {
            switcher = 5;
            if (timer < 8) {
              hoo = true;
            }
            timer--;
          }
          pos.y += speed/20 + sprintSpeed;
          dir = PI*3/4;
        }
      }
      else if (leftUp) {
        if (hoo) {  
            switcher = 0;
            if (timer == 0) {
              hoo = false;
              timer = 16;
            }
            timer--;
          }
          else {
            switcher = 1;
            if (timer < 8) {
              hoo = true;
            }
            timer--;
          }
        pos.y -= speed/20 + sprintSpeed;
        dir = 0;
      }
      else if (leftDown) {
        if (hoo) {  
            switcher = 6;
            if (timer == 0) {
              hoo = false;
              timer = 16;
            }
            timer--;
          }
          else {
            switcher = 7;
            if (timer < 8) {
              hoo = true;
            }
            timer--;
          }
        pos.y += speed/20 + sprintSpeed;
        dir = PI;
      }
    }
    
    else {
      if (rightLeft) {
        pos.x -= speed/20 + sprintSpeed;
        dir = PI*3/2;
        if (hoo) {  
            switcher = 8;
            if (timer == 0) {
              hoo = false;
              timer = 16;
            }
            timer--;
          }
          else {
            switcher = 9;
            if (timer < 8) {
              hoo = true;
            }
            timer--;
          }
        if (rightUp) {
          pos.y -= speed/20 + sprintSpeed;
          dir = PI*7/4;
          if (hoo) {  
            switcher = 12;
            if (timer == 0) {
              hoo = false;
              timer = 16;
            }
            timer--;
          }
          else {
            switcher = 13;
            if (timer < 8) {
              hoo = true;
            }
            timer--;
          }
        }
        else if (rightDown) {
          pos.y += speed/20 + sprintSpeed;
          dir = PI*5/4;
          if (hoo) {  
            switcher = 2;
            if (timer == 0) {
              hoo = false;
              timer = 16;
            }
            timer--;
          }
          else {
            switcher = 3;
            if (timer < 8) {
              hoo = true;
            }
            timer--;
          }
        }
      }
      else if (rightRight) {
        pos.x += speed/20 + sprintSpeed;
        dir = PI/2;
        if (hoo) {  
            switcher = 10;
            if (timer == 0) {
              hoo = false;
              timer = 16;
            }
            timer--;
          }
          else {
            switcher = 11;
            if (timer < 8) {
              hoo = true;
            }
            timer--;
          }
        if (rightUp) {
          pos.y -= speed/20 + sprintSpeed;
          dir = PI/4;
          if (hoo) {  
            switcher = 14;
            if (timer == 0) {
              hoo = false;
              timer = 16;
            }
            timer--;
          }
          else {
            switcher = 15;
            if (timer < 8) {
              hoo = true;
            }
            timer--;
          }
        }
        else if (rightDown) {
          pos.y += speed/20 + sprintSpeed;
          dir = PI*3/4;
          if (hoo) {  
            switcher = 4;
            if (timer == 0) {
              hoo = false;
              timer = 16;
            }
            timer--;
          }
          else {
            switcher = 5;
            if (timer < 8) {
              hoo = true;
            }
            timer--;
          }
        }
      }
      else if (rightUp) {
        pos.y -= speed/20 + sprintSpeed;
        dir = 0;
        if (hoo) {  
            switcher = 0;
            if (timer == 0) {
              hoo = false;
              timer = 16;
            }
            timer--;
          }
          else {
            switcher = 1;
            if (timer < 8) {
              hoo = true;
            }
            timer--;
          }
      }
      else if (rightDown) {
        pos.y += speed/20 + sprintSpeed;
        dir = PI;
        if (hoo) {  
            switcher = 6;
            if (timer == 0) {
              hoo = false;
              timer = 16;
            }
            timer--;
          }
          else {
            switcher = 7;
            if (timer < 8) {
              hoo = true;
            }
            timer--;
          }
      }
    }
  }
  
  //ACTION
  void action(){
    if (gotBall){
      kick();  
    }
    else if (hasBall != team){
      sprint();  
    }
  }
  
  void sprint(){
    if (sprintTimer == 0){ //Initial
      sprintTimer = 200-endurance;
      sprintSpeed = speed/8;
      runD = sprintSpeed/sprintTimer;
//      println("Timer: " + sprintTimer + "\nSpeed: " + sprintSpeed + "\nrunD: " + runD);
    }
  }
  void kick(){
    println(kickTimer);
    if (kickTimer == 0 && kickStrength == 0){ //Initial
      kickTimer = 100;
    }
    else if (kickTimer > 0){ //Charging
      if (kickStrength >= power)
        kickStrength = power;
      else kickStrength += power/10;
      kickTimer -= 1;
      println("kickStrength: " + kickStrength);
      println("kickTimer: " + kickTimer);
    }
  }
  
  //Collision
  void checkBoundaries() {
    if (pos.x < size/2) {
      pos.x = size/2;
    }
    if (pos.x > width-size/2) {
      pos.x = width-size/2;
    }
    if (pos.y < size/2) {
      pos.y = size/2;
    }
    if (pos.y > height-size/2) {
      pos.y = height-size/2;
    }
  }
}
