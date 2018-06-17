 Ball ball;
 ArrayList<Player> teamLeft;
 ArrayList<Player> teamRight;
 ArrayList<Player> allPlayers;
 int scoreLeft, scoreRight;
 int hasBall; //Which team has the ball, relates with player actions
 double time;
 
 boolean leftUp, leftDown, leftLeft, leftRight;
 boolean rightUp, rightDown, rightLeft, rightRight;
 boolean rightAction, leftAction;
 
 void setup() {
   size(1200, 700);
   background(0, 125, 0);
   strokeWeight(10);
   stroke(255);
   line(width/2, 0, width/2, height);
   strokeWeight(1);
   stroke(0);
   scoreLeft = 0;
   scoreRight = 0;
   fill(255, 0, 0);
   text(scoreLeft, width/4, 10);
   fill(0, 0, 255);
   text(scoreRight, width*3/4, 10);
   time = 0;
   noCursor();
   hasBall = 0;
   teamLeft = new ArrayList<Player>();
   teamLeft.add(new Player(0, 80, 80));
   //fill team left
   teamRight = new ArrayList<Player>();
   teamRight.add(new Player(1, 80, 80));
   //fill team right
   allPlayers = new ArrayList<Player>();
   allPlayers.addAll(teamLeft);
   allPlayers.addAll(teamRight);
   ball = new Ball(allPlayers);
 }
 
 void draw() {
   gameState();
   if (time >= 90) {
     endGame();
   }
 }
 
 void whoHasBall(){
   for (int i = 0; i < teamLeft.size(); i++){
     if (teamLeft.get(i).gotBall){
       hasBall = 0;
       return;  
     }
   }
   for (int i = 0; i < teamRight.size(); i++){
     if (teamRight.get(i).gotBall){
       hasBall = 1;
       return;  
     }
   }
 }
 
 
 void endGame() {
   background(0);
   textSize(40);
   text("Game Ended", width/2 - 100, height/2);
   text("Score: " + scoreLeft, width/2 - 90, height/2 + 30);
   noLoop();
 }
 
 void gameState() {
   background(0, 125, 0);
   strokeWeight(10);
   stroke(255);
   line(width/2, 0, width/2, height);
   strokeWeight(1);
   stroke(0);
   fill(255, 0, 0);
   textSize(40);
   text(scoreLeft, width/4, 40);
   fill(0, 0, 255);
   text(scoreRight, width*3/4, 40);
   ball.display();
   for (int i = 0; i < allPlayers.size(); i++) {
     allPlayers.get(i).display();
   }
 }
 
 
void keyPressed() {
  //left player
  if (key == 'w') { leftUp = true; }
  if (key == 'a') { leftLeft = true; }
  if (key == 's') { leftDown = true; }
  if (key == 'd') { leftRight = true; }
  
  //right player
  if (key == CODED) { 
    if (keyCode == UP) {
      rightUp = true; 
    }
  }
  if (key == CODED) { 
    if (keyCode == DOWN) {
      rightDown = true; 
    }
  }
  if (key == CODED) { 
    if (keyCode == LEFT) {
      rightLeft = true; 
    }
  }
  if (key == CODED) { 
    if (keyCode == RIGHT) {
      rightRight = true; 
    }
  }
  if (key == ',') {
    rightAction = true;
  }
  if (key == CODED) {
    if (keyCode == CONTROL){
      leftAction = true;
    }
  }
}

void keyReleased() {
  //left player
  if (key == 'w') { leftUp = false; }
  if (key == 'a') { leftLeft = false; }
  if (key == 's') { leftDown = false; }
  if (key == 'd') { leftRight = false; }
  
  //right player
  if (key == CODED) { 
    if (keyCode == UP) {
      rightUp = false; 
    }
  }
  if (key == CODED) { 
    if (keyCode == DOWN) {
      rightDown = false; 
    }
  }
  if (key == CODED) { 
    if (keyCode == LEFT) {
      rightLeft = false; 
    }
  }
  if (key == CODED) { 
    if (keyCode == RIGHT) {
      rightRight = false; 
    }
  }
  if (key == ',') {
    rightAction = false;
  }
  if (key == CODED) {
    if (keyCode == CONTROL){
      leftAction = false;
    }
  }
}
