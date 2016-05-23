//
//  sketch_20160523.pde
//
// github:
//     https://github.com/yoggy/gif_test
//
// license:  
//     Copyright (c) 2016 yoggy <yoggy0@gmail.com>
//     Released under the MIT license
//     http://opensource.org/licenses/mit-license.php;
//
int frame_rate = 60;

PID pid;

public void setup() {
  size(256, 256);
  frameRate(frame_rate);

  pid = new PID(0, PI/2, 0.2, 0.0, -0.5);

  gif_setup(this);
}

void draw() {
  background(#ffffff);
  noFill();
  stroke(#000000);
  rect(0, 0, width-1, height-1);

  // t = 0.0 -> 1.0
  float t = (frameCount % (frame_rate + 1)) / (float)frame_rate;
  if (t == 0.0) {
    pid.reset();
  }
  if (t >= 1.0) {
    gif_finish();
  }

  pid.step();

  float t_p = 0.5;
  float th = pid.getPosNow();

  stroke(#000000);

  translate(width/2, height/2);
  rotate(th);
  rect(-50, -50, 100, 100);

  gif_addFrame();
}