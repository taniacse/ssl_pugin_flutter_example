import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sslcommerz_flutter/model/SSLCAdditionalInitializer.dart';
import 'package:sslcommerz_flutter/model/SSLCCustomerInfoInitializer.dart';
import 'package:sslcommerz_flutter/model/SSLCEMITransactionInitializer.dart';
import 'package:sslcommerz_flutter/model/SSLCSdkType.dart';
import 'package:sslcommerz_flutter/model/SSLCShipmentInfoInitializer.dart';
import 'package:sslcommerz_flutter/model/SSLCTransactionInfoModel.dart';
import 'package:sslcommerz_flutter/model/SSLCommerzInitialization.dart';
import 'package:sslcommerz_flutter/model/SSLCurrencyType.dart';
import 'package:sslcommerz_flutter/model/sslproductinitilizer/General.dart';
import 'package:sslcommerz_flutter/model/sslproductinitilizer/SSLCProductInitializer.dart';
import 'package:sslcommerz_flutter/sslcommerz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _key = GlobalKey<FormState>();
  dynamic formData = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('SSLCommerz'),
          ),
          body: Form(
            key: _key,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        initialValue: "testbox",
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8.0))),
                          hintText: "Store ID",
                        ),
                        validator: (value) {
                          if (value.isEmpty)
                            return "Please input store id";
                          else
                            return null;
                        },
                        onSaved: (value) {
                          formData['store_id'] = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        initialValue: "qwerty",
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8.0))),
                          hintText: "Store password",
                        ),
                        validator: (value) {
                          if (value.isEmpty)
                            return "Please input store password";
                          else
                            return null;
                        },
                        onSaved: (value) {
                          formData['store_password'] = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8.0))),
                          hintText: "Phone number",
                        ),
                        onSaved: (value) {
                          formData['phone'] = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        initialValue: "10",
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8.0))),
                          hintText: "Payment amount",
                        ),
                        validator: (value) {
                          if (value.isEmpty)
                            return "Please input amount";
                          else
                            return null;
                        },
                        onSaved: (value) {
                          formData['amount'] = double.parse(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8.0))),
                          hintText: "Enter multi card",
                        ),
                        onSaved: (value) {
                          formData['multicard'] = value;
                        },
                      ),
                    ),
                    RaisedButton(
                      child: Text("Pay now"),
                      onPressed: () {
                        if (_key.currentState.validate()) {
                          _key.currentState.save();
                          // sslCommerzGeneralCall();
                          sslCommerzCustomizedCall();
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Future<void> sslCommerzGeneralCall() async {
    Sslcommerz sslcommerzt = Sslcommerz();

   /* sslcommerzt.o

    _sslcommerzFlutterPlugin.on(
        SslcommerzFlutterPlugin.EVENT_TRANSACTION_SUCCESS, _transactionSuccess);
    _sslcommerzFlutterPlugin.on(
        SslcommerzFlutterPlugin.EVENT_TRANSACTION_FAIL, _transactionFail);
    _sslcommerzFlutterPlugin.on(
        SslcommerzFlutterPlugin.EVENT_MERCHANT_VALIDATION_ERROR,
        _merchantValidationError);*/

//Sandbox
    //"bdjob5f0ad29f35834",
    //"bdjob5f0ad29f35834@ssl",
    Sslcommerz sslcommerz = Sslcommerz(
        initializer: SSLCommerzInitialization(
            ipn_url: "www.ipnurl.com",
            multi_card_name: formData['multicard'],
            currency: SSLCurrencyType.BDT,
            product_category: "Food",
            sdkType: SSLCSdkType.TESTBOX,
            store_id: formData['store_id'],
            store_passwd: formData['store_password'],
            total_amount: formData['amount'],
            tran_id: "1231321321321312"));
    sslcommerz.payNow();

  }

  Future<void> sslCommerzCustomizedCall() async {
    Sslcommerz sslcommerz = Sslcommerz(
        initializer: SSLCommerzInitialization(
            ipn_url: "www.ipnurl.com",
            multi_card_name: formData['multicard'],
            currency: SSLCurrencyType.BDT,
            product_category: "Food",
            sdkType: SSLCSdkType.TESTBOX,
            store_id: 'bdjob5f0ad29f35834',
            store_passwd: 'bdjob5f0ad29f35834@ssl',
            total_amount: formData['amount'],
            tran_id: "1231321321321312").addSAllowedBin(""));
    sslcommerz
        .addEMITransactionInitializer(
        sslcemiTransactionInitializer: SSLCEMITransactionInitializer(
            emi_options: 1, emi_max_list_options: 3, emi_selected_inst: 2))
        .addShipmentInfoInitializer(
        sslcShipmentInfoInitializer: SSLCShipmentInfoInitializer(
            shipmentMethod: "yes",
            numOfItems: 5,
            shipmentDetails: ShipmentDetails(
                shipAddress1: "Ship address 1",
                shipCity: "Faridpur",
                shipCountry: "Bangladesh",
                shipName: "Ship name 1",
                shipPostCode: "7860")))
        .addCustomerInfoInitializer(
        customerInfoInitializer: SSLCCustomerInfoInitializer(
            customerName: null,
            customerEmail: null,
            customerAddress1: null,
            customerCity: null,
            customerPostCode: null,
            customerCountry: null,
            customerPhone: formData['phone']))
        .addProductInitializer(
        sslcProductInitializer:
        // ***** ssl product initializer for general product STARTS*****
        SSLCProductInitializer(
            productName: "Water Filter",
            productCategory: "Widgets",
            general: General(
                general: "General Purpose",
                productProfile: "Product Profile"))

    )
        .addAdditionalInitializer(
        sslcAdditionalInitializer: SSLCAdditionalInitializer(
            valueA: "value a ",
            valueB: "value b",
            valueC: "value c",
            valueD: "value d"));
    var result = await sslcommerz.payNow();
    print("skjfnsdkjf $result");
    /*print("_handleResult ${result["data"]}");*/
    if (result is PlatformException) {
      print("the response is: " + result.message + " code: " + result.code);
    } else {
      SSLCTransactionInfoModel model = result;
   /*   print("the response is tttttttt: " + result.message + " model: + ${model.tranId} " );*/
      print("the response is bgfdhgfh: store amount " + model.storeAmount + " riskLevel: " + model.riskLevel + "Status  + ${model.status}" );
    }
  }
}