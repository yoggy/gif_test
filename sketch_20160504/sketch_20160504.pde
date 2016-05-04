//
//  sketch_20160503.pde
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

  float x = tsume_quad(t, 0, width, 1);
  float y = simple_linear_tweening(t, 0, height, 1);

  stroke(#000000);
  line(x, 0, x, height);
  line(0, y, width, y);

  gif_addFrame();
}

// http://gizma.com/easing/#l
float simple_linear_tweening(float t, float b, float c, float d) {
  return c * t / d + b;
}

float tsume_quad(float t, float b, float c, float d) {
  float y = 0.0;
  if (t / d < 0.5) {
    float t0 = (t / d * 2.0);
    float x = t0 - 1.0;
    y = c/2 * (1 - abs(x * x)) + b;
  }
  else {
    float t1 = (t / d * 2.0 - 1.0);
    float x = t1;
    y = c/2 * (1 + abs(x * x)) + b;
  }
  return y;
}