import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class StartStudentView extends StatefulWidget {
  const StartStudentView({super.key});

  @override
  State<StartStudentView> createState() => _StartStudentViewState();
}

class _StartStudentViewState extends State<StartStudentView> {
  ExpandableController _expandableController = ExpandableController();
  TextEditingController _studentId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg_start.png'),
                fit: BoxFit.fill)),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Text(
                  "Select Type of User",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                const SizedBox(
                  height: 50,
                ),
                ExpandableNotifier(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          controller: _studentId,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Student ID',
                            hintText: 'Please enter student id',
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: ScrollOnExpand(
                          child: ExpandablePanel(
                            controller: _expandableController,
                            theme: const ExpandableThemeData(
                              hasIcon: false,
                            ),
                            header: TextButton(
                              child: ListTile(
                                title: const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Select Service',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                trailing: _expandableController.expanded
                                    ? const Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 30,
                                      )
                                    : const Icon(
                                        Icons.keyboard_arrow_right,
                                        size: 30,
                                      ),
                              ),
                              onPressed: () {
                                setState(() {
                                  _expandableController.expanded =
                                      !_expandableController.expanded;
                                });
                              },
                            ),

                            //CONTENT EXPANDED
                            expanded: Padding(
                              padding: const EdgeInsets.only(left: 0, right: 0),
                              child: Column(
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _serviceWidget('Computer Laboratory'),
                                      _serviceWidget('Library'),
                                      _serviceWidget('Casher'),
                                      _serviceWidget('Registrar'),
                                      _serviceWidget('Canteen'),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            collapsed: Container(),
                            builder: (_, collapsed, expanded) {
                              return Expandable(
                                collapsed: collapsed,
                                expanded: expanded,
                              );
                            },
                          ),
                        ),
                      ),
                      const Divider(
                        height: 2,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 200,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _serviceWidget(String serviceName) => ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
        child: SizedBox(
          width: 500,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(serviceName),
              const Icon(Icons.arrow_forward_ios_outlined)
            ],
          ),
        ),
      );
}
