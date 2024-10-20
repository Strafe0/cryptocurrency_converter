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
    return Consumer<AuthNotifier>(
      builder: (context, authNotifier, child) {
        if (authNotifier.authenticated) {
          return Scaffold(
            appBar: _AppBar(selectedIndex, _onLogoutPressed),
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
        } else {
          return const AuthScreen();
        }
      }
    );
  }

  void _onLogoutPressed() async {
    await context.read<AuthNotifier>().logout();
    if (mounted) {
      context.read<RatesNotifier>().clear();
      context.read<ConvertNotifier>().clear();
    }
    setState(() => selectedIndex = 0);
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar(this.selectedPageIndex, this.onLogoutPressed);

  final int selectedPageIndex;
  final void Function() onLogoutPressed;

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
          onPressed: onLogoutPressed,
          icon: const Icon(Icons.logout),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}