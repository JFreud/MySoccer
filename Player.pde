class Player {
  PVector pos;
  float dir;
  int team, size; 
  int speed, power, endurance; //Stats
  boolean gotBall;
  double kickStrength, kickTimer; //Kicking
  double sprintSpeed, sprintTimer, runD; //Sprinting
  
  Player(int team, int s, int p, int e) {
    size = 30;
    this.team = team;
    speed = s;
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
      fill (255, 0, 0);
    }
    else {
      fill (0, 0, 255);
    }
    ellipse(pos.x, pos.y, size, size);
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
        if (leftUp) {
          pos.y -= speed/20 + sprintSpeed;
          dir = PI*7/4;
        }
        else if (leftDown) {
          pos.y += speed/20 + sprintSpeed;
          dir = PI*5/4;
        }
      }
      else if (leftRight) {
        pos.x += speed/20 + sprintSpeed;
        dir = PI/2;
        if (leftUp) {
          pos.y -= speed/20 + sprintSpeed;
          dir = PI/4;
        }
        else if (leftDown) {
          pos.y += speed/20 + sprintSpeed;
          dir = PI*3/4;
        }
      }
      else if (leftUp) {
        pos.y -= speed/20 + sprintSpeed;
        dir = 0;
      }
      else if (leftDown) {
        pos.y += speed/20 + sprintSpeed;
        dir = PI;
      }
    }
    
    else {
      if (rightLeft) {
        pos.x -= speed/20 + sprintSpeed;
        dir = PI*3/2;
        if (rightUp) {
          pos.y -= speed/20 + sprintSpeed;
          dir = PI*7/4;
        }
        else if (rightDown) {
          pos.y += speed/20 + sprintSpeed;
          dir = PI*5/4;
        }
      }
      else if (rightRight) {
        pos.x += speed/20 + sprintSpeed;
        dir = PI/2;
        if (rightUp) {
          pos.y -= speed/20 + sprintSpeed;
          dir = PI/4;
        }
        else if (rightDown) {
          pos.y += speed/20 + sprintSpeed;
          dir = PI*3/4;
        }
      }
      else if (rightUp) {
        pos.y -= speed/20 + sprintSpeed;
        dir = 0;
      }
      else if (rightDown) {
        pos.y += speed/20 + sprintSpeed;
        dir = PI;
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
      if (kickStrength >= power/2)
        kickStrength = power/2;
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
