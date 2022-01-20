import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Meme> getMeme() async {
  final res =
      await http.get(Uri.parse("https://nksamamemeapi.pythonanywhere.com"));

  if (res.statusCode == 200) {
    return Meme.fromJson(jsonDecode(res.body));
  } else {
    throw Exception('Failed to load meme');
  }
}

Future<Quote> getQuote() async {
  final res =
      await http.get(Uri.parse("https://animechan.vercel.app/api/random"));

  if (res.statusCode == 200) {
    return Quote.fromJson(jsonDecode(res.body));
  } else {
    throw Exception('Failed to load quote');
  }
}

class Meme {
  final String image;
  final String title;
  final String reddit;

  Meme({
    required this.image,
    required this.title,
    required this.reddit,
  });

  factory Meme.fromJson(Map<String, dynamic> json) {
    return Meme(
      image: json['image'],
      title: json['title'],
      reddit: json['reddit'],
    );
  }
}

class Quote {
  final String quote;
  final String character;

  Quote({
    required this.quote,
    required this.character,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      quote: json['quote'],
      character: json['character'],
    );
  }
}
