import 'package:flutter/material.dart';
import 'package:flutter_action/model/photo.dart';
import 'package:flutter_action/view/photoitemview.dart';
const String _kGalleryAssetsPackage = 'flutter_gallery_assets';

class PhotoGridView {
  List<Photo> photos = <Photo>[
    Photo(
      assetName: 'places/india_chennai_flower_market.png',
      assetPackage: _kGalleryAssetsPackage,
      title: 'Chennai',
      caption: 'Flower Market',
    ),
    Photo(
      assetName: 'places/india_tanjore_bronze_works.png',
      assetPackage: _kGalleryAssetsPackage,
      title: 'Tanjore',
      caption: 'Bronze Works',
    ),
    Photo(
      assetName: 'places/india_tanjore_market_merchant.png',
      assetPackage: _kGalleryAssetsPackage,
      title: 'Tanjore',
      caption: 'Market',
    ),
    Photo(
      assetName: 'places/india_tanjore_thanjavur_temple.png',
      assetPackage: _kGalleryAssetsPackage,
      title: 'Tanjore',
      caption: 'Thanjavur Temple',
    ),
    Photo(
      assetName: 'places/india_tanjore_thanjavur_temple_carvings.png',
      assetPackage: _kGalleryAssetsPackage,
      title: 'Tanjore',
      caption: 'Thanjavur Temple',
    ),
    Photo(
      assetName: 'places/india_pondicherry_salt_farm.png',
      assetPackage: _kGalleryAssetsPackage,
      title: 'Pondicherry',
      caption: 'Salt Farm',
    ),
    Photo(
      assetName: 'places/india_chennai_highway.png',
      assetPackage: _kGalleryAssetsPackage,
      title: 'Chennai',
      caption: 'Scooters',
    ),
    Photo(
      assetName: 'places/india_chettinad_silk_maker.png',
      assetPackage: _kGalleryAssetsPackage,
      title: 'Chettinad',
      caption: 'Silk Maker',
    ),
    Photo(
      assetName: 'places/india_chettinad_produce.png',
      assetPackage: _kGalleryAssetsPackage,
      title: 'Chettinad',
      caption: 'Lunch Prep',
    ),
    Photo(
      assetName: 'places/india_tanjore_market_technology.png',
      assetPackage: _kGalleryAssetsPackage,
      title: 'Tanjore',
      caption: 'Market',
    ),
    Photo(
      assetName: 'places/india_pondicherry_beach.png',
      assetPackage: _kGalleryAssetsPackage,
      title: 'Pondicherry',
      caption: 'Beach',
    ),
    Photo(
      assetName: 'places/india_pondicherry_fisherman.png',
      assetPackage: _kGalleryAssetsPackage,
      title: 'Pondicherry',
      caption: 'Fisherman',
    ),
  ];

  GridView build(BuildContext context) {
    return new GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      padding: const EdgeInsets.all(4.0),
      primary: true,
      childAspectRatio: 1.0,
      children: photos.map<Widget>((Photo photo) {
        return GridDemoPhotoItem(
            photo: photo,
            onBannerTap: (Photo photo) {
            });
      }).toList(),
    );
  }
}
