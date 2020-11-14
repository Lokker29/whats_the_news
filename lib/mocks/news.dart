import 'package:whats_the_news/models/news.dart';

List<News> getNews() {
  return [
    News(
      source: Source(name: 'BBC-News', id: 'Test id'),
      author: 'Test author',
      title: 'PayPal to let you buy and sell cryptocurrencies in the US',
      description:
          "PayPal has partnered with cryptocurrency company Paxos to launch"
          " a new service. PayPal users in the U.S. will soon be able to "
          "buy, hold and sell cryptocurrencies. More countries are coming "
          "soon. PayPal plans to support Bitcoin, Ethereum, Bitcoin Cash "
          "and Lite…",
      url:
          "http://techcrunch.com/2020/10/21/paypal-to-let-you-buy-and-sell-cryptocurrencies-in-the-us/",
      urlToImage:
          'https://i.pinimg.com/originals/76/6c/f7/766cf770ea8dd3529bd8e0c41d6784be.jpg',
      publishedAt: '2020-10-21T13:28:15Z',
      content:
          'PayPal has partnered with cryptocurrency company Paxos to launch a new '
          'service. PayPal users in the U.S. will soon be able to buy, hold'
          ' and sell cryptocurrencies. More countries are coming soon.'
          '\r\nPay… [+2069 chars]',
    )
  ];
}
