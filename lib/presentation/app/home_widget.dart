part of 'app.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final List<Widget> _pages = const [
    RatesList(),
    ConvertPage(),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(selectedIndex),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.monetization_on_outlined),
            label: 'Rates',
          ),
          NavigationDestination(
            icon: Icon(Icons.compare_arrows),
            label: 'Convert',
          ),
        ],
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: _pages,
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar(this.selectedPageIndex);

  final int selectedPageIndex;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(selectedPageIndex == 0 ? 'Rates' : 'Convert'),
      leading: selectedPageIndex == 0
          ? IconButton(
        onPressed: () {
          context.read<RatesNotifier>().getCurrencies();
        },
        icon: const Icon(Icons.refresh),
      )
          : null,
      actions: [
        IconButton(
          onPressed: null,
          icon: const Icon(Icons.logout),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}