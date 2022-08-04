part of 'ip_info_bloc.dart';

abstract class IpInfoEvent extends Equatable {
  const IpInfoEvent();

  @override
  List<Object> get props => [];
}

class IpInfoFetched extends IpInfoEvent {}
