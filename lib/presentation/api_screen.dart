import 'package:flutter/material.dart';
import '../data/data_resources/api_services.dart';
import '../data/models/quote_model.dart';
import '../repositorys/quote_repository.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({Key? key}) : super(key: key);

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  /*final QuoteRepository quoteRepository;
  ApiScreen(this.quoteRepository);*/
  final QuoteRepository quoteRepository = QuoteRepository(ApiServices());
  List<QuoteModel> quotes = [];

  bool isLoading = true;
  @override
  void initState() {
    getRequest();
    super.initState();
  }

  void getRequest() async {
    quotes = await quoteRepository.getTenRandomQuotes();
    setState(() {
      isLoading = false;
    });

    /*quotes = await quoteRepository.getTenQuotesByAnimeTitle(title: "title");
    setState(() {
      isLoading = false;
    });*/

    /*for (var quote in quotes) {
      print(quote.anime);
    }*/

    /*final quotesTitle =
        await quoteRepository.getRandomQuoteByTitle(title: "llll");
    print("title ${quotesTitle.anime}");*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(quotes[index].anime),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
              itemCount: quotes.length),
    );
  }
}
