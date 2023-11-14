class Responive {
  isMobile(double width, double height) {
    // ignore: avoid_print
    print(width);
    if (width >= 780) {
      return 'tablet';
    } else {
      return 'mobile';
    }
  }
}
