part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchResult extends SearchState {
  final List<Product> productsByQuery;
  final String query;
  const SearchResult(this.productsByQuery, this.query);
  @override
  List<Object> get props => [query, productsByQuery];

}
