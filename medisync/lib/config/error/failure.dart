import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable {
  final String message;

  const Failures(this.message);

  @override
  List<Object?> get props => [
        message,
      ];
}

class ServerFailure extends Failures {
  const ServerFailure(super.message);
}

class ConnectionFailure extends Failures {
  const ConnectionFailure(super.message);
}

class TimeOutFailure extends Failures {
  const TimeOutFailure(super.message);
}

class CachedFailure extends Failures {
  const CachedFailure(super.message);
}

class NotFoundFailure extends Failures {
  const NotFoundFailure(super.message);
}
