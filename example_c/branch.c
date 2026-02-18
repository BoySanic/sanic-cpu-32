int get_second_value(int val) {
  if(val == 1) {
    return 0;
  }
  if(val == 2) {
    return 13;
  }
  if(val == 3) {
    return 14;
  }
  if(val == 4) {
    return 24;
  }
  if(val == 20) {
    return 50;
  }
  if(val < 0) {
    return 25;
  }
  if(val > 100) {
    return 26;
  }
  else {
    return -5;
  }
}

