//
//  sketch_20160502.pde
//
// github:
//     https://github.com/yoggy/gif_test
//
// license:
//     Copyright (c) 2016 yoggy <yoggy0@gmail.com>
//     Released under the MIT license
//     http://opensource.org/licenses/mit-license.php;
//
import gifAnimation.*; // https://github.com/extrapixel/gif-animation/tree/3.0

GifMaker gif;

public void setup() {
  size(256, 256);
  frameRate(60);

  gif = new GifMaker(this, "sketch_20160502.gif");
  gif.setRepeat(0);
}

void draw() {
  background(#ffffff);
  noFill();
  stroke(#000000);
  rect(0, 0, width-1, height-1);
    
  float t = frameCount / 60.0;
  if (t >= 1.0) {
    gif.finish();
    exit();
  }
  
  float x = t * width;
  float y = t * height;
  
  stroke(#000000);
  line(x, 0, x, height);
  line(0, y, width, y);

  gif.setDelay(16);
  gif.addFrame();  
}