import 'package:flutter/material.dart';

class MyWork_Fields extends StatefulWidget {
  const MyWork_Fields({super.key});

  @override
  State<MyWork_Fields> createState() => _MyWork_FieldsState();
}

class _MyWork_FieldsState extends State<MyWork_Fields> {
  List<bool> isSelectedList = [false, false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/signup.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 80,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    height: 50,
                    width: 50,
                    image: AssetImage('assets/images/logo.png'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Maintenance',
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Rubik Medium',
                            color: Color(0xff203142)),
                      ),
                      Text(
                        'Services',
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Rubik Medium',
                            color: Color(0xffF9703B)),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                  child: Text(
                'Fields',
                style: TextStyle(
                    fontSize: 34,
                    fontFamily: 'Rubik Medium',
                    color: Color(0xff203142)),
              )),
              SizedBox(
                height: 20,width: 80,
              ),
            Padding(
              padding:EdgeInsets.only(right: 150),
              child: Text(
                'Choose Field :',
                style: TextStyle(
                    fontSize: 34,
                    fontFamily: 'Rubik Regular',
                    color: Color(0xff203142)),
              ),
            ),
            // Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       for (int i = 0; i < 4; i++)
            //         Padding(
            //           padding: const EdgeInsets.only(right: 18),
            //           child: ElevatedButton(
            //             onPressed: () {
            //               setState(() {
            //                 if (isSelectedList[i]) {
            //                   isSelectedList[i] = false;
            //                 } else {
            //                   for (int j = 0; j <
            //                       isSelectedList.length; j++) {
            //                     isSelectedList[j] = false;
            //                   }
            //                   isSelectedList[i] = !isSelectedList[i];
            //                 }
            //               });
            //               if (i == 0) {
            //                 Navigator.pushNamed(context, 'electrician_reg');
            //               }
            //             },
            //             style: ButtonStyle(
            //               backgroundColor:
            //               MaterialStateProperty.resolveWith((states) {
            //                 return isSelectedList[i]
            //                     ? Color(0xffF9703B)
            //                     : Color(0xff919394);
            //               }),
            //               minimumSize: MaterialStateProperty.all<Size>(
            //                 Size(100, 75),
            //               ),
            //
            //             ),
            //             child: Column(children: [
            //               SizedBox(height: 20),
            //               Icon(
            //                 i == 0
            //                     ? Icons.electric_bolt
            //                     : i == 1
            //                     ? Icons.chair
            //                     : i == 2
            //                     ? Icons.computer
            //                     : Icons.sunny,
            //                 size: 40,
            //                 color: Colors.white,
            //               ),
            //               Center(
            //                 child: Text(
            //                   i == 0
            //                       ? 'Electrician'
            //                       : i == 1
            //                       ? 'Carpenter'
            //                       : i == 2
            //                       ? 'Electronics '
            //
            //                       ' \n Technician'
            //                       : 'Heating Engineer',
            //                   style: TextStyle(
            //                       fontSize: 20,
            //                       fontFamily: 'Rubik Regular',
            //                       color: Colors.white),
            //                 ),
            //               ),
            //             ]),
            //           ),
            //         ),
            //     ],
            // ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 2; i++)
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (isSelectedList[i]) {
                              isSelectedList[i] = false;
                            } else {
                              for (int j = 0; j < isSelectedList.length; j++) {
                                isSelectedList[j] = false;
                              }
                              isSelectedList[i] = !isSelectedList[i];
                            }
                          });
                          if (i == 0) {
                            Navigator.pushNamed(context, 'electrician_reg');
                          }
                        },
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all<Size>(Size(150, 75)),
                          side: MaterialStateProperty.resolveWith<BorderSide>(
                                (Set<MaterialState> states) {
                              if (isSelectedList[i]) {
                                return BorderSide(
                                    color: Color(0xffF9703B), width: 5);
                              }
                              return BorderSide(
                                  color: Color(0xff919394), width: 5);
                            },
                          ),
                        ),
                        child: Column(children: [
                          SizedBox(height: 10),
                          Icon(
                            i == 0
                                ? Icons.electric_bolt
                                : i == 1
                                ? Icons.chair
                                : i == 2
                                ? Icons.computer
                                : Icons.sunny,
                            // size: 40,
                            color: Color(0xff203142),
                          ),
                          Center(
                            child: Text(
                              i == 0
                                  ? 'Electrician'
                                                    : i == 1
                                                    ? 'Carpenter'
                                                    : i == 2
                                                    ? 'Electronics '

                                                    ' \n Technician'
                                                    : 'Heating Engineer',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Rubik Regular',
                                  color: Color(0xff203142)),
                            ),
                          ),
                        ]),
                      ),
                    ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 2; i < 4; i++)
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if (isSelectedList[i]) {
                              isSelectedList[i] = false;
                            } else {
                              for (int j = 0; j < isSelectedList.length; j++) {
                                isSelectedList[j] = false;
                              }
                              isSelectedList[i] = !isSelectedList[i];
                            }
                          });
                          if (i == 0) {
                            Navigator.pushNamed(context, 'available_elec');
                          }
                        },
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all<Size>(Size(150, 75)),
                          side: MaterialStateProperty.resolveWith<BorderSide>(
                                (Set<MaterialState> states) {
                              if (isSelectedList[i]) {
                                return BorderSide(
                                    color: Color(0xffF9703B), width: 5);
                              }
                              return BorderSide(
                                  color: Color(0xff919394), width: 5);
                            },
                          ),
                        ),
                        child: Column(children: [
                          SizedBox(height: 10),
                          Icon(
                            i == 0
                                ? Icons.electric_bolt
                                : i == 1
                                ? Icons.chair
                                : i == 2
                                ? Icons.computer
                                : Icons.sunny,
                            // size: 40,
                            color: Color(0xff203142),
                          ),
                          Center(
                            child: Text(
                              i == 0
                                  ? 'Electrician'
                                                    : i == 1
                                                    ? 'Carpenter'
                                                    : i == 2
                                                    ? 'Electronics '


                                                    : 'Heating ',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Rubik Regular',
                                  color: Color(0xff203142)),
                            ),
                          ),
                        ]),
                      ),
                    ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     for (int i = 4; i < 6; i++)
              //       Padding(
              //         padding: const EdgeInsets.only(right: 18),
              //         child: ElevatedButton(
              //           onPressed: () {
              //             setState(() {
              //               if (isSelectedList[i]) {
              //                 isSelectedList[i] = false;
              //               } else {
              //                 for (int j = 0; j <
              //                     isSelectedList.length; j++) {
              //                   isSelectedList[j] = false;
              //                 }
              //                 isSelectedList[i] = !isSelectedList[i];
              //               }
              //             });
              //           },
              //           style: ButtonStyle(
              //             backgroundColor:
              //             MaterialStateProperty.resolveWith((states) {
              //               return isSelectedList[i]
              //                   ? Color(0xffF9703B)
              //                   : Color(0xff919394);
              //             }),
              //             minimumSize: MaterialStatePropertyAll(
              //               Size(100, 75),
              //             ),
              //
              //           ),
              //           child: Column(children: [
              //             SizedBox(height: 20),
              //             Icon(
              //               i == 4 ? Icons.water_drop : Icons.ac_unit,
              //               color: Colors.white,
              //             ),
              //             Center(
              //               child:  Text(
              //                 i == 4 ? 'Plumber' : 'AC Technician',
              //                 style: TextStyle(
              //                     fontSize: 20,
              //                     fontFamily: 'Rubik Regular',
              //                     color: Colors.white),
              //               ),
              //             ),
              //           ]),
              //         ),
              //       ),
              //   ],
              // ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 4; i < 6; i++)
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if (isSelectedList[i]) {
                              isSelectedList[i] = false;
                            } else {
                              for (int j = 0; j < isSelectedList.length; j++) {
                                isSelectedList[j] = false;
                              }
                              isSelectedList[i] = !isSelectedList[i];
                            }
                          });
                        },
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all<Size>(Size(150, 75)),
                          side: MaterialStateProperty.resolveWith<BorderSide>(
                                (Set<MaterialState> states) {
                              if (isSelectedList[i]) {
                                return BorderSide(
                                    color: Color(0xffF9703B), width: 5);
                              }
                              return BorderSide(
                                  color: Color(0xff919394), width: 5);
                            },
                          ),
                        ),
                        child: Column(children: [
                          Icon(
                            i == 4 ? Icons.water_drop : Icons.ac_unit,
                            color: Color(0xff203142),
                          ),
                          Center(
                            child: Text(
                              i == 4 ? 'Plumber' : 'Technician',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Rubik Regular',
                                  color: Color(0xff203142)),
                            ),
                          ),
                        ]),
                      ),
                    )
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
