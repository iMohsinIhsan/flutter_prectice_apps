import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/bill_home_controller.dart';

class BillHomeView extends GetView<BillHomeController> {
  const BillHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BillHomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'No Bills Added',
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Center(
                    child: Text('Add New Bill'),
                  ),
                  content: Form(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          BillFormField(
                            hintText: 'Watts e.g 100',
                            billFromFieldController: controller.wattsController,
                          ),
                          BillFormField(
                            hintText: 'Hours/Day e.g 15',
                            billFromFieldController:
                                controller.hoursPerDayController,
                          ),
                          BillFormField(
                            hintText: 'Days/Month e.g 20',
                            billFromFieldController:
                                controller.daysPerMonthController,
                          ),
                          BillFormField(
                            hintText: 'Quantity e.g 10',
                            billFromFieldController:
                                controller.quantityController,
                          ),
                          BillFormField(
                            hintText: 'Unit Price e.g 21',
                            billFromFieldController:
                                controller.unitPriceController,
                          ),
                          SizedBox(
                            width: 200.w,
                            height: 100.h,
                            child: ElevatedButton(
                                onPressed: () {}, child: Text('Add Bill')),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class BillFormField extends StatelessWidget {
  const BillFormField({
    Key? key,
    required this.hintText,
    required this.billFromFieldController,
  }) : super(key: key);

  final String hintText;
  final TextEditingController billFromFieldController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(
        controller: billFromFieldController,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(
            RegExp('[0-9.]'),
          ),
        ],
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
