ball[] balls;
boolean reactionStarted;

void setup() {
  background(0);
  size(600, 600);  
  reactionStarted = false;
  balls = new ball[25];
  for( int i = 0; i < balls.length; i++ ) {
    balls[i] = new ball();
  }
}

void draw() {
  background(0);
  
  for( int i = 0; i < balls.length; i++ ) {
    if ( balls[i].state == 0 ) {
      balls[i].move();
      for ( int j = 0; j < balls.length; j++ ) {
        if ( balls[j].state == 1 && 
        ( pow((balls[j].x - balls[i].x), 2) + pow((balls[j].y - balls[i].y), 2) ) 
        < pow(( balls[j].rad + balls[i].rad ), 2) ) {
          balls[i].state = 1;
        }
      }
    }
    else if ( balls[i].state == 1) {
      balls[i].explode();
    }
  }
}

void mouseClicked() {
  if( !reactionStarted ) {
    balls[0].x = mouseX;
    balls[0].y = mouseY;
    balls[0].state = 1;
    reactionStarted = true;    
  }
}