// class Responsive extends StatelessWidget {
//   const Responsive({
//     super.key,
//     required this.width,
//   });
//   final double width;
//   @override
//   Widget build(BuildContext context) {
//     return re;
//   }
// }

class Responive {
  isMobile(double width) {
    print(width);
    return width < 600 ? 'mobile' : 'tablet';
  }
}
