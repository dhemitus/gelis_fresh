import 'dart:math';

class MathUtilities {
  static int range(int min, int max) {
    return min + Random().nextInt((max + 1) - min);
  }  
}
