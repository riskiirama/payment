import 'package:flutter/material.dart';
import 'package:payment/theme.dart';

void main() {
  runApp(PaymentApps());
}

class PaymentApps extends StatefulWidget {
  @override
  _PaymentAppsState createState() => _PaymentAppsState();
}

class _PaymentAppsState extends State<PaymentApps> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    Widget option(int index, String title, String subTitle, String price) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
                color: selectedIndex == index
                    ? Color(0xff007DFF)
                    : Color(0xff4D5B7C)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  selectedIndex == index
                      ? Image.asset(
                          'assets/check1.png',
                          width: 18,
                          height: 18,
                        )
                      : Image.asset(
                          'assets/check.png',
                          height: 18,
                          width: 18,
                        ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: planTextStyle,
                      ),
                      Text(
                        subTitle,
                        style: descTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 91,
                  ),
                  Text(
                    price,
                    style: priceTextStyle,
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget header() {
      return Padding(
        padding: const EdgeInsets.only(top: 50, left: 32, right: 32),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/profile.png',
                width: 267,
                height: 200,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Upgrade to',
                  style: titleTextStyle,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Pro',
                  style: titleProTextStyle,
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Go unlock all features and \nbuild your own business bigger',
              style: subTitleTextStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    Widget checkoutButton() {
      return Column(
        children: [
          Container(
            width: 331,
            height: 51.23,
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xff007DFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      71,
                    ),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Checkout Now',
                  style: priceTextStyle,
                )),
          )
        ],
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff04112F),
        body: SingleChildScrollView(
          child: Column(
            children: [
              header(),
              SizedBox(height: 50),
              option(0, 'Monthly', 'Good for starting up', '\$20'),
              option(1, 'Quarterly', 'Focusing on building', '\$55'),
              option(2, 'Yearly', 'Steady company', '\$220'),
              SizedBox(
                height: 50,
              ),
              selectedIndex == -1 ? SizedBox() : checkoutButton(),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
