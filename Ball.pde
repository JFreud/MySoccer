class Ball {
  PVector pos, acc;
  int size;
  boolean shot = false;
  ArrayList<Player> players;
  
  
  Ball(ArrayList<Player> players) {
    size = 10;
    pos = new PVector(width/2, height/2);
    acc = new PVector(width/2, height/2);
    this.players = players;
  }
  
  void display() {
    fill (255);
    ellipse(pos.x, pos.y, size, size);
    update();
  }
  
  void update() {
    int psize;
    PVector ppos = new PVector(0, 0);
    for (int i = 0; i < players.size(); i++) {
      psize = players.get(i).size;
      ppos.x = players.get(i).pos.x;
      ppos.y = players.get(i).pos.y;
      if (dist(pos.x, pos.y, ppos.x, ppos.y) < psize + 5) {
        pos.x = ppos.x - 1.2 * psize/2 * cos(players.get(i).dir);
        pos.y = ppos.y + 1.2 * psize/2 * sin(players.get(i).dir);
      }
    }
    if (acc.x > 0) {
      acc.x -= 2;
    }
    if (acc.y > 0) {
      acc.y -= 2;
    }
    
    //if shot -> go in direction
    //if near player, stick to player (magnetism)
    //if new player near player, take ball
    checkBoundaries();
  }
  
  void checkBoundaries() {
    if (pos.x <= 0 || pos.x >= width) {
      acc.x = -acc.x;
    }
    if (pos.y <= 0 || pos.y >= height) {
      acc.y = -acc.y;
    }
    if (acc.x < 0) {
      acc.x = 0;
    }
    if (acc.y < 0) {
      acc.y = 0;
    }
  }  
  
  
}
