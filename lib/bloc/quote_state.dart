import 'package:flutterblocrestapi/model/Quote.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class QuoteState extends Equatable {
  const QuoteState();

  @override
  List<Object> get props => [];
}

class QuoteEmpty extends QuoteState {}

class QuoteLoading extends QuoteState {}

class QuoteLoaded extends QuoteState {
  final Quote quote;

  const QuoteLoaded({@required this.quote}) : assert(quote != null);

  @override
  List<Object> get props => [quote];
}

class QuoteError extends QuoteState {}