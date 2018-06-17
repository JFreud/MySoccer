class Player {
  PVector pos;
  float dir;
  int team, size; 
  int speed, power; //Stats
  boolean gotBall;
  boolean tackling, kicking, down;
  
  Player(int team, int s, int p) {
    size = 30;
    this.team = team;
    speed = s;
    power = s;
    gotBall = false;
    tackling = false;
    kicking = false;
    down = false;
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
        dir = PI*3/2;
        if (leftUp) {
          pos.y -= speed/20;
          dir = PI*7/4;
        }
        else if (leftDown) {
          pos.y += speed/20;
          dir = PI*5/4;
        }
      }
      else if (leftRight) {
        pos.x += speed/20;
        dir = PI/2;
        if (leftUp) {
          pos.y -= speed/20;
          dir = PI/4;
        }
        else if (leftDown) {
          pos.y += speed/20;
          dir = PI*3/4;
        }
      }
      else if (leftUp) {
        pos.y -= speed/20;
        dir = 0;
      }
      else if (leftDown) {
        pos.y += speed/20;
        dir = PI;
      }
    }
    
    else {
      if (rightLeft) {
        pos.x -= speed/20;
        dir = PI*3/2;
        if (rightUp) {
          pos.y -= speed/20;
          dir = PI*7/4;
        }
        else if (rightDown) {
          pos.y += speed/20;
          dir = PI*5/4;
        }
      }
      else if (rightRight) {
        pos.x += speed/20;
        dir = PI/2;
        if (rightUp) {
          pos.y -= speed/20;
          dir = PI/4;
        }
        else if (rightDown) {
          pos.y += speed/20;
          dir = PI*3/4;
        }
      }
      else if (rightUp) {
        pos.y -= speed/20;
        dir = 0;
      }
      else if (rightDown) {
        pos.y += speed/20;
        dir = PI;
      }
    }
    println(dir);
    checkBoundaries();
  }
  
  void action() {
    if (team == 0){
      if (hasBall == 0 && gotBall){ //Shoot/Pass        
        kicking = true;
      }
      else if (hasBall == 1){ //Tackle
        tackling = true;      
      }
    }
    else {
      if (hasBall == 1 && gotBall){ //Shoot/Pass        
        kicking = true;
      }
      else if (hasBall == 0){ //Tackle
        tackling = true;
      }
    }
  }
  
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
