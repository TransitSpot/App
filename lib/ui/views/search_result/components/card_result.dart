import 'package:flutter/material.dart';
import 'package:transitspot/utils/app_color.dart';
import 'package:transitspot/datamodels/search_result_data/search_result_data.dart';

class CardResult extends StatelessWidget {
  final SearchResultData data;
  final Future Function(SearchResultData)? book;
  final bool hasButton;

  const CardResult({
    Key? key,
    required this.data,
    required this.hasButton,
    this.book,
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
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'lib/assets/home/card-bg.png'), // must constant image path
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 0,
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.directions_bus, size: 50.0),
                      title: Text(
                        data.name,
                        style: TextStyle(
                          fontSize: 27.0,
                          fontWeight: FontWeight.w500,
                          color: AppColors.content,
                        ),
                      ),
                      subtitle: Text(
                        '${data.start} to ${data.destination}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: AppColors.content,
                        ),
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
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: AppColors.content,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  children: [
                                    const WidgetSpan(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 3.0,
                                        ),
                                        child: Icon(Icons.attach_money_sharp),
                                      ),
                                    ),
                                    TextSpan(text: data.price),
                                  ],
                                ),
                              ),
                            ),
                            (!hasButton)
                                ? const SizedBox(height: 20.0)
                                : Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        16.0, 0, 0, 0),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        fixedSize:
                                            MaterialStateProperty.all<Size>(
                                          const Size.fromWidth(100),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                AppColors.primaryBackground),
                                        elevation:
                                            MaterialStateProperty.all<double>(
                                                4.0),
                                      ),
                                      child: Text('Book now',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: AppColors.content,
                                          )),
                                      onPressed: () {
                                        book!(data);
                                      },
                                    ),
                                  ),
                          ],
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
