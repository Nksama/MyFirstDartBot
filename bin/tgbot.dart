import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:tgbot/tgbot.dart';

Future<void> main(List<String> args) async {
  final bot = TeleDart("",
      Event("@dartbottestbot"));

  bot.start();
  //

  bot.onCommand("start").listen(
      (message) => bot.sendMessage(message.chat.id, "Hello there\nuse /help"));

  bot.onCommand("meme").listen((message) async {
    try {
      var image = await getMeme();
      bot.sendPhoto(message.chat.id, image.image, caption: image.title);
    } catch (e) {
      print(e);
    }
  });

  bot.onCommand("quote").listen((message) async {
    try {
      var quote = await getQuote();
      bot.sendMessage(
          message.chat.id, "_${quote.quote}_\n  - *${quote.character}*",
          parse_mode: "markdown");
    } catch (e) {
      print(e);
    }
  });

  bot.onCommand("help").listen((message) {
    bot.sendMessage(message.chat.id, "/meme to get a random meme\n/quote to get a random quote");
  });
}
