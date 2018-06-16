class Player {
  PVector pos;
  int dir;
  int team, size; 
  int speed, power; //Stats
  boolean gotBall;
  
  Player(int team, int s, int p) {
    size = 30;
    this.team = team;
    speed = s;
    power = s;
    gotBall = false;
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
  
  //CONTROLS
  void update() {
    if (team == 0) {
      if (leftLeft) {
        pos.x -= speed/20;
        dir = 270;
        if (leftUp) {
          pos.y -= speed/20;
          dir = 315;
        }
        else if (leftDown) {
          pos.y += speed/20;
          dir = 225;
        }
      }
      else if (leftRight) {
        pos.x += speed/20;
        dir = 90;
        if (leftUp) {
          pos.y -= speed/20;
          dir = 45;
        }
        else if (leftDown) {
          pos.y += speed/20;
          dir = 135;
        }
      }
      else if (leftUp) {
        pos.y -= speed/20;
        dir = 0;
      }
      else if (leftDown) {
        pos.y += speed/20;
        dir = 180;
      }
    }
    else {
      if (rightLeft) {
        pos.x -= speed/20;
        dir = 270;
        if (rightUp) {
          pos.y -= speed/20;
          dir = 315;
        }
        else if (rightDown) {
          pos.y += speed/20;
          dir = 225;
        }
      }
      else if (rightRight) {
        pos.x += speed/20;
        dir = 90;
        if (rightUp) {
          pos.y -= speed/20;
          dir = 45;
        }
        else if (rightDown) {
          pos.y += speed/20;
          dir = 135;
        }
      }
      else if (rightUp) {
        pos.y -= speed/20;
        dir = 0;
      }
      else if (rightDown) {
        pos.y += speed/20;
        dir = 180;
      }
    }
    println(dir);
    checkBoundaries();
  }
  /*
  void action() {
    if (team == 0){
      if (hasBall == 0 && gotBall){ //Shoot/Pass
        
      }
      else if (hasBall == 1){ //Tackle
      
      }
    }
    else {
      if (hasBall == 1 && gotBall){ //Shoot/Pass
        
      }
      else if (hasBall == 0){ //Tackle
      
      }
    }
  }
  */
  void checkBoundaries() {
    if (pos.x <= size/2) {
      pos.x = size/2;
    }
    if (pos.x >= width-size/2) {
      pos.x = width-size/2;
    }
    if (pos.y <= size/2) {
      pos.y = size/2;
    }
    if (pos.y >= height-size/2) {
      pos.y = height-size/2;
    }
  }
}
