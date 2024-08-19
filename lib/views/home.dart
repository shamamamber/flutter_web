import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class MyHome extends StatefulWidget {
  MyHome({super.key});
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<bool> isSelectedList = [false, false, false, false, false, false, false];
  // String? email;
  // String? password;

  //
  // getEmail()async{
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //  // email = pref.getString('email')!;
  //   setState(() {});
  // }
  // getPassword()async{
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   //password = pref.getString('password')!;
  //   setState(() {
  //
  //   });
  // }
  @override
  void initState() {
    super.initState();
    // getEmail();
    //  getPassword();
  }

  @override
  Widget build(BuildContext context) {
    final UserModel? userData =
        ModalRoute.of(context)?.settings.arguments as UserModel?;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xfff9843a),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Color(0xffF9703B),
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.white),
              label: 'Account',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.white),
              label: 'setting',
              backgroundColor: Color(0xffF9703B),
            ),
          ]),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Row(children: [
                    Image(
                        height: 60,
                        width: 60,
                        image: AssetImage('assets/images/logo.png')),
                    SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Maintenance',
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Rubik Medium',
                              color: Colors.white),
                        ),
                        Text(
                          'Services',
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Rubik Medium',
                              color: Color(0xffF9703B)),
                        )
                      ],
                    ),
                  ]),
                ),
                Spacer(),
                Column(children: [
                  SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: const Color(0xffF9703B),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.person,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    ' ${userData?.name}',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  //  Text(password??'',
                  // style: TextStyle(color: Colors.white),),
                ]),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Address',
                fillColor: const Color(0xffF8F9FA),
                filled: true,
                prefixIcon: const Icon(
                  Icons.home,
                  color: Color(0xff323F4B),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                    borderRadius: BorderRadius.circular(10)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: ElevatedButton(
              onPressed: () {
                // Add your onPressed logic here
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xffF9703B)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: Colors.white,
                      width: 4,
                    ),
                  ),
                ),
              ),
              child: Text(
                'Emergency Button',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(color: Colors.black),
            child: Column(children: [
              Padding(
                padding:

                EdgeInsets.only(right: 200),
                child: Text(
                  'Issues ',
                  style: TextStyle(
                      fontSize: 38,
                      fontFamily: 'Rubik Regular',
                      color: Colors.white),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     for (int i = 0; i < 2; i++)
              //       Padding(
              //         padding: const EdgeInsets.only(right: 8),
              //         child: ElevatedButton(
              //           onPressed: () {
              //             setState(() {
              //               if (isSelectedList[i]) {
              //                 isSelectedList[i] = false;
              //               } else {
              //                 for (int j = 0; j < isSelectedList.length; j++) {
              //                   isSelectedList[j] = false;
              //                 }
              //                 isSelectedList[i] = !isSelectedList[i];
              //               }
              //             });
              //             if (i == 0) {
              //               Navigator.pushNamed(context, 'available_elec');
              //             }
              //           },
              //           style: ButtonStyle(
              //             backgroundColor:
              //                 MaterialStateProperty.resolveWith((states) {
              //               return isSelectedList[i]
              //                   ? Color(0xffF9703B)
              //                   : Color(0xff919394);
              //             }),
              //             minimumSize: MaterialStatePropertyAll(
              //               Size(100, 75),
              //             ),
              //           ),
              //           child: Column(children: [
              //             SizedBox(height: 20),
              //             Icon(
              //               i == 0
              //                   ? Icons.electric_bolt
              //                   : i == 1
              //                       ? Icons.chair
              //                       : i == 2
              //                           ? Icons.computer
              //                           : Icons.sunny,
              //               size: 40,
              //               color: Colors.white,
              //             ),
              //             Center(
              //               child: Text(
              //                 i == 0
              //                     ? 'Electronics'
              //                     : i == 1
              //                         ? 'furniture'
              //                         : i == 2
              //                             ? 'computer'
              //                             : 'heating',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 2; i++)
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
                            color: Colors.white,
                          ),
                          Center(
                            child: Text(
                              i == 0
                                  ? 'Electronics'
                                  : i == 1
                                  ? 'furniture'
                                  : i == 2
                                  ? 'computer'
                                  : 'heating',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Rubik Regular',
                                  color: Colors.white),
                            ),
                          ),
                        ]),
                      ),
                    ),
                ],
              ),
              SizedBox(
                height: 30,
              ), Row(
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
                            color: Colors.white,
                          ),
                          Center(
                            child: Text(
                              i == 0
                                  ? 'Electronics'
                                  : i == 1
                                  ? 'furniture'
                                  : i == 2
                                  ? 'computer'
                                  : 'heating',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Rubik Regular',
                                  color: Colors.white),
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
                            color: Colors.white,
                          ),
                          Center(
                            child: Text(
                              i == 4 ? 'Water' : 'AC',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Rubik Regular',
                                  color: Colors.white),
                            ),
                          ),
                        ]),
                      ),
                    )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Other Issues',
                    fillColor: const Color(0xffF8F9FA),
                    filled: true,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0xff323F4B),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ]),
          ),
          SizedBox(
            height: 7,
          ),
          ElevatedButton(
            onPressed: () {
              // Add your onPressed logic here
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xffF9703B)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(
                    color: Colors.white,
                    width: 4,
                  ),
                ),
              ),
            ),
            child: Text(
              'Wallet',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),

          SizedBox(
            height: 7,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, 'login');
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xffF9703B)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(
                    color: Colors.white,
                    width: 4,
                  ),
                ),
              ),
            ),
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ])),
      ),
    ));
  }
}
