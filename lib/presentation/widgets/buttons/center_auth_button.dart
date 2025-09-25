// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:the_exchange_online/configs/size_config.dart';
// import 'package:the_exchange_online/presentation/common_blocs/auth/auth_bloc.dart';
// import 'package:the_exchange_online/presentation/common_blocs/auth/auth_state.dart';
// import 'package:the_exchange_online/presentation/widgets/buttons/center_button.dart';
// import 'package:the_exchange_online/presentation/widgets/buttons/profile_button.dart';
// import 'package:the_exchange_online/presentation/widgets/custom_widgets.dart';

// class CenetrAuthButton extends StatelessWidget {
//   final Function() center;
//   final Function() profile;

//   const CenetrAuthButton({
//     super.key,
//     required this.center,
//     required this.profile,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AuthenticationBloc, AuthenticationState>(
//       builder: (context, state) {
//         if (state is Unauthenticated) {
//           return CenterButton(onPressed: center, name: state.);
//         }

//         if (state is Authenticated) {
//           return ProfileButton(
//             onPressed: profile,
//             name: state.user.username,
//           );
//         }
//         return const Loading();
//       },
//     );
//   }
// }
