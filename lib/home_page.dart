import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';
import 'getvalue.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _priceNotifier = ValueNotifier<String>('');
  @override
  Widget build(BuildContext context) {
    TextEditingController weightController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const GFAvatar(
                  backgroundImage: AssetImage('assets/images/logo.png'),
                  shape: GFAvatarShape.circle,
                  size: 80),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'حساب قيمه التخلص الآمن من النفايات الطبية الخطره',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: TextFormField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefix: Icon(
                      Icons.balance,
                      color: Colors.purple,
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'الوزن',
                  ),
                ),
              ),
              GFButton(
                elevation: 8,
                size: GFSize.LARGE,
                textStyle: TextStyle(fontFamily: 'bein', fontSize: 18),
                onPressed: () {
                  SystemChannels.textInput.invokeMethod('TextInput.hide');

                  final price = getPrice(int.parse(weightController.text));
                  _priceNotifier.value = price.toString();
                },
                text: "حساب القيمة",
                icon: Icon(
                  Icons.calculate,
                  color: Colors.white,
                ),
              ),
              ValueListenableBuilder(
                valueListenable: _priceNotifier,
                builder: (context, value, child) {
                  return Text(
                    'المبلغ المطلوب: $value',
                    style: TextStyle(fontSize: 18),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
