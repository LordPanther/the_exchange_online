import 'package:equatable/equatable.dart';
import 'package:the_exchange_online/presentation/screens/center/bloc/center_bloc.dart';

abstract class CenterState extends Equatable {
  const CenterState();

  @override
  List<Object?> get props => [];
}

/// Loading
class CenterLoading extends CenterState {}

/// Adready data
class CenterLoaded extends CenterState {
  final CenterResponse centerResponse;

  const CenterLoaded({required this.centerResponse});

  @override
  List<Object?> get props => [centerResponse];
}

/// Failure
class CenterLoadFailure extends CenterState {
  final String error;

  const CenterLoadFailure(this.error);
}
