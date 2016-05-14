//
//  gravity.pde
//
// github:
//     https://github.com/yoggy/gif_test
//
// license:
//     Copyright (c) 2016 yoggy <yoggy0@gmail.com>
//     Released under the MIT license
//     http://opensource.org/licenses/mit-license.php;
//

class Gravity {
  float pos_start;
  float pos_target;

  float k_p;
  float k_v;
  
  float p_now;
  float p_target;
  float v_now;
  
  Gravity(float pos_start, float pos_target, float k_p, float k_v) {
    this.pos_start = pos_start;
    this.pos_target = pos_target;

    this.k_p = k_p;
    this.k_v = k_v;
    
    this.p_target = 1;
    
    reset();
  }
  
  void reset() {
    p_now = 0;   
    v_now = 0;
  }
  
  void step() {
    float diff = p_target - p_now;
    float diff_dir = diff >= 0 ? 1 : -1;
    float a = k_p * diff_dir * pow(diff, 2) - k_v * v_now;
    
    v_now += a;
    p_now += v_now;    
  }
  
  float getPosNow() {
    float diff = pos_target - pos_start;
    return pos_start + diff * p_now;
  }
}