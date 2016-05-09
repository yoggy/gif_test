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