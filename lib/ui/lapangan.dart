import 'package:flutter/material.dart';

class LapanganA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Card(
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 5,
        child: Row(
          children: [
            Expanded(
              flex: 33,
              child: Image.asset(
                'img/lapangan.png',
              ),
            ),
            Expanded(
              flex: 66,
              child: Column(
                children: [
                  Expanded(
                    flex: 50,
                    child: Center(
                        child: Text(
                      'Lapangan A',
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                    )),
                  ),
                  Expanded(flex: 25, child: Text('Rumput Sintesis')),
                  Expanded(flex: 25, child: Text('Rp. 160.000')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LapanganB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Card(
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 5,
        child: Row(
          children: [
            Expanded(
              flex: 33,
              child: Image.asset(
                'img/lapangan2.png',
              ),
            ),
            Expanded(
              flex: 66,
              child: Column(
                children: [
                  Expanded(
                    flex: 50,
                    child: Center(
                        child: Text(
                      'Lapangan B',
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                    )),
                  ),
                  Expanded(flex: 25, child: Text('Vinyl')),
                  Expanded(flex: 25, child: Text('Rp. 160.000')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
