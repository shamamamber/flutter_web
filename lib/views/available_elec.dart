import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyAvailable_Elec extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Electricians'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/signup.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Row(
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
                              color: Color(0xff203142),
                            ),
                          ),
                          Text(
                            'Services',
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Rubik Medium',
                              color: Color(0xffF9703B),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    ' Available Electricians !',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Rubik Medium',
                      color: Color(0xff203142),
                    ),
                  ),
                  StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('Electrician').snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }

                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return Center(child: Text('No Electricians Registered.'));
                      }

                      return Column(
                        children: snapshot.data!.docs.map((doc) {
                          final electrician = doc.data() as Map<String, dynamic>;
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name: ${electrician['name']}',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Rubik Regular',
                                        color: Color(0xff203142),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Contact: ${electrician['contact']}',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Rubik Regular',
                                        color: Color(0xff203142),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Email: ${electrician['email']}',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Rubik Regular',
                                        color: Color(0xff203142),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Address: ${electrician['address']}',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Rubik Regular',
                                        color: Color(0xff203142),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Description: ${electrician['description']}',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Rubik Regular',
                                        color: Color(0xff203142),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}