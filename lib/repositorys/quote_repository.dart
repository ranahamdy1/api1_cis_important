import 'package:api11_cis/api_constants.dart';

import '../data/data_resources/api_services.dart';
import '../data/data_resources/api_services.dart';
import '../data/models/quote_model.dart';

class QuoteRepository {
  //final apiServices = ApiServices();
  final ApiServices apiServices;
  QuoteRepository(this.apiServices);

  //ordinary one without list
  Future<QuoteModel> getRandomQuote() async {
    final response = await apiServices.getData(ApiConstants.getRandomQuote);
    return QuoteModel.fromJson(response.data);
  }

  //list query
  Future<List<QuoteModel>> getTenRandomQuotes() async {
    final response = await apiServices.getData(ApiConstants.getTenRandomQuotes);
    return (response.data as List).map((e) => QuoteModel.fromJson(e)).toList();
  }

  //like the first with parameter
  Future<QuoteModel> getRandomQuoteByTitle({required String title}) async {
    final response = await apiServices.getData(
        ApiConstants.getRandomQuoteByTitle,
        queryParams: {'title': title});
    return QuoteModel.fromJson(response.data);
  }

  Future<QuoteModel> getRandomQuoteByCharacter({required String name}) async {
    final response = await apiServices.getData(
        ApiConstants.getRandomQuoteByCharacter,
        queryParams: {'name': name});
    return QuoteModel.fromJson(response.data);
  }

  //list with parameter
  Future<List<QuoteModel>> getTenQuotesByAnimeTitle(
      {required String title}) async {
    final response = await apiServices.getData(
        ApiConstants.getTenQuotesByAnimeTitle,
        queryParams: {'title': title});
    return (response.data as List).map((e) => QuoteModel.fromJson(e)).toList();
  }

  Future<List<QuoteModel>> getTenQuotesByAnimeCharacter(
      {required String name}) async {
    final response = await apiServices.getData(
        ApiConstants.getTenQuotesByAnimeCharacter,
        queryParams: {'name': name});
    return (response.data as List).map((e) => QuoteModel.fromJson(e)).toList();
  }
}
