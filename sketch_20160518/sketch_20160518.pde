//
//  sketch_20160506.pde
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

  float th = map_linear(t, 1, 0, PI/2);

  stroke(#000000);

  translate(width/2, height/2);
  rotate(th);
  rect(-50, -50, 100, 100);

  gif_addFrame();
}