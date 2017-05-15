class ball {
  float x;
  float y;
  float rad;
  float dx;
  float dy;
  int state;
  color c;
  
ball() {
  float r = random(256);
  float g = random(256);
  float b = random(256);
  state = 0;
  c = color(r,g,b);
  rad = 10;
  x = random(( width - rad ) + rad/2);
  y = random(( height - rad ) +rad/2);
  dx = random(10) - 5;
  dy = random(10) - 5;
  fill(c);
  ellipse(x,y,rad,rad);
}

void move() {
  //System.out.println(x + " " + y);
  bounce();
  x = x + dx;
  y = y + dy;
  fill(c);
  ellipse(x,y,10,10);
}

void bounce() {
  if ( x <= 0 || x >= 600) {
    dx *= -1;
  }
  
  if ( y <= 0 || y >= 600 ) {
    dy *= -1;
  }
}

void explode() {
  if (rad == 100) {
    state = 2;
    }
  else {
    dx = 0;
    dy = 0;
    fill(c);
    ellipse(x,y,rad,rad);
    rad += .5;    
  }
} 
  
}