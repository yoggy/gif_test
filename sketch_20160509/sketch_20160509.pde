//
//  sketch_20160509.pde
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
  if (t >= 1.0) {
    gif_finish();
  }

  float x = map_elastic_out(t, 1, 0, width*2/3);
  float y = map_linear(t, 1, 0, height);

  stroke(#000000);
  line(x, 0, x, height);
  line(0, y, width, y);

  gif_addFrame();
}