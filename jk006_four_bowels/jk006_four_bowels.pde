// Nov 2013
// http://jiyu-kenkyu.org
// http://kow-luck.com
// Based on a work at http://www.zenbullets.com // http://abandonedart.org/
//
// This work is licensed under a Creative Commons 3.0 License.
// (Attribution - NonCommerical - ShareAlike)
// http://creativecommons.org/licenses/by-nc-sa/3.0/
// 
// This basically means, you are free to use it as long as you:
// 1. give http://kow-luck.com a credit
// 2. don't use it for commercial gain
// 3. share anything you create with it in the same way I have
//
// If you want to use this work as free, or encourage me,
// please contact me via http://kow-luck.com/contact

//========================================
int NUM = 4;

Bowel[] bowel = new Bowel[NUM];
float W, xRadius, yRadius;

//========================================
void setup() {
  size(1280, 720); 
  frameRate(60);
  colorMode(RGB, 100);
  for (int i = 0; i < NUM; i++) {
    W = random(30, 200);
    xRadius = width  * random(0.50, 0.75);
    yRadius = height * random(0.50, 0.75);
    bowel[i] = new Bowel(W, xRadius, yRadius);
  }
  background(100);
}

//========================================
void draw() {
  for (int i = 0; i < NUM; i++) {
    bowel[i].drawMe();
  }
  println(frameRate);
}
//========================================
void mousePressed() {
  background(100);
}
//========================================
public class Bowel {
  float X, Y, W, H;
  float wInc, hInc;
  float xNoise, yNoise;
  float angle, xRadius, yRadius;

  //========================================
  Bowel(float _W, float _xRadius, float _yRadius) {
    W = _W;
    xRadius = _xRadius;
    yRadius = _yRadius;

    H = W/3*2;
    wInc = 0.5;
    hInc = wInc/3*2;

    angle  = random(360);
    xNoise = random(20);
    yNoise = random(10);
  }

  //========================================
  public void drawMe() {
    pushMatrix();
    translate(width/2, height/2);
    X = (xRadius * sin(radians(angle))) * noise(xNoise);
    Y = (yRadius * cos(radians(angle))) * noise(yNoise);
    angle += 1;
    xNoise += 0.005;
    yNoise += 0.010;
    W += wInc;
    H += hInc;
    stroke(0, 30);
    strokeWeight(10);
    fill(100, 30);
    ellipse(X, Y, W, H);
    if (angle > 360) {
      angle -= 360;
    }
    if (W > 200 || W < 30) {
      wInc *= -1;
      hInc *= -1;
    }
    popMatrix();
  }
}

