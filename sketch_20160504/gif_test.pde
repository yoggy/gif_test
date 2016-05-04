//
//  gif_test.pde
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

GifMaker gif_;

void gif_setup(PApplet papplet) {
  gif_ = new GifMaker(papplet, papplet.getClass().getName() + ".gif");
  gif_.setRepeat(0);
}

void gif_finish() {
  if (gif_ != null) {
    gif_.finish();
    exit();
  }
}

void gif_addFrame() {
  if (gif_ != null) {
    gif_.setDelay(16);
    gif_.addFrame();  
  }
}