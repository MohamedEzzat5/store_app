import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/custom_buttton.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateScreen extends StatefulWidget {
  UpdateScreen({super.key});

  static String id = 'UpdateScreen';


  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  String? productName, description, image, price;
  bool isLoading =false;
  @override
  Widget build(BuildContext context) {
    ProductModel productModel = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall:  isLoading,
      child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Update Product',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(

                children: [
                  SizedBox(height: 100,),
                  CustomTextField(
                    hintText: 'Product Name',
                    onChanged: (data) {
                      productName = data;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    hintText: 'Description',
                    onChanged: (data) {
                      description = data;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    keybordType: TextInputType.number,
                    hintText: 'Price',
                    onChanged: (data) {

                      price = data;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    hintText: 'image',
                    onChanged: (data) {
                      image = data;
                    },
                  ),
                  SizedBox(height: 50,),
                  CustomButton(
                    buttonName: 'Update',
                    onTap: ()async {
                      isLoading = true;
                      setState(() {
                      });
                      try {

                        await updateProduct(productModel);
                        print('success');
                      }
                      catch (e) {
                        print(e.toString());
                      }
                          isLoading =false;
                          setState(() {
                          });
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }

  Future<void> updateProduct(ProductModel product) async{
   await  UpdateProductService().updateProduct(
        id: product.id,
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        description: description == null ? product.descriptin : description!,
        image: image == null ? product.image : image!,
        category: product.category);

  }
}
