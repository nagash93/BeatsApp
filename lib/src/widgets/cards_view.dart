import 'package:beats_app/src/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:beats_app/src/providers/products_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);

    return Container(
      width: double.infinity,
      height: 460.0,
      child: PageView(
        children: productsProvider.products.map((prod) => _Card(prod)).toList(),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  Product prod;
  _Card(this.prod);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              _LateralInfo(prod),
              SizedBox(width: 55.0),
              _CardDescription(prod),
            ],
          ),
          Positioned(
            top: 90.0,
            left: 50.0,
            child: Image(
              image: AssetImage('assets/${prod.url}'),
              width: 160.0,
            ),
          ),
        ],
      ),
    );
  }
}

class _CardDescription extends StatelessWidget {
  Product prod;
  _CardDescription(this.prod);

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    final size = MediaQuery.of(context).size;

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
          width: size.width * 0.55,
          height: 340.0,
          color: Color(prod.color),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 25.0,
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      prod.titulo,
                      style: TextStyle(
                        color: Colors.white24,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      prod.subtitulo,
                      style: TextStyle(
                        color: Colors.white24,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      prod.nombre,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      child: Icon(
                        prod.favorito ? Icons.favorite : Icons.favorite_border,
                        color: Colors.white,
                      ),
                      onTap: () {
                        prod.favorito = !prod.favorito;
                        productsProvider.notify();
                        print(prod.nombre + ' - ' + prod.favorito.toString());
                      },
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child: Text(
                      '\$${prod.precio}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    width: size.width * 0.2,
                  ),
                  Container(
                    child: Center(
                      child: InkWell(
                        child: Text(
                          'Add to bag',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                    width: size.width * 0.3,
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LateralInfo extends StatelessWidget {
  Product prod;
  _LateralInfo(this.prod);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: RotatedBox(
        quarterTurns: 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              FontAwesomeIcons.batteryFull,
              size: 15.0,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              '${prod.bateria}-Hour Battery',
              style: TextStyle(fontSize: 12.0),
            ),
            SizedBox(
              width: 30.0,
            ),
            Icon(
              FontAwesomeIcons.wifi,
              size: 15.0,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Wireless',
              style: TextStyle(fontSize: 12.0),
            ),
          ],
        ),
      ),
    );
  }
}
