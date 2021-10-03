import 'package:space_trash/src/space/domain/entities/space_entity.dart';
import 'package:space_trash/src/space/domain/entities/space_object.dart';
import 'package:space_trash/src/space/infra/datasources/space_datasource.dart';

final mockList = [
  SpaceEntity(name: 'STARLINK', type: Type.active, spaceObjects: const [
    SpaceObject(
        name: 'STARLINK-61',
        norad: '44249',
        designator: '2019-029Q',
        period: '94.56',
        inclination: '52.99',
        apogee: '502',
        perigee: '493',
        exentricity: '0.0006943'),
    SpaceObject(
        name: 'STARLINK-71',
        norad: '44252',
        designator: '2019-029T',
        period: '94.77',
        inclination: '52.99',
        apogee: '508',
        perigee: '506',
        exentricity: '0.0001327'),
  ]),
  SpaceEntity(name: 'Cosmos', type: Type.debris, spaceObjects: const [
    SpaceObject(
        name: 'COSMOS 2251',
        norad: '22675',
        designator: '1993-036A',
        period: '100.52',
        inclination: '74.04',
        apogee: '802',
        perigee: '765',
        exentricity: '0.0025684'),
    SpaceObject(
        name: 'COSMOS 2251 DEB',
        norad: '33757',
        designator: '1993-036E',
        period: '100.55',
        inclination: '74.04',
        apogee: '796',
        perigee: '773',
        exentricity: '0.0016150'),
    SpaceObject(
        name: 'COSMOS 2251 DEB',
        norad: '33758',
        designator: '1993-036F',
        period: '100.05',
        inclination: '74.03',
        apogee: '777',
        perigee: '745',
        exentricity: '0.0022645'),
  ])
];

class CelestekDataSource implements SpaceDataSource {
  @override
  Future<List<SpaceEntity>> showSpaceEntity() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return mockList.where((element) => true).toList();
  }

  @override
  Future<List<SpaceObject>> showSpaceObjects(final String name) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return mockList
        .where((element) => element.name == name)
        .first
        .spaceObjects
        .toList();
  }
}
