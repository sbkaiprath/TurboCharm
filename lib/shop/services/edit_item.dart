import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbocharm/models/parts.dart';
import 'package:turbocharm/providers/car_provider.dart';
import 'package:turbocharm/providers/parts_providers.dart';

class EditItem extends StatefulWidget {
  static const routeName = '/edit-product';

  _EditItemState createState() => _EditItemState();
}

class _EditItemState extends State<EditItem> {
  String selectBrand;
  String selectCar;

  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedProduct = Parts(
    id: null,
    partname: '',
    description: '',
    partPrice: 0,
    partImageUrl: '',
    car: null,
  );
  var _initValues = {
    'partname': '',
    'id': '',
    'description': '',
    'partImageUrl': '',
    'partPrice': '',
    'car': '',
  };
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    _imageUrlController.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context).settings.arguments as String;
      if (productId != null) {
        _editedProduct = Provider.of<PartProvider>(context, listen: false)
            .getPart(productId);
        _initValues = {
          'partname': _editedProduct.partname,
          'id': _editedProduct.id,
          'description': _editedProduct.description,
          'partImageUrl': '',
          'partPrice': _editedProduct.partPrice.toString(),
        };
        _imageUrlController.text = _editedProduct.partImageUrl;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void dispose() {
    _imageFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageFocusNode.dispose();
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imageFocusNode.hasFocus) {
      if (!_imageUrlController.text.startsWith('http')) {
        return;
      }
      setState(() {});
    }
  }

  Future<void> _saveForm() async {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });
    if (_editedProduct.id != null) {
      await Provider.of<PartProvider>(context, listen: false)
          .updateItem(_editedProduct.id, _editedProduct);
    } else {
      try {
        await Provider.of<PartProvider>(context, listen: false)
            .addItem(_editedProduct);
      } catch (error) {
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Something went wrong'),
            content: Text('an error occured'),
            actions: <Widget>[
              FlatButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              ),
            ],
          ),
        );
      }

      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;

    final carData = Provider.of<CarProvider>(context, listen: false);
    var brand = [];
    carData.items.forEach((element) {
      brand.add(element.brand);
    });

    return Scaffold(
      appBar: AppBar(
        title: (productId != null)
            ? Text('Edit Parts')
            : Text(
                'Add Parts',
              ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              color: Theme.of(context).cardColor,
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _form,
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      initialValue: _initValues['partname'],
                      decoration: InputDecoration(
                        labelText: 'Part Name',
                      ),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_priceFocusNode);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please provide a value';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Parts(
                          partname: value,
                          id: _editedProduct.id,
                          partPrice: _editedProduct.partPrice,
                          description: _editedProduct.description,
                          partImageUrl: _editedProduct.partImageUrl,
                          car: _editedProduct.car,
                        );
                      },
                    ),
                    TextFormField(
                      initialValue: _initValues['partPrice'],
                      decoration: InputDecoration(labelText: 'Price'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      focusNode: _priceFocusNode,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(_descriptionFocusNode);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please provide a value.';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid number.';
                        }
                        if (double.parse(value) < 0) {
                          return 'Enter a number greater than zero';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Parts(
                            partname: _editedProduct.partname,
                            id: _editedProduct.id,
                            partPrice: double.parse(value),
                            description: _editedProduct.description,
                            partImageUrl: _editedProduct.partImageUrl,
                            car: _editedProduct.car);
                      },
                    ),
                    TextFormField(
                      initialValue: _initValues['description'],
                      decoration: InputDecoration(labelText: 'Description'),
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.next,
                      focusNode: _descriptionFocusNode,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some description';
                        }
                        if (value.length < 10) {
                          return 'Should be atleast 10 character long';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Parts(
                            partname: _editedProduct.partname,
                            id: _editedProduct.id,
                            partPrice: _editedProduct.partPrice,
                            description: value,
                            partImageUrl: _editedProduct.partImageUrl,
                            car: _editedProduct.car);
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(top: 8, right: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          child: _imageUrlController.text.isEmpty
                              ? Text('Enter Url')
                              : FittedBox(
                                  child: Image.network(
                                    _imageUrlController.text,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'ImageUrl'),
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            controller: _imageUrlController,
                            focusNode: _imageFocusNode,
                            onFieldSubmitted: (_) {
                              _saveForm();
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please provide a url';
                              }
                              if (!value.startsWith('http')) {
                                return 'Please enter a valid url';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _editedProduct = Parts(
                                partname: _editedProduct.partname,
                                id: _editedProduct.id,
                                partPrice: _editedProduct.partPrice,
                                description: _editedProduct.description,
                                partImageUrl: value,
                                car: _editedProduct.car,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 5),
                          child: Text(
                            "Select Model",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        DropdownButton(
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 25),
                            hint: Text(
                              'Please choose a Brand',
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ), // Not necessary for Option 1
                            value: selectBrand,
                            onChanged: (newValue) {
                              setState(() {
                                selectBrand = newValue;
                                selectCar = null;
                              });
                            },
                            items: brand.toSet().toList().map((car) {
                              return DropdownMenuItem(
                                child: Text(car),
                                value: car,
                              );
                            }).toList()),
                        SizedBox(
                          height: 15,
                        ),
                        DropdownButton(
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 25),
                            hint: Text(
                              'Please choose car',
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ), // Not necessary for Option 1
                            value: selectCar,
                            onChanged: (newValue) {
                              setState(() {
                                selectCar = newValue;
                              });
                            },
                            items: carData
                                .carName(selectBrand)
                                .toSet()
                                .toList()
                                .map((car) {
                              return DropdownMenuItem(
                                child: Text(car),
                                value: car,
                              );
                            }).toList()),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
