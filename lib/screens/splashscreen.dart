// import 'package:flutter/material.dart';
// import 'product_list_screen.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Future.delayed(const Duration(seconds: 3), () {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => const ProductListScreen()),
//       );
//     });

//     return Scaffold(
//       backgroundColor: const Color(0xFF2C2C54), // Dark blue background
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 shape: BoxShape.circle,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.2),
//                     blurRadius: 10,
//                     spreadRadius: 5,
//                   ),
//                 ],
//               ),
//               child: Image.asset(
//                 'assets/icon/image.png', // Ensure the icon is placed in the assets folder
//                 width: 120,
//                 height: 120,
//               ),
//             ),
//             const SizedBox(height: 24),
//             const Text(
//               'Shopping App',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(height: 16),
//             const CircularProgressIndicator(
//               valueColor: AlwaysStoppedAnimation<Color>(Colors.pinkAccent),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
