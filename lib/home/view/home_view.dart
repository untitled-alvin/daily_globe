import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:daily_globe/app/app.dart';
import 'package:daily_globe/feed/feed.dart';
import 'package:daily_globe/home/home.dart';
import 'package:daily_globe/login/login.dart';
import 'package:daily_globe/navigation/navigation.dart';
import 'package:daily_globe/search/search.dart';
import 'package:daily_globe/user_profile/user_profile.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTab =
        context.select((HomeCubit cubit) => cubit.state.tabIndex);
    return MultiBlocListener(
      listeners: [
        BlocListener<AppBloc, AppState>(
          listenWhen: (previous, current) =>
              previous.showLoginOverlay != current.showLoginOverlay,
          listener: (context, state) {
            if (state.showLoginOverlay) {
              showAppModal<void>(
                context: context,
                builder: (context) => const LoginModal(),
                routeSettings: const RouteSettings(name: LoginModal.name),
              );
            }
          },
        ),
        BlocListener<HomeCubit, HomeState>(
          listener: (context, state) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: AppLogo.dark(),
          centerTitle: true,
          actions: const [UserProfileButton()],
        ),
        drawer: const NavDrawer(),
        body: IndexedStack(
          index: selectedTab,
          children: const [
            FeedView(),
            SearchPage(),
          ],
        ),
        bottomNavigationBar: BottomNavBar(
          currentIndex: selectedTab,
          onTap: (value) => context.read<HomeCubit>().setTab(value),
        ),
      ),
    );
  }
}
