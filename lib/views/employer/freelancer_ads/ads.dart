import 'package:flutter/material.dart';
import 'package:freelance_world_flutter/services/employer_service.dart';
// import 'package:stateful_widget/pages/ads/form-new-ad.dart';
// import 'package:stateful_widget/utils/http.helper.dart';
import 'package:freelance_world_flutter/services/freelancer_service.dart';
import 'package:freelance_world_flutter/shared/side_menu.dart';
import 'package:freelance_world_flutter/views/employer/employer_ads/form-new-ad.dart';
// import 'package:freelance_world_flutter/views/freelancer/freelancer_ads/drawer-ad.dart';
// import 'package:freelance_world_flutter/views/freelancer/freelancer_ads/form-new-ad.dart';
import 'package:freelance_world_flutter/models/offer.dart';

class Ads extends StatefulWidget {
  Ads({Key? key}): super(key: key);

  @override
  State<Ads> createState() => _AdsState();
}

class _AdsState extends State<Ads> {
  

  @override 
  Widget build(BuildContext context){
    
    return Scaffold(
        appBar: AppBar(
          title: Text('FreelanceWorld'),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
                print("se enfoca el input buscador");
              } ,
              color: Colors.grey,
            )
          ],

        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:  <Widget>[
              NavAd(),
              Expanded(child: ListAds())
              
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.add),
        //   onPressed: (){
        //     print("se agrego manin");
        //   },
        // ),
        drawer: Drawer(child: MenuPage())
      );
  }

}



class NavAd extends StatelessWidget {
  const NavAd({Key? key}) : super(key: key);
  @override 
  Widget build(BuildContext context) {
    return Card(
       color: Colors.blue[50],
                margin: EdgeInsets.all(20),
                 child: Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: <Widget>[
                      Text(
                        "Mis anuncios",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900],
                          fontSize: 20
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 400,
                        child: TextField(
                          decoration: InputDecoration(labelText: "Puesto, empresa o palabra clave"),
                          
                        ),
                      ),
                      SizedBox(height: 15),
                      ElevatedButton(
                        child: Text("Buscar"),
                        onPressed: (){},
                      ),
                      SizedBox(height: 15),
                      ElevatedButton(
                        child: Text("Filtrar"),
                        onPressed: (){},

                        style: ElevatedButton.styleFrom(primary: Colors.blue[300]),
                      ),
                  
                     ]
                   ),
                 ),
    );
  }
}

class ListAds extends StatefulWidget {
  
  ListAds({Key? key}) : super(key: key);

  @override
  State<ListAds> createState() => _ListAdsState();
}

class _ListAdsState extends State<ListAds> {
  // final List<Anuncio> anuncios = [];
  // late HttpHelper httpHelper;
  late EmployerService employerService;
  late List offers;
  
  @override
  void initState() {
    // TODO: implement initState
    offers = [];
    // httpHelper = HttpHelper();
    employerService = EmployerService();
    // fetchOffers();
    super.initState();
  }

  @override 
  Widget build(BuildContext context) {
    
    print(offers.length.toString() + " cantidad");
    return offers.length > 0
    ? Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: offers.length,
          itemBuilder: (BuildContext context,index) {
            return AdRow(offer: offers[index]);
          },
        ),
      ),
    )
    : NoAd();
  }
  void fetchOffers() async{
  employerService.fetchOffers().then((value){
    setState(() {
      print(value);
      offers = value;
    });
  }).catchError((onError)=> print(onError));

}
}

class NoAd extends StatelessWidget {
  const NoAd({Key? key}) : super(key: key);
  @override 
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("No tiene anuncios",
            style: TextStyle(fontSize: 15, color: Colors.blue[800])),
            SizedBox(height: 15),
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Crear nuevo anuncio",
                    style: TextStyle(fontSize: 20, color: Colors.blue[800], fontWeight: FontWeight.bold)),
                  // IconButton(
                  //   icon: Icon(Icons.add_circle),
                  //   onPressed: (){
                  //     print("click agregar anuncio");
                  //     _goToFormNewAd(context);
                  //   },
                  // ),
                  FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: (){
                      print("se agrego manin");
                      print("click agregar anuncio");
                      _goToFormNewAd(context);
                    },
                  ),
                  
                ],
              ),
            )

          ]
        ),
      ),
    );
  }

  void _goToFormNewAd(BuildContext context) {
    final route = MaterialPageRoute(builder: (BuildContext context){
      return FormNewAd();
    });
    Navigator.of(context).push(route);
  }
}

class AdRow extends StatefulWidget {
  

  final Offer offer;

  AdRow({Key? key, required this.offer}) : super(key: key);

  @override
  State<AdRow> createState() => _AdRowState();
}

class _AdRowState extends State<AdRow> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              
              children: [
                Text(widget.offer.description!,
                style: TextStyle(fontSize: 10,color: Colors.grey),)
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.offer.title!,
                style: TextStyle(fontSize: 20, color: Colors.blue[800], fontWeight: FontWeight.bold))
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                
                Text(widget.offer.monthDuration.toString()+" Meses",
                style: TextStyle(fontSize: 15, color: Colors.orange[700]))
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("S/." + widget.offer.paymentAmount.toString(),
                style: TextStyle(fontSize: 10, color: Colors.grey)),
                Text(widget.offer.specialty!.name,
                style: TextStyle(fontSize: 10, color: Colors.grey))
              ],
            ),
          ],
        ),
      )
    );
  }
}