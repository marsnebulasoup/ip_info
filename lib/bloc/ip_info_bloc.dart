import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ip_info_api/ip_info.dart';
part 'ip_info_event.dart';
part 'ip_info_state.dart';

class IpInfoBloc extends Bloc<IpInfoEvent, IpInfoState> {
  final IpInfoApiClient ipInfoApiClient;

  IpInfoBloc({required this.ipInfoApiClient}) : super(const IpInfoState()) {
    on<IpInfoFetched>(_onIpInfoFetched);
  }

  Future<void> _onIpInfoFetched(
      IpInfoFetched event, Emitter<IpInfoState> emit) async {
    try {
      emit(state.copyWith(status: IpInfoStatus.initial));
      final IpInfo ipInfo = await ipInfoApiClient.fetchIpInfo();
      emit(state.copyWith(
        status: IpInfoStatus.success,
        ipInfo: ipInfo,
      ));
    } catch (_) {
      emit(const IpInfoState(status: IpInfoStatus.failure));
      rethrow;
    }
  }
}
