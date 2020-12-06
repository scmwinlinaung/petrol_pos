import 'package:OilPos/src/views/sale/bloc/sale_event.dart';
import 'package:OilPos/src/views/sale/bloc/sale_state.dart';
import 'package:OilPos/src/widgets/loading_indicator.dart';
import 'package:OilPos/src/views/sale/paginatedTableDataSourceForSale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/sale_bloc.dart';

class SaleListBody extends StatefulWidget {
  @override
  _SaleListBodyState createState() => _SaleListBodyState();
}

class _SaleListBodyState extends State<SaleListBody> {
  SaleBloc _saleBloc;

  TextEditingController _searchStringCtrl = new TextEditingController();

  void liveSearching() {
    _saleBloc.add(SearchingSales(_searchStringCtrl.text));
  }

  @override
  void initState() {
    _saleBloc = BlocProvider.of(context);
    _searchStringCtrl.addListener(liveSearching);
    super.initState();
  }

  void deleteSale(String id) {
    _saleBloc.add(DeleteSale(id));
  }

  @override
  void dispose() {
    _searchStringCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaleBloc, SaleState>(builder: (context, state) {
      if (state.saleRecords.length > 0) {
        return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: PaginatedDataTable(
              sortAscending: false,
              header: Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 50, 5),
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
              source: PaginatedTableDataSourceForSale(
                  data: state.saleRecords, totalCount: state.totalCount),
              onPageChanged: (page) {
                page = page ~/ 10;
                _saleBloc.add(GetSalesList(page: page));
              },
              // onRowsPerPageChanged: (r) {
              //   setState(() {
              //     _rowPerPage = r;
              //   });
              // },
              // rowsPerPage: _rowPerPage,
            ));
        // return Column(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Padding(
        //         padding:
        //             const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        //         child: Container(
        //           height: 50,
        //           width: 200,
        //           child: TextFormField(
        //             controller: _searchStringCtrl,
        //             decoration: InputDecoration(
        //               icon: Icon(
        //                 Icons.search,
        //                 color: Theme.of(context).primaryColor,
        //               ),
        //               labelText: "Search",
        //               labelStyle: Theme.of(context).textTheme.bodyText1,
        //             ),
        //             style: Theme.of(context).textTheme.bodyText2,
        //           ),
        //         ),
        //       ),
        //       DataTable(
        //         headingRowColor: MaterialStateProperty.all(Colors.grey),
        //         headingTextStyle: TextStyle(color: Colors.white),
        //         columns: const <DataColumn>[
        //           DataColumn(
        //             label: Text(
        //               'အမည်',
        //               textAlign: TextAlign.center,
        //               style: TextStyle(fontSize: 14),
        //             ),
        //           ),
        //           DataColumn(
        //             label: Text(
        //               'ဖုန်း',
        //               textAlign: TextAlign.center,
        //               style: TextStyle(fontSize: 14),
        //             ),
        //           ),
        //           DataColumn(
        //             label: Text(
        //               'အမျိုးအစား',
        //               textAlign: TextAlign.center,
        //               style: TextStyle(fontSize: 14),
        //             ),
        //           ),
        //           DataColumn(
        //             label: Text(
        //               'အရေအတွက်',
        //               textAlign: TextAlign.center,
        //               style: TextStyle(fontSize: 14),
        //             ),
        //           ),
        //           DataColumn(
        //             label: Text(
        //               'နှုန်း',
        //               textAlign: TextAlign.center,
        //               style: TextStyle(fontSize: 14),
        //             ),
        //           ),
        //           DataColumn(
        //             label: Text(
        //               'ငွေပေးချေမည့်ပုံစံ',
        //               textAlign: TextAlign.center,
        //               style: TextStyle(fontSize: 14),
        //             ),
        //           ),
        //           DataColumn(
        //             label: Text(
        //               'စုစုပေါင်း',
        //               textAlign: TextAlign.center,
        //               style: TextStyle(fontSize: 14),
        //             ),
        //           ),
        //           DataColumn(
        //             label: Text(
        //               'ရက်စွဲ',
        //               textAlign: TextAlign.center,
        //               style: TextStyle(fontSize: 14),
        //             ),
        //           ),
        //           DataColumn(
        //             label: Text(
        //               'Delete',
        //               textAlign: TextAlign.center,
        //               style: TextStyle(fontSize: 14),
        //             ),
        //           ),
        //         ],
        //         rows: state
        //             .saleRecords // Loops through dataColumnText, each iteration assigning the value to element
        //             .map(
        //               ((sale) => DataRow(
        //                     cells: <DataCell>[
        //                       DataCell(Text(sale.customerName,
        //                           textAlign: TextAlign.center,
        //                           style:
        //                               Theme.of(context).textTheme.bodyText2)),
        //                       DataCell(Text(sale.customerPhone,
        //                           textAlign: TextAlign.center,
        //                           style:
        //                               Theme.of(context).textTheme.bodyText2)),
        //                       DataCell(Text(sale.goodType,
        //                           textAlign: TextAlign.center,
        //                           style:
        //                               Theme.of(context).textTheme.bodyText2)),
        //                       DataCell(Text(sale.quantity.toString() + " လီတာ",
        //                           textAlign: TextAlign.center,
        //                           style:
        //                               Theme.of(context).textTheme.bodyText2)),
        //                       DataCell(Text(sale.rateFixed.toString() + " ကျပ်",
        //                           textAlign: TextAlign.center,
        //                           style:
        //                               Theme.of(context).textTheme.bodyText2)),
        //                       // DataCell(Text(sale.paymentType,
        //                       //     textAlign: TextAlign.center,
        //                       //     style: Theme.of(context).textTheme.bodyText2)),
        //                       DataCell(
        //                         DropdownButton<String>(
        //                           hint: Text("ငွေပေးချေမည့်ပုံစံ",
        //                               style: Theme.of(context)
        //                                   .textTheme
        //                                   .bodyText1),
        //                           value: sale.paymentType,
        //                           itemHeight: 80,
        //                           isExpanded: true,
        //                           icon: Icon(Icons.payment),
        //                           iconSize: 24,
        //                           elevation: 1,
        //                           style: TextStyle(color: Colors.deepPurple),
        //                           onChanged: (String newValue) {
        //                             _saleBloc.add(
        //                                 UpdatePaymentTypeButtonPressed(
        //                                     saleId: sale.id,
        //                                     paymentType: newValue));
        //                             // setState(() {
        //                             //   dropdownValue = newValue;
        //                             // });
        //                             // _paymentType.text = newValue;
        //                           },
        //                           items: <String>["အကြွေး", "လက်ငင်း"]
        //                               .map<DropdownMenuItem<String>>(
        //                                   (String value) {
        //                             return DropdownMenuItem<String>(
        //                               value: value,
        //                               child: Text(value),
        //                             );
        //                           }).toList(),
        //                         ),
        //                       ),

        //                       DataCell(Text(sale.total.toString() + " ကျပ်",
        //                           textAlign: TextAlign.center,
        //                           style:
        //                               Theme.of(context).textTheme.bodyText2)),
        //                       DataCell(Text(sale.createdAt,
        //                           textAlign: TextAlign.center,
        //                           style:
        //                               Theme.of(context).textTheme.bodyText2)),
        //                       DataCell(IconButton(
        //                         onPressed: () {
        //                           deleteSale(sale.id);
        //                         },
        //                         icon: Icon(Icons.delete,
        //                             size: 30, color: Colors.red),
        //                       )),
        //                     ],
        //                   )),
        //             )
        //             .toList(),
        //       )
        //     ]);
      } else {
        return Center(child: LoadingIndicator());
      }
    });
  }
}
