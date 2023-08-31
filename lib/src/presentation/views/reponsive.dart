class Responive {
  isMobile(double width) {
    // ignore: avoid_print
    print(width);
    return width < 600 ? 'mobile' : 'tablet';
  }
}
