// part of '../views/start_view.dart';

// class SelectServices extends StatelessWidget {
//   SelectServices({super.key});

//   final startController = StartController.instance;

//   @override
//   Widget build(BuildContext context) {
//     return ExpandableNotifier(
//       child: Column(
//         children: [
//           ScrollOnExpand(
//             child: ExpandablePanel(
//               controller: startController.expandableController2.value,
//               theme: const ExpandableThemeData(
//                 hasIcon: false,
//               ),
//               header: Container(
//                 decoration: const BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                         topRight: Radius.circular(20.0),
//                         topLeft: Radius.circular(20.0),
//                         bottomLeft: Radius.circular(20.0),
//                         bottomRight: Radius.circular(20.0)),
//                     color: Colors.white),
//                 child: TextButton(
//                   child: Obx(
//                     () => ListTile(
//                       title: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           'Select Service: ${startController.serviceSelected.value}',
//                           style: const TextStyle(
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                       trailing: startController.isServiceExpanded.value
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
//                     startController.changeExpandableStatus2();
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
//                           checkBoxBuildService('Library', 0),
//                           checkBoxBuildService('Admin Office', 1),
//                           checkBoxBuildService('Security Office', 2),
//                           checkBoxBuildService('Registrar', 3),
//                           checkBoxBuildService('Cashier', 4),
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

//   Widget checkBoxBuildService(String label, int index) {
//     return Obx(
//       () => Container(
//         color: startController.ifCurrentlySelectedService(index)
//             ? Colors.blue.shade100
//             : Colors.transparent,
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 5.0, right: 5),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     label,
//                     style: const TextStyle(color: Colors.black),
//                   ),
//                   Transform.scale(
//                     scale: .7,
//                     child: Checkbox(
//                         activeColor: Colors.blue.shade400,
//                         value: startController.checkedValueService[index],
//                         onChanged: (value) {
//                           for (int x = 0;
//                               x < startController.checkedValueService.length;
//                               x++) {
//                             startController.changeCheckService(x);
//                           }
//                           startController.updateSelectedService(
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
