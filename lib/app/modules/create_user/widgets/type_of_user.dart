// import 'package:css/app/modules/create_user/controller/create_user_library_controller.dart';
// import 'package:expandable/expandable.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class TypeOfUser extends StatelessWidget {
//   TypeOfUser({super.key});

//   final startController = CreateUserLibraryController.instance;

//   @override
//   Widget build(BuildContext context) {
//     return ExpandableNotifier(
//       child: Column(
//         children: [
//           ScrollOnExpand(
//             child: ExpandablePanel(
//               controller: startController.expandableController.value,
//               theme: const ExpandableThemeData(
//                 hasIcon: false,
//               ),
//               header: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(width: 1, color: Colors.black),
//                   borderRadius: const BorderRadius.only(
//                       topRight: Radius.circular(20.0),
//                       topLeft: Radius.circular(20.0),
//                       bottomLeft: Radius.circular(20.0),
//                       bottomRight: Radius.circular(20.0)),
//                   color: Colors.white,
//                 ),
//                 child: TextButton(
//                   child: Obx(
//                     () => ListTile(
//                       title: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           'Type of User: ${startController.userTypeSelected.value}',
//                           style: const TextStyle(
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                       trailing: startController.isUserExpanded.value
//                           ? const Icon(
//                               Icons.keyboard_arrow_down,
//                               size: 30,
//                             )
//                           : const Icon(
//                               Icons.keyboard_arrow_right,
//                               size: 30,
//                             ),
//                     ),
//                   ),
//                   onPressed: () {
//                     startController.changeExpandableStatus();
//                   },
//                 ),
//               ),

//               //CONTENT EXPANDED
//               expanded: Container(
//                 decoration: const BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                         topRight: Radius.circular(20.0),
//                         topLeft: Radius.circular(20.0),
//                         bottomLeft: Radius.circular(20.0),
//                         bottomRight: Radius.circular(20.0)),
//                     color: Colors.white),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Column(
//                     children: <Widget>[
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           checkBoxBuild('Student', 0),
//                           checkBoxBuild('Alumni', 1),
//                           checkBoxBuild('Parent', 2),
//                           checkBoxBuild('Guest', 3),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               collapsed: Container(),
//               builder: (_, collapsed, expanded) {
//                 return Expandable(
//                   collapsed: collapsed,
//                   expanded: expanded,
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget checkBoxBuild(String label, int index) {
//     return Obx(
//       () => Container(
//         color: startController.ifCurrentlySelected(index)
//             ? Colors.blue.shade100
//             : Colors.transparent,
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 5.0, right: 5),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Text(
//                     label,
//                     style: const TextStyle(color: Colors.black),
//                   ),
//                   Transform.scale(
//                     scale: .7,
//                     child: Checkbox(
//                         activeColor: Colors.blue.shade400,
//                         value: startController.checkedValueUserType[index],
//                         onChanged: (value) {
//                           for (int x = 0;
//                               x < startController.checkedValueUserType.length;
//                               x++) {
//                             startController.changeCheckUserType(x);
//                           }
//                           startController.updateSelectedUser(
//                               index, value, label);
//                         }),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
