import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:logaru/interfaces/special_offers_inferface.dart';
import 'package:logaru/stores/restaurant_store.dart';
import 'package:provider/provider.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantStore = Provider.of<RestaurantStore>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Comidas deliciosas o aguardam',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  const TabBar(
                    tabs: [
                      Tab(text: 'Aperitivos'),
                      Tab(text: 'Principais'),
                      Tab(text: 'Sobremesas'),
                      Tab(text: 'Bebidas'),
                    ],
                    isScrollable: true,
                    indicatorColor: Colors.red,
                    labelColor: Colors.black,
                  ),
                  SizedBox(
                    height: 375,
                    child: TabBarView(
                      children: [
                        _buildMenuList(restaurantStore, 'Aperitivos'),
                        _buildMenuList(restaurantStore, 'Principais'),
                        _buildMenuList(restaurantStore, 'Sobremesas'),
                        _buildMenuList(restaurantStore, 'Bebidas'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Ofertas especiais",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: restaurantStore.specialOffers.length,
                      itemBuilder: (context, index) {
                        final specialOffer =
                            restaurantStore.specialOffers[index];
                        return _buildSpecialOffer(specialOffer);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuList(RestaurantStore store, String category) {
    return Observer(
      builder: (_) {
        final items =
            store.menuItems.where((item) => item.category == category).toList();
        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Card(
              child: ListTile(
                leading: Image.network(item.imageUrl),
                title: Text(item.name),
                subtitle: Text(item.price.toStringAsFixed(2)),
                trailing: ElevatedButton(
                  onPressed: () {
                    store.addToCart(item);
                  },
                  child: const Text('Adicionar ao carrinho'),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildSpecialOffer(SpecialOffer offer) {
    return Card(
      child: Column(
        children: [
          Image.network(offer.imageUrl, width: 100, height: 80),
          Text(offer.name),
          Text('Desconto: ${offer.discount}%'),
        ],
      ),
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = [
    const Text('Home Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    const MenuView(),
    const Text('Order Tracking',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    const Text('User Account',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final restaurantStore = Provider.of<RestaurantStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Name'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping),
            label: 'Track Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
