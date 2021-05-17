import 'package:flutter/material.dart';
import 'package:weathercast/features/city/domain/usecases/add.dart';
import 'package:weathercast/injection_container.dart';

import 'features/city/domain/entities/city.dart';

class CityForm extends StatefulWidget {
  @override
  _CityFormState createState() => _CityFormState();
}

class _CityFormState extends State<CityForm> {
  late final TextEditingController _nameController;
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _modelScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('City name'),
          TextFormField(
            controller: _nameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter city name';
              }

              RegExp regExp = new RegExp(r"^[A-z\-]+$");
              if (!regExp.hasMatch(value)) {
                return 'Name must contain only letter';
              }

              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  var res = await serviceLocator<CityAddUseCase>()(
                      City(_nameController.value.text));
                  res.fold((l) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(l.message),
                      behavior: SnackBarBehavior.floating,
                    ));
                  }, (r) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('City added'),
                      behavior: SnackBarBehavior.floating,
                    ));
                    Navigator.of(context).pop();
                  });
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
