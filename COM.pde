class COM{
  Player AI; //Holds Actions/Stats
  int type; 
  
  COM(int team, int s, int p, int e, int type){
    AI = new Player(team, s, p, e);
    this.type = type;
  }
  
  void checkZone(){
    if (type == 0){ //Offense
      if (AI.pos.x <= width/2 && AI.team == 1) { 
         AI.pos.x = width/2; 
      }
      else if (AI.pos.x >= width/2 && AI.team == 0) {
        AI.pos.x = width/2;  
      }
    }
    else if (type == 1){ //LowerMid
      if (AI.pos.y <= height/2){
        AI.pos.y = height/2;
      }
    }
    else if (type == 2){ //UpperMid
      if (AI.pos.y >= height/2){
        AI.pos.y = height/2;  
      }
    }
    else if (type == 3){ //Defense
      if (AI.pos.x >= width/2 && AI.team == 1){
        AI.pos.x = width/2;  
      }
      else if (AI.pos.x <= width/2 && AI.team == 0){
        AI.pos.x = width/2;  
      }
    }
  }
  
}
