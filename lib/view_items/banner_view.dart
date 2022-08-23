// import 'package:flutter/material.dart';


// class BannerView extends StatelessWidget {
//   const BannerView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: const [
//         Positioned.fill(
//           child: BannerImageView(),
//         ),
//         Positioned.fill(
//           child: GradientView(),
//         ),
//         Align(
//           alignment: Alignment.bottomLeft,
//           child: Padding(
//             padding: EdgeInsets.all(MARGIN_MEDIUM_2),
//             child: BannerTitleView(),
//           ),
//         ),
//         Align(
//           alignment: Alignment.center,
//           child: PlalyButtonView(),
//         ),
//       ],
//     );
//   }
// }

// class BannerTitleView extends StatelessWidget {
//   const BannerTitleView({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'The Wolverine 2022...',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: TEXT_HEADING_1X,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         Text(
//           'Offical Review',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: TEXT_HEADING_1X,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class BannerImageView extends StatelessWidget {
//   const BannerImageView({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Image.network(
//       'https://th.bing.com/th/id/R.94638f3dd33518cc968da35df228563b?rik=G2ptvYFMU68%2fXQ&riu=http%3a%2f%2fallhdwallpapers.com%2fwp-content%2fuploads%2f2015%2f04%2fthe-wolverine-2.jpg&ehk=vw7RrPN8a4ZkeuRqLRgVulaxb0P0sXl6iQpxwLNmETA%3d&risl=&pid=ImgRaw&r=0',
//       fit: BoxFit.cover,
//     );
//   }
// }
