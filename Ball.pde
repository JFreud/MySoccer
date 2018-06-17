class Ball {
  PVector pos, acc;
  PImage img;
  int size;
  boolean shot = false;
  ArrayList<Player> players;
  
  
  Ball(ArrayList<Player> players) {
    size = 20;
    pos = new PVector(width/2, height/2);
    acc = new PVector(0, 0);
    this.players = players;
    img = loadImage("soccerball.png");
  }
  
  void display() {
    fill (255);
    ellipse(pos.x, pos.y, size, size);
    //image(img, pos.x, pos.y, size * 3, size * 3);
    update();
  }
  
  void update() {
    int psize;
    PVector ppos = new PVector(0, 0);
    pos.x += acc.x;
    pos.y += acc.y;
    for (int i = 0; i < players.size(); i++) {
      psize = players.get(i).size;
      ppos.x = players.get(i).pos.x;
      ppos.y = players.get(i).pos.y;
      players.get(i).gotBall = false;
      if (dist(pos.x, pos.y, ppos.x, ppos.y) < psize + 5) {
        players.get(i).gotBall = true;
        pos.x = ppos.x + (sin(players.get(i).dir) * psize/2 * 1.4);
        pos.y = ppos.y - (cos(players.get(i).dir) * psize/2 * 1.4);
      } 
    }
    if (acc.x > 0) {
      acc.x *= .9;
    }
    if (acc.x < 0) {
      acc.x *= .9;
    }
    if (acc.y > 0) {
      acc.y *= .9;
    }
    if (acc.y < 0) {
      acc.y *= .9;
    }
    for (int i = 0; i < players.size(); i++) {
      if (players.get(i).gotBall && players.get(i).shot_power > 20 && players.get(i).shot_incr == 0) {
        println(players.get(i).shot_power);
        acc.x = sin(players.get(i).dir) * (float)players.get(i).shot_power;
        println("x");
        println(acc.x);
        acc.y = -1 * cos(players.get(i).dir) * (float)players.get(i).shot_power;
        println("y");
        println(acc.y);
      }
    }
    //if shot -> go in direction
    //if near player, stick to player (magnetism)
    //if new player near player, take ball
    checkBoundaries();
  }
  
  void checkBoundaries() {
    if (pos.x <= 0) {
      pos.x = 0;
      acc.x = -acc.x;
    }
    if (pos.x >= width) {
      pos.x = width;
      acc.x = -acc.x;
    }
    if (pos.y <= 0) {
      pos.y = 0;
      acc.y = -acc.y;
    }
    if (pos.y >= height) {
      pos.y = height;
      acc.y = -acc.y;
    }
  }  
  
  
}
