class Player {
  PVector pos;
  float dir;
  int team, size; 
  int speed, power; //Stats
  boolean gotBall;
  boolean tackling, kicking, down, shot;
  double shot_power;
  double shot_incr;
  double speedTmp;
  
  Player(int team, int s, int p) {
    size = 30;
    this.team = team;
    speed = s;
    power = s;
    gotBall = false;
    tackling = false;
    kicking = false;
    down = false;
    speedTmp = 0;
    shot_incr = power * 0.0000001;
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
    if (hasBall != team) {
      tackling = true;
      kicking = false;
    }
    else if (gotBall) {
      kicking = true;
      tackling = false;
    }
    else {
      kicking = false;
      tackling = false;
    }
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
    if (gotBall) {
      action();
    }
    checkBoundaries();
  }
  
  void action() {
    if (shot_incr == 0) {
      shot_power = 20;
      speedTmp = 0;
    }
    shot_incr = power * 0.005;
    if (team == 0 && leftAction) {
      shot_power += shot_incr;
      if (shot_power >= power/2){
        leftAction = false;
        shot_incr = 0;
      }
      speedTmp += .001;
    }
    else if (team == 1 && rightAction) {
      shot_power += shot_incr;
      if (shot_power >= power/2){
        rightAction = false;
        shot_incr = 0;
      }
      speedTmp += .001;
    }
    if (team == 0 && !leftAction) {
      shot_incr = 0;
    }
    if (team == 1 && !rightAction) {
      shot_incr = 0;
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
