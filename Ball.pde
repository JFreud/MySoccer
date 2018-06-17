class Ball {
  PVector pos, acc;
  PImage img;
  int size;
  ArrayList<Player> players;
  
  
  Ball(ArrayList<Player> players) {
    size = 20;
    pos = new PVector(width/2, height/2);
    acc = new PVector(0, 0);
    this.players = players;
    img = loadImage("soccerball.png");
    updateCOM();
  }
  
  void updateCOM() {
    for (int i = 0; i < players.size(); i++) {
      if (players.get(i).isHuman == false) {
         players.get(i).update(pos.x, pos.y);
      }
    }
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
    updateCOM();
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
      
      if (players.get(i).kickStrength > 0 && (players.get(i).kickTimer == 0 || (!leftAction && players.get(i).team == 0))){ //Checks if ending kicking action
        acc.x = sin(players.get(i).dir) * (float)players.get(i).kickStrength;
        acc.y = -1 * cos(players.get(i).dir) * (float)players.get(i).kickStrength;
        players.get(i).kickStrength = 0;
      }
      if (players.get(i).kickStrength > 0 && (players.get(i).kickTimer == 0 || (!rightAction && players.get(i).team == 1))){ //Checks if ending kicking action
        acc.x = sin(players.get(i).dir) * (float)players.get(i).kickStrength;
        acc.y = -1 * cos(players.get(i).dir) * (float)players.get(i).kickStrength;
        players.get(i).kickStrength = 0;
      }
      println("Timer: " + players.get(i).sprintTimer + "\nSpeed: " + players.get(i).sprintSpeed + "\nrunD: " + players.get(i).runD);
      if (players.get(i).sprintSpeed > 0){ //Sprinting
          players.get(i).sprintSpeed -= players.get(i).runD;
      }
      else if (players.get(i).sprintSpeed <= 0 && players.get(i).sprintTimer > 0){ //Reloading
        players.get(i).sprintSpeed = 0;
        players.get(i).sprintTimer--;  
        println("reloading");
      }
    }
    if (acc.x > 0 || acc.x < 0) {
      acc.x *= .9;
    }
    if (acc.y > 0 || acc.y < 0) {
      acc.y *= .9;
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
  
  int inGoal(){
    if (pos.x == 0 && pos.y >= height/2-240 && pos.y <= height/2+80){
      return 1;
    }
    else if (pos.x == width && pos.y >= height/2-240 && pos.y <= height/2+80){
      return 0;
    }
    return -1;
  }
}
