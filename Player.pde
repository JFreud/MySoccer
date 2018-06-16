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
    
    
  }
  
  
}
