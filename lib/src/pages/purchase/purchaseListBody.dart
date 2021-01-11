import 'package:OilPos/src/viewModels/purchase/purchaseViewModel.dart';
import 'package:OilPos/src/widgets/date_picker.dart';
import 'package:OilPos/src/widgets/loading_indicator.dart';
import 'package:OilPos/src/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../pages/purchase/paginatedDataSourceForPurchase.dart';

class PurchaseListBody extends StatefulWidget {
  @override
  _PurchaseListBodyState createState() => _PurchaseListBodyState();
}

class _PurchaseListBodyState extends State<PurchaseListBody> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  TextEditingController _searchStringCtrl = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _searchStringCtrl.addListener(liveSearching);
    super.initState();
  }

  void liveSearching() {
    final purchaseViewModel =
        Provider.of<PurchaseViewModel>(context, listen: false);
    purchaseViewModel.searchingPurchases(_searchStringCtrl.text);
    // _purchaseBloc.add(SearchingPurchases(_searchStringCtrl.text));
  }

  @override
  void dispose() {
    _searchStringCtrl.dispose();
    super.dispose();
  }

  Future<void> openFilterPopup() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Positioned(
                  right: -40.0,
                  top: -40.0,
                  child: InkResponse(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      child: Icon(Icons.close),
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Start Date"),
                          Container(
                            width: 110,
                            height: 50,
                            child: DatePicker(
                                selectedDate: startDate,
                                onChanged: ((DateTime date) {
                                  if (date != null) {
                                    setState(() {
                                      startDate = date;
                                    });
                                  }
                                })),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("End Date"),
                          Container(
                            width: 110,
                            height: 50,
                            child: DatePicker(
                                selectedDate: endDate,
                                onChanged: ((DateTime date) {
                                  if (date != null) {
                                    setState(() {
                                      endDate = date;
                                    });
                                  }
                                })),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
                        child: RaisedButton(
                          child: Text("Submit"),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PurchaseViewModel>(
        builder: (context, purchaseViewModel, child) {
      if (purchaseViewModel.purchaseRecords.length > 0) {
        return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: PaginatedDataTable(
              sortAscending: false,
              header: Row(
                children: [
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Filter",
                            style: Theme.of(context).textTheme.headline1),
                        Icon(
                          Icons.filter_alt,
                          size: 25,
                          color: Colors.white,
                        )
                      ],
                    ),
                    color: Colors.purple[300],
                    onPressed: openFilterPopup,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 150,
                    height: 40,
                    child: TextFormField(
                      controller: _searchStringCtrl,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.search,
                          color: Theme.of(context).primaryColor,
                        ),
                        labelText: "Search",
                        labelStyle: Theme.of(context).textTheme.bodyText1,
                      ),
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ],
              ),
              columns: [
                DataColumn(
                  label: Text(
                    'အမည်',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'ဖုန်း',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'အမျိုးအစား',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'အရေအတွက်',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'နှုန်း',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'ငွေပေးချေမည့်ပုံစံ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'စုစုပေါင်း',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'ရက်စွဲ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Delete',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
              showCheckboxColumn: true,
              source: PaginatedTableDataSourceForPurchase(
                  data: purchaseViewModel.purchaseRecords,
                  totalCount: purchaseViewModel.totalCount,
                  purchaseViewModel: purchaseViewModel),
              onPageChanged: (page) async {
                page = page ~/ 10;
                await purchaseViewModel.getPurchasesList(page);
              },
              // onRowsPerPageChanged: (r) {
              //   setState(() {
              //     _rowPerPage = r;
              //   });
              // },
              // rowsPerPage: _rowPerPage,
            ));
      } else {
        return Center(child: LoadingIndicator());
      }
    });
  }
}
