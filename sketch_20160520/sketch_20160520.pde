//
//  sketch_20160520.pde
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

public void setup() {
  size(256, 256);
  frameRate(frame_rate);

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
  }
  if (t >= 1.0) {
    gif_finish();
  }

  float t_p = 0.5;
  float th;
  if (t < t_p) {
    th = map_tame_in_out(t, t_p, 0, PI/2, 3);
  }
  else {
    th = PI/2;
  }

  stroke(#000000);

  translate(width/2, height/2);
  rotate(th);
  rect(-50, -50, 100, 100);

  gif_addFrame();
}