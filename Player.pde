class Player {
  PVector pos;
  int team, size;
  
  Player(int team) {
    size = 30;
    this.team = team;
    if (team == 0) {
      pos = new PVector(width/4, height/2);
    }
    else {
      pos = new PVector(width*3/4, height/2);
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
    if (team == 0) {
      if (leftUp) {
        pos.y -= 5;
      }
      else if (leftDown) {
        pos.y += 5;
      }
      if (leftLeft) {
        pos.x -= 5;
      }
      else if (leftRight) {
        pos.x += 5;
      }
    }
    else {
      if (rightUp) {
        pos.y -= 5;
      }
      else if (rightDown) {
        pos.y += 5;
      }
      if (rightLeft) {
        pos.x -= 5;
      }
      else if (rightRight) {
        pos.x += 5;
      }
    }
    checkBoundaries();
  }
  
  void checkBoundaries() {
    if (pos.x <= 0) {
      pos.x = 0;
    }
    if (pos.x >= width) {
      pos.x = width;
    }
    if (pos.y <= 0) {
      pos.y = 0;
    }
    if (pos.y >= height) {
      pos.y = height;
    }
  }  
  
}
