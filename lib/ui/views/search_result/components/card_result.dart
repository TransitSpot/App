import 'package:flutter/material.dart';
import 'package:transitspot/utils/app_color.dart';
import 'package:transitspot/datamodels/search_result_data/search_result_data.dart';

class CardResult extends StatelessWidget {
  final SearchResultData data;

  const CardResult({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
      child: Card(
          color: AppColors.secondaryBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 0,
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xFFF46363),
                    ),
                    title: Text(
                      '${data.start} to ${data.destination}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppColors.content,
                      ),
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: AppColors.darkSecondaryBackground,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    child: Row(children: [
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            {'text': data.date, 'icon': Icons.calendar_today},
                            {
                              'text': data.time,
                              'icon': Icons.access_time_sharp
                            },
                            {
                              'text': data.price,
                              'icon': Icons.attach_money_sharp
                            },
                          ].map((Map x) {
                            return Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: AppColors.content,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  children: [
                                    WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 3.0,
                                        ),
                                        child: Icon(x['icon']),
                                      ),
                                    ),
                                    TextSpan(text: x['text']),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const Expanded(
                        flex: 2,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 4,
                        child: Center(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.primaryBackground),
                              elevation: MaterialStateProperty.all<double>(4.0),
                            ),
                            child: Text('Book now',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.content,
                                )),
                            onPressed: () {},
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              )
              // Text(data.start),
              // Text(data.destination),
              // Text(data.date),
              // Text(data.time),
              // Text(data.price),
            ],
          )),
    );
  }
}
