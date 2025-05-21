import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:mdk_home/common/index.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  GoogleMapController? _mapController;
  final LatLng _center = const LatLng(35.2902868869331, 129.110649316745);
  final Set<Marker> _markers = {};

  BitmapDescriptor _customMarkerIcon = BitmapDescriptor.defaultMarker;
  bool _isIconLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isIconLoading && mounted) {
      _isIconLoading = true;
      _loadCustomMarkerIcon().catchError((error) {
        if (mounted) {
          print(
            'Error during _loadCustomMarkerIcon in didChangeDependencies: $error',
          );
          setState(() {
            _addMarker();
          });
        }
      });
    }
  }

  Future<void> _loadCustomMarkerIcon() async {
    final ImageConfiguration imageConfiguration = createLocalImageConfiguration(
      context,
      size: const Size(48, 48),
    );

    try {
      final BitmapDescriptor icon = await BitmapDescriptor.fromAssetImage(
        imageConfiguration,
        'assets/img/logo_marker.png',
      );
      if (mounted) {
        setState(() {
          _customMarkerIcon = icon;
          _addMarker();
        });
      }
    } catch (e) {
      print('Error loading custom marker icon in _loadCustomMarkerIcon: $e');
      if (mounted) {
        setState(() {
          _addMarker();
        });
      }
    }
  }

  void _addMarker() {
    _markers.clear();
    _markers.add(
      Marker(
        markerId: const MarkerId('company_location'),
        position: _center,
        icon: _customMarkerIcon,
      ),
    );
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _buildMobile(context),
      tablet: (context) => _buildTablet(context),
      desktop: (context) => _buildDesktop(context),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 100),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          height: 500,
          child: _buildMap(),
        ),
      ),
    );
  }

  Widget _buildTablet(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
      height: 500,
      child: _buildMap(),
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
      height: 450,
      child: _buildMap(),
    );
  }

  Widget _buildMap() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
        initialCameraPosition: CameraPosition(target: _center, zoom: 14),
        markers: _markers,
        zoomControlsEnabled: true,
        mapToolbarEnabled: false,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}
