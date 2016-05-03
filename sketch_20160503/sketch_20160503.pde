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

  float x = cubic_easing_in_out(t, 0, width, 1);
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

// http://gizma.com/easing/#cub3
float cubic_easing_in_out(float t, float b, float c, float d) {
  t /= d / 2;
  if (t < 1) return c /2 * t * t * t + b;
  t -= 2;
  return c / 2 * (t * t * t + 2) + b;
}