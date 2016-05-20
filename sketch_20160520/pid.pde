//
//  pid.pde
//
// github:
//     https://github.com/yoggy/gif_test
//
// license:
//     Copyright (c) 2016 yoggy <yoggy0@gmail.com>
//     Released under the MIT license
//     http://opensource.org/licenses/mit-license.php;
//

class PID {
  float pos_start;
  float pos_target;

  float k_p;
  float k_i;
  float k_d;
  
  float pos_now;
  float pos_old;

  float err_now;
  float err_old;
  
  float err_total;
  
  PID(float pos_start, float pos_target, float k_p, float k_i, float k_d) {
    this.pos_start = pos_start;
    this.pos_target = pos_target;
    this.pos_now = pos_start;

    this.k_p = k_p;
    this.k_i = k_i;
    this.k_d = k_d;
    
    reset();
  }
  
  void reset() {
    pos_now = pos_start;
    pos_old = pos_start;
    
    err_now = 0;
    err_old = 0;
    
    err_total = 0;
  }
  
  void step() {
    err_old = err_now;
    err_now = pos_target - pos_now;
        
    float val_p = k_p * err_now;
    float val_i = k_i * err_total;
    float val_d = k_d * (err_now - err_old);
    
    float pos_new = pos_now + val_p + val_i + val_d;

    err_total += err_now;

    pos_old = pos_now;
    pos_now = pos_new;
  }
  
  float getPosNow() {
    return pos_now;
  }
}