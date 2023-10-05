class Responive {
  isMobile(double width) {
    // ignore: avoid_print
    print(width);
    return width <= 780 ? 'mobile' : 'tablet';
  }
}
