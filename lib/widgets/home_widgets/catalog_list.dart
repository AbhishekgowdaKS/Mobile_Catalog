import 'package:flutter/material.dart';
import 'package:mobile_cataloge/models/catalog.dart';
import 'package:mobile_cataloge/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'catalog_item.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20.0),
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                  onTap: () => context.vxNav.push(
                    Uri(
                      path: MyRoutes.homeDetailRoute,
                      queryParameters: {"id": catalog.id.toString()},
                    ),
                    params: catalog,
                  ),
                  child: CatalogItem(catalog: catalog));
            },
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                onTap: () => context.vxNav.push(
                  Uri(
                    path: MyRoutes.homeDetailRoute,
                    queryParameters: {"id": catalog.id.toString()},
                  ),
                  params: catalog,
                ),
                child: CatalogItem(catalog: catalog),
              );
            },
          );
  }
}
