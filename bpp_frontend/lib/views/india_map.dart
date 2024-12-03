import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class IndiaMap extends StatefulWidget {
  @override
  _IndiaMapState createState() => _IndiaMapState();
}

class _IndiaMapState extends State<IndiaMap> {
  final MapController _mapController = MapController();

  // A combined list of states and major cities
  final Map<String, LatLng> _locations = {
    "Delhi": LatLng(28.6139, 77.2090),
    "Mumbai": LatLng(19.0760, 72.8777),
    "Kolkata": LatLng(22.5726, 88.3639),
    "Bangalore": LatLng(12.9716, 77.5946),
    "Chennai": LatLng(13.0827, 80.2707),
    "Hyderabad": LatLng(17.3850, 78.4867),
    "Jaipur": LatLng(26.9124, 75.7873),
    "Ahmedabad": LatLng(23.0225, 72.5714),
    "Pune": LatLng(18.5204, 73.8567),
    "Chandigarh": LatLng(30.7333, 76.7794),
    "Lucknow": LatLng(26.8467, 80.9462),
    "Bhopal": LatLng(23.2599, 77.4126),
    "Surat": LatLng(21.1702, 72.8311),
    "Patna": LatLng(25.5941, 85.1376),
    // States with approximate central coordinates
    "Maharashtra": LatLng(19.6633, 75.3202),
    "Gujarat": LatLng(22.2587, 71.1924),
    "Uttar Pradesh": LatLng(26.8467, 80.9462),
    "Tamil Nadu": LatLng(11.1271, 78.6569),
    "Karnataka": LatLng(15.3173, 75.7139),
    "Rajasthan": LatLng(27.0238, 74.2179),
    "West Bengal": LatLng(22.9868, 87.8550),
    "Andhra Pradesh": LatLng(15.9129, 79.7400),
    "Kerala": LatLng(10.8505, 76.2711),
    "Bihar": LatLng(25.0961, 85.3131),
    // Add other states as needed
  };

  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          height: 400,
          decoration: BoxDecoration(
            color: Colors.grey[300], // Background color when map is loading
          ),
          child: Stack(
            children: [
              FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  center: LatLng(20.5937, 78.9629), // Center on India
                  zoom: 5.0, // Initial zoom level
                  minZoom: 3.0,
                  maxZoom: 10.0,
                  interactiveFlags: InteractiveFlag.all,
                  bounds: LatLngBounds(
                    LatLng(6.0, 68.0), // Southwest corner of India
                    LatLng(37.0, 97.0), // Northeast corner of India
                  ),
                  boundsOptions: FitBoundsOptions(
                    padding: EdgeInsets.all(12.0),
                  ),
                ),
                children: [
                  TileLayer(
                    urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                  ),
                ],
              ),

              // Search Bar
              Positioned(
                top: 10,
                left: 14,
                right: 60,
                child: Container(
                  height: 36, // Reduced height for the container
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search place or state...',
                      border: InputBorder.none,
                      icon: Icon(Icons.search, color: Colors.black, size: 18), // Reduced icon size
                      contentPadding: EdgeInsets.symmetric(vertical: 8), // Reduced vertical padding
                      isDense: true, // Reduced height of the input field
                    ),
                    style: TextStyle(fontSize: 14), // Smaller font size
                  ),
                ),
              ),

              // Displaying search results
              if (_searchQuery.isNotEmpty)
                Positioned(
                  top: 60,
                  left: 10,
                  right: 10,
                  child: Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        children: _locations.keys
                            .where((place) => place.toLowerCase().contains(_searchQuery.toLowerCase()))
                            .map((place) => ListTile(
                          title: Text(place),
                          onTap: () {
                            _onPlaceSelected(place);
                          },
                        ))
                            .toList(),
                      ),
                    ),
                  ),
                ),

              // Zoom Controls
              Positioned(
                top: 10,
                right: 10,
                child: Column(
                  children: [
                    _buildZoomButton(
                      icon: Icons.add,
                      onPressed: () {
                        _zoomMap(zoomIn: true);
                      },
                    ),
                    SizedBox(height: 8),
                    _buildZoomButton(
                      icon: Icons.remove,
                      onPressed: () {
                        _zoomMap(zoomIn: false);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Create rounded buttons for zooming
  Widget _buildZoomButton({required IconData icon, required VoidCallback onPressed}) {
    return Material(
      color: Colors.white,
      shape: CircleBorder(),
      elevation: 4.0,
      child: InkWell(
        onTap: onPressed,
        customBorder: CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(icon, color: Colors.black87, size: 18),
        ),
      ),
    );
  }

  // Zoom function without animation
  void _zoomMap({required bool zoomIn}) {
    double currentZoom = _mapController.zoom;
    double newZoom = zoomIn ? currentZoom + 1 : currentZoom - 1;
    _mapController.move(_mapController.center, newZoom); // Update the map zoom
  }

  // Handle place or state selection from search suggestions
  void _onPlaceSelected(String place) {
    if (_locations.containsKey(place)) {
      _mapController.move(_locations[place]!, 7.0); // Zoom into the place (state or city)
    }

    setState(() {
      _searchQuery = ''; // Clear search query after selection
    });
  }
}
