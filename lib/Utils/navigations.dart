class NavigationItem {
  final String title;
  final String iconPath;

  NavigationItem({required this.title, required this.iconPath});
}

final List<NavigationItem> navigationItems = [
  NavigationItem(title: 'Search', iconPath: 'assets/icons/navigation/search.png'),
  NavigationItem(title: 'Favorites', iconPath: 'assets/icons/navigation/favorites.png'),
  NavigationItem(title: 'Pets', iconPath: 'assets/icons/navigation/paw_logo.png'),
  NavigationItem(title: 'Messages', iconPath: 'assets/icons/navigation/messages.png'),
  NavigationItem(title: 'Profile', iconPath: 'assets/icons/navigation/user.png'),
];
