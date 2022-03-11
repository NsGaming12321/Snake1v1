void setup() {
  size(600, 600);
  frameRate(60);
}

int gs = 60;
int ts = 10;
int dir = 1;
int dir2 = 3;
int px = 0;
int px2 = 590;
int py = 0;
int py2 = 590;
int vx = 0;
int vy = 0;
int vx2 = 0;
int vy2 = 0;
int cooldown = 7;
int pxcoord;
int pxcoord2;
int pycoord2;
int pycoord;
int[] thingX = {0};
int[] thingX2 = {59};
int[] thingY = {0};
int[] thingY2 = {59};
int counter = 0;
boolean gameOver = false;
boolean gameOver2 = false;
int scoreBlue = 0;
int scoreRed = 0;
boolean immunity = false;

void draw() {
  stroke(0);
  cooldown--;
  if (cooldown <= 0) {
    counter+=1;
    px += vx;
    px2 += vx2;
    py += vy;
    py2 += vy2;
    cooldown = 7;
    thingX = expand(thingX, thingX.length+1);
    thingX[counter] = pxcoord;
    thingY = expand(thingY, thingY.length+1);
    thingY[counter] = pycoord;
    thingX2 = expand(thingX2, thingX2.length+1);
    thingX2[counter] = pxcoord2;
    thingY2 = expand(thingY2, thingY2.length+1);
    thingY2[counter] = pycoord2;
    pxcoord = px/ts;
    pycoord = py/ts;
    pxcoord2 = px2/ts;
    pycoord2 = py2/ts;
    for (int i = 0; i < thingX.length; i++) {
      if (pxcoord2 == thingX[i] && pycoord2 == thingY[i] && immunity == false) {
        gameOver2 = true;
        scoreRed++;
        immunity = true;
      }
      if (pxcoord == thingX2[i] && pycoord == thingY2[i] && immunity == false) {
        gameOver = true;
        scoreBlue++;
        immunity = true;
      }
      fill(255,0,0);
      rect(thingX[i]*ts, thingY[i]*ts, ts, ts);
      fill(0,0,255);
      rect(thingX2[i]*ts,thingY2[i]*ts,ts,ts);
      if (pxcoord == thingX[i] && pycoord == thingY[i] && immunity == false) {
        gameOver = true;
        scoreBlue++;
        immunity = true;
      }
      
      if (pxcoord2 == thingX2[i] && pycoord2 == thingY2[i] && immunity == false) {
        gameOver2 = true;
        scoreRed++;
        immunity = true;
      }
    }
    if (px < 0) {
      px = 590;
      pxcoord = 59;
    }
    if (py > 590) {
      py = 0;
      pycoord = 0;
    }
    if (py < 0) {
      py = 590;
      pycoord = 59;
    }
    if (px > 590) {
      px = 0;
      pxcoord = 0;
    }
    if (px2 < 0) {
      px2 = 590;
      pxcoord2 = 59;
    }
    if (py2 > 590) {
      py2 = 0;
      pycoord2 = 0;
    }
    if (py2 < 0) {
      py2 = 590;
      pycoord2 = 59;
    }
    if (px2 > 590) {
      px2 = 0;
      pxcoord2 = 0;
    }
  }
  fill(255, 0, 0);
  rect(px, py, ts, ts);
  fill(0,0,255);
  rect(px2, py2, ts, ts);
  if (dir == 1) {
    vx = ts;
    vy = 0;
  }
  if (dir == 2) {
    vy = ts;
    vx = 0;
  }
  if (dir == 3) {
    vx = -ts;
    vy = 0;
  }
  if (dir == 4) {
    vy = -ts;
    vx = 0;
  }
  if (dir2 == 1) {
    vx2 = ts;
    vy2 = 0;
  }
  if (dir2 == 2) {
    vy2 = ts;
    vx2 = 0;
  }
  if (dir2 == 3) {
    vx2 = -ts;
    vy2 = 0;
  }
  if (dir2 == 4) {
    vy2 = -ts;
    vx2 = 0;
  }
  if (gameOver == true) {
    fill(0,0,255);
    rect(-1, -1, 1000, 1000);
    fill(0);
    textSize(30);
    text("Red: " + scoreRed,200,300);
    text("Blue: " + scoreBlue,400,300);
    text("Blue WINS!", 300, 200);
  }
  if (gameOver2 == true) {
    fill(255,0,0);
    rect(-1, -1, 1000, 1000);
    fill(0);
    textSize(30);
    text("Red: " + scoreRed,300,300);
    text("Blue: " + scoreBlue,400,300);
    text("Red WINS!", 300, 200);
  }
}

void keyPressed() {
  if (keyCode == RIGHT && dir != 3) {
    dir = 1;
  }
  if (keyCode == DOWN && dir != 4) {
    dir = 2;
  }
  if (keyCode == LEFT && dir != 1) {
    dir = 3;
  }
  if (keyCode == UP && dir != 2) {
    dir = 4;
  }
  if (key == 'd' && dir2 != 3) {
    dir2 = 1;
  }
  if (key == 's' && dir2 != 4) {
    dir2 = 2;
  }
  if (key == 'a' && dir2 != 1) {
    dir2 = 3;
  }
  if (key == 'w' && dir2 != 2) {
    dir2 = 4;
  }
  if (keyCode == ' ') {
    immunity = false;
    gameOver = false;
    gameOver2 = false;
    background(255);
    for (int i = 0; i <= thingX.length-1; i++) {
      thingX[i] = 0;
      thingY[i] = 0;
    }
    for (int i = 0; i <= thingX2.length-1; i++) {
      thingX2[i] = 0;
      thingY2[i] = 0;
    }
    thingX[thingX.length-1] = 0;
    thingY[thingY.length-1] = 0;
    thingX2[thingX2.length-1] = 0;
    thingY2[thingY2.length-1] = 0;
    px = 0;
    py = 0;
    px2 = 590;
    py2 = 590;
    pxcoord = 0;
    pycoord = 0;
    pxcoord2 = 59;
    pycoord2 = 59;
    dir = 1;
    dir2 = 3;
    counter = 0;
  }
}
