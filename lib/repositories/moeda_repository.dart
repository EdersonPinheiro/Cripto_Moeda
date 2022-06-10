import '../models/moeda.dart';

class MoedaRepository {
  static List<Moeda> tabela = [
    Moeda(
        icone: 'images/btc.png',
        nome: 'Bitcoin',
        sigla: 'BTC',
        preco: 151598.04),
    Moeda(
        icone: 'images/eth.png',
        nome: 'Ethereum',
        sigla: 'ETH',
        preco: 8987.82),
    Moeda(
        icone: 'images/ethereum2.png',
        nome: 'Ethereum2',
        sigla: 'ETH2',
        preco: 8987.82),
    Moeda(
        icone: 'images/tether.png', nome: 'Tether', sigla: 'USDT', preco: 4.87),
    Moeda(
        icone: 'images/usdCoin.png',
        nome: 'USD Coin',
        sigla: 'USDC',
        preco: 4.88),
    Moeda(icone: 'images/bnb.png', nome: 'BNB', sigla: 'BNB', preco: 1407.66),
    Moeda(icone: 'images/ada.png', nome: 'Cardano', sigla: 'ADA', preco: 3.07),
    Moeda(icone: 'images/xrp.png', nome: 'XRP', sigla: 'ADA', preco: 1.97),
    Moeda(
        icone: 'images/solana.png',
        nome: 'Solana',
        sigla: 'SOL',
        preco: 196.00),
    Moeda(
        icone: 'images/dogecoin.png',
        nome: 'Dogecoin',
        sigla: 'DOGE',
        preco: 0.40),
    Moeda(
        icone: 'images/shiba-inu.png',
        nome: 'SHIBA INU',
        sigla: 'SHIB',
        preco: 0.53),
    Moeda(icone: 'images/monero.png', nome: 'Monero', sigla: 'XMR', preco: 926),
  ];
}
