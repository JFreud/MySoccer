class Ball {
  PVector dir, pos;
  int size;
  boolean shot = false;
  ArrayList<Player> players;
  
  
  Ball(ArrayList<Player> players) {
    size = 10;
    pos = new PVector(width/2, height/2);
    dir = new PVector(width/2, height/2);
    this.players = players;
  }
  
  void display() {
    fill (0, 255, 0);
    ellipse(pos.x, pos.y, size, size);
    update();
  }
  
  void update() {
    //if shot -> go in direction
    //if near player, stick to player (magnetism)
    //if new player near player, take ball
  }
  
  
}
