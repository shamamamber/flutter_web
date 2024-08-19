import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maintenance_app/models/electrician_model.dart';
class ElectricianController {
  final CollectionReference _electricianCollection =
  FirebaseFirestore.instance.collection('Electrician');


  Future<void> saveElectrician(ElectricianModel electrician) async {
    try {
      await _electricianCollection.add(electrician.toMap());
      print('Electrician saved successfully.');
    } catch (error) {
      print('Error saving electrician: $error');
    }
  }
}