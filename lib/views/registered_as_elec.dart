import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyRegistered_As_Elec extends StatefulWidget {
  const MyRegistered_As_Elec({super.key});

  @override
  State<MyRegistered_As_Elec> createState() => _MyRegistered_As_ElecState();
}

class _MyRegistered_As_ElecState extends State<MyRegistered_As_Elec> {

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
        child: Column(
        children: [
        SizedBox(
        height: 140,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
              height: 50,
              width: 50,
              image: AssetImage('assets/images/logo.png')),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Maintaenance',
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
              ),
            ],
          )
        ],
      ),
      SizedBox(
        height: 10,
      ),
           Text('Registered !',
          style: TextStyle(
              fontSize: 34,
              fontFamily: 'Rubik Medium',
              color: Color(0xff203142))),
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

          return SingleChildScrollView(
            child: Column(
              children: snapshot.data!.docs.map((doc) {
                final electrician = doc.data() as Map<String, dynamic>;
                return Padding(
                  padding: const EdgeInsets.all(20.0),
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
                            'Name: ${electrician['name']??'N/A'}',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Rubik Regular',
                              color: Color(0xff203142),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Contact: ${electrician['contact']??'N/A'}',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Rubik Regular',
                              color: Color(0xff203142),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Email: ${electrician['email']??'N/A'}',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Rubik Regular',
                              color: Color(0xff203142),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Address: ${electrician['address']??'N/A'}',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Rubik Regular',
                              color: Color(0xff203142),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Description: ${electrician['description']??'N/A'}',
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
            ),
          );
        },
      ),
    ])
    )
    )
      )
    );
  }
}
