class Responive {
  isMobile(double width, double height) {
    // ignore: avoid_print
    print(width);
    if (width <= 780 && height >= 400) {
      return width <= 780 ? 'mobile' : 'tablet';
    } else {
      return 'mobile';
    }
  }
}
