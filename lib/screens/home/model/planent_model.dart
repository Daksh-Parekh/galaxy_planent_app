class MainModel {
  SolarSystemModel? solars;
  MainModel({this.solars});
  factory MainModel.mapToModel(Map m1) {
    return MainModel(
      solars: SolarSystemModel.mapToModel(m1['solarSystem']),
    );
  }
}

class SolarSystemModel {
  List<Planet>? planets = [];

  SolarSystemModel({this.planets});

  factory SolarSystemModel.mapToModel(Map m2) {
    List p1 = m2['planets'];
    // print('${p1}');
    return SolarSystemModel(
      planets: p1
          .map(
            (e) => Planet.mapToModel(e),
          )
          .toList(),
    );
  }
}

class Planet {
  String? name, mass, desc, avgOrbitSpeed, surfaceArea, rotationPeriod, image;
  num? diameter;
  int? noOfSatellite, orderSum, id;
  bool? isFavourite = false;

  Planet(
      {this.name,
      this.diameter,
      this.mass,
      this.noOfSatellite,
      this.desc,
      this.avgOrbitSpeed,
      this.surfaceArea,
      this.rotationPeriod,
      this.image,
      this.orderSum,
      this.id,
      this.isFavourite});

  factory Planet.mapToModel(Map m1) {
    return Planet(
      name: m1['name'],
      diameter: m1['diameter'],
      mass: m1['mass'],
      noOfSatellite: m1['numberOfSatellites'],
      desc: m1['description'],
      avgOrbitSpeed: m1['averageOrbitalSpeed'],
      surfaceArea: m1['surfaceArea'],
      rotationPeriod: m1['rotationPeriod'],
      image: m1['image'],
      orderSum: m1['orderFromSun'],
      isFavourite: false,
      id: m1['id'],
    );
  }
}
