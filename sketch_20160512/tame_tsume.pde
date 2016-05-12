//
//  tame_tsume.pde
//
// github:
//     https://github.com/yoggy/gif_test
//
// license:
//     Copyright (c) 2016 yoggy <yoggy0@gmail.com>
//     Released under the MIT license
//     http://opensource.org/licenses/mit-license.php;
//

float map_linear(float t, float duration, float start, float end) {
  float diff = end - start;
  return diff * t / duration + start;
}

float map_tame_in(float t, float duration, float start, float end, float p) {
  float diff = end - start;
  float y = 0.0;

  float t0 = (t / duration);
  float x = t0;
  y = diff * (abs(pow(x, p))) + start;

  return y;
}

float map_tame_out(float t, float duration, float start, float end, float p) {
  float diff = end - start;
  float y = 0.0;

  float t0 = (t / duration);
  float x = t0 - 1.0;
  y = diff * (1 - abs(pow(x, p))) + start;

  return y;
}

float map_tame_in_out(float t, float duration, float start, float end, float p) {
  float y = 0.0;

  if (t / duration < 0.5) {
    float t0 = t / duration; // range: 0.0-0.5
    y = map_tame_in(t0, 0.5, start, end/2.0, p);
  } else {
    float t0 = (t / duration - 0.5); // range: 0.5-1.0 -> 0.0-0.5
    y = map_tame_out(t0, 0.5, start + end/2.0, end, p);
  }
  return y;
}

float map_tsume_in_out(float t, float duration, float start, float end, float p) {
  float y = 0.0;

  if (t / duration < 0.5) {
    float t0 = t / duration; // range: 0.0-0.5
    y = map_tame_out(t0, 0.5, start, end/2.0, p);
  } else {
    float t0 = (t / duration - 0.5); // range: 0.5-1.0 -> 0.0-0.5
    y = map_tame_in(t0, 0.5, start + end/2.0, end, p);
  }
  return y;
}

// http://www.timotheegroleau.com/Flash/experiments/easing_function_generator.htm
float map_elastic_out(float t, float duration, float start, float end) {
  float y = 0.0;
  float diff = end - start;

  float t0 = t / duration;

  float ts = t0 * t0;
  float tc = ts * t0;
  
  y = start + diff * (56*tc*ts + -175*ts*ts + 200*tc + -100*ts + 20*t0);
  return y;
}

float map_bounce_out(float t, float duration, float start, float end) {
  float y = 0.0;
  float diff = end - start;

  float t0 = t / duration;

  // see also : https://github.com/d3/d3-ease/blob/master/src/bounce.js
  float b1 = 4 / 11.0;
  float b2 = 6 / 11.0;
  float b3 = 8 / 11.0;
  float b4 = 3 / 4.0;
  float b5 = 9 / 11.0;
  float b6 = 10 / 11.0;
  float b7 = 15 / 16.0;
  float b8 = 21 / 22.0;
  float b9 = 63 / 64.0;
  float b0 = 1 / b1 / b1;

  float p = t0 < b1 ? b0 * t * t : t < b3 ? b0 * (t -= b2) * t + b4 : t < b6 ? b0 * (t -= b5) * t + b7 : b0 * (t -= b8) * t + b9;

  return start + diff * p;
}