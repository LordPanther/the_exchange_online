import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_exchange_online/configs/config.dart';
import 'package:the_exchange_online/presentation/screens/center/bloc/center_bloc.dart';
import 'package:the_exchange_online/presentation/screens/center/bloc/center_event.dart';
import 'package:the_exchange_online/presentation/screens/center/widgets/center_body.dart';
import 'package:the_exchange_online/presentation/screens/center/widgets/center_footer.dart';
import 'package:the_exchange_online/presentation/screens/center/widgets/center_header.dart';

class CenterScreen extends StatelessWidget {
  const CenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CenterBloc()..add(LoadCenter()),
      child: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              body: SafeArea(
                child: CustomScrollView(
                  slivers: [
                    SliverPersistentHeader(
                      delegate: _CenterHeaderDelegate(
                        child: const CenterHeader(),
                      ),
                      pinned: true,
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate([const CenterBody()]),
                    ),
                    const SliverFillRemaining(
                      hasScrollBody: false,
                      child: CenterFooter(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CenterHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  _CenterHeaderDelegate({required this.child});

  @override
  double get minExtent => SizeConfig.defaultSize * 20; // Adjust this value as needed
  @override
  double get maxExtent => SizeConfig.defaultSize * 20; // Adjust this value as needed

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
