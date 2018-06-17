class COM extends Player{
  int type; 
  PVector durr;
  Ball ball;
  float easing = 0.05;
  
  COM(int team, int s, int p, int e, int type){
    super(team, s, p, e);
    this.isHuman = false;
    durr = new PVector(width/2, height/2);
    this.type = type;
  }
  
  void checkZone(){
    if (type == 0){ //Offense
      if (pos.x >= width/2 && team == 1) { 
         pos.x = width/2 - 1; 
      }
      else if (pos.x <= width/2 && team == 0) {
        pos.x = width/2 + 1;  
      }
    }
    else if (type == 1){ //LowerMid
      if (pos.y <= height/2){
        pos.y = height/2;
      }
    }
    else if (type == 2){ //UpperMid
      if (pos.y >= height/2){
        pos.y = height/2;  
      }
    }
    else if (type == 3){ //Defense
      if (pos.x <= width/2 && team == 1){
        pos.x = width/2 + 1; 
        println("posx");
        println(pos.x);
      }
      else if (pos.x >= width/2 && team == 0){
        pos.x = width/2 - 1;  
      }
    }
  }
  
  void update(float ballX, float ballY) {
    follow(ballX, ballY);
    checkZone();
    checkBoundaries();
    if (gotBall) {
      if (team == 0) {
        dir = 90;
        kick();
      }
      else {
        dir = 270;
        kick();
      }
    }
  }
  
  
  
  
  //void follow(float ballX, float ballY) { //follow
  //  durr.set(ballX, ballY);
  //  PVector target = PVector.sub(durr, pos);
  //  target.normalize();
  //  float angle = atan2(ballY - target.y, ballX - target.x);
  //  float newX = cos(angle) * speed + pos.x;
  //  float newY = sin(angle) * speed + pos.y;
  //  target.mult(3);
  //  pos.add(target);
  //}
  
  void follow(float ballX, float ballY) {
     float angle = atan2(ballY - pos.y, ballX - pos.x);
     float newX = cos(angle) * speed;
     float newY = sin(angle) * speed;
     pos.x += newX;
     pos.y += newY;
  }
  
  //void follow(float ballX, float ballY) {
  //  if (ballY > pos.y) {
  //    pos.y += 10;
  //  }
  //  else if (ballY < pos.y) {
  //    pos.y -= 10; 
  //  }
  //  if (ballX > pos.x) {
  //    pos.x += 10;
  //  }
  //  else if (ballX < pos.x) {
  //    pos.x -= 10; 
  //  }
  //}
  
  //void follow(float ballX, float ballY) {
  //  float dx = ballX - pos.x;
  //  pos.x += dx * easing;
  //  float dy = ballY - pos.y;
  //  pos.y += dy * easing;
  //}
  
  
  PVector quantize2dVector(PVector v, int units) {
    float d = dist(v.x, v.y,0,0);
    float a = atan2(v.y,v.x);
    a = round(a*units/TWO_PI) * TWO_PI/units;
    return new PVector( cos(a)*d, sin(a)*d );
  }
  
}
