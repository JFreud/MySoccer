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
 
 boolean[] keys = new boolean[255];
 boolean[] keyCodes = new boolean[255];
 
 void setup() {
   size(1000, 720);
   background(0);
   scoreLeft = 0;
   scoreRight = 0;
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
   fill(255, 0, 255);
   ball.display();
   for (int i = 0; i < allPlayers.size(); i++) {
     allPlayers.get(i).display();
   }
 }
 
 //void updatePlayers() {
 //  for (int i = 0; i < teamLeft.size(); i++) {
     
 //  }
 //  for (int i = 0; i < teamRight.size(); i++) {
     
 //  }
   
   
 //}
 
 
//void keyPressed() {
//  if (key == 'm') {
//    //for (int i = 0; i < allPlayers.size(); i++) {
//    //  if (allPlayers.get(i).gotBall) {
//    //    println(allPlayers.get(i).dir);
//    //  }
//    //}
//    rightAction = true;
//  }
//  if (key == 'q' || key == 'Q') {
//    println("pressed key: " + key);
//    for (int i = 0; i < allPlayers.size(); i++) {
//      if (allPlayers.get(i).gotBall) {
//        println(allPlayers.get(i).dir);
//      }
//    }
//    leftAction = true;
//  }
//  //left player
//  if (key == 'w') { leftUp = true; }
//  if (key == 'a') { leftLeft = true; }
//  if (key == 's') { leftDown = true; }
//  if (key == 'd') { leftRight = true; }
  
//  //right player
//  if (key == CODED) { 
//    if (keyCode == UP) {
//      rightUp = true; 
//    }
//  }
//  if (key == CODED) { 
//    if (keyCode == DOWN) {
//      rightDown = true; 
//    }
//  }
//  if (key == CODED) { 
//    if (keyCode == LEFT) {
//      rightLeft = true; 
//    }
//  }
//  if (key == CODED) { 
//    if (keyCode == RIGHT) {
//      rightRight = true; 
//    }
//  }
//}

//void keyReleased() {
//  //left player
//  if (key == 'w') { leftUp = false; }
//  if (key == 'a') { leftLeft = false; }
//  if (key == 's') { leftDown = false; }
//  if (key == 'd') { leftRight = false; }
  
//  //right player
//  if (key == CODED) { 
//    if (keyCode == UP) {
//      rightUp = false; 
//    }
//  }
//  if (key == CODED) { 
//    if (keyCode == DOWN) {
//      rightDown = false; 
//    }
//  }
//  if (key == CODED) { 
//    if (keyCode == LEFT) {
//      rightLeft = false; 
//    }
//  }
//  if (key == CODED) { 
//    if (keyCode == RIGHT) {
//      rightRight = false; 
//    }
//  }
//  if (key == 'm') {
//    rightAction = false;
//  }
//  if (key == 'q' || key == 'Q') {
//    leftAction = false;
//  }
//}

void keyPressed() {
  if (key == CODED) {
    keyCodes[keyCode] = true;
  }
  else {
    keys[key] = true;
  }
}

void keyReleased() {
  if (key == CODED) {
    keyCodes[keyCode] = false;
  }
  else {
    keys[key] = false;
  }
}
