//
//  CoinModel.swift
//  SwiftfulCrypto
//
//  Created by Nick Sarno on 5/8/21.
//

import Foundation

// CoinGecko API info
/*
 URL: https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h
 */

//
//let c1 = CoinModel(id: "bitcoin", symbol: "btc", name: "Bitcoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579", currentPrice: Double.random(in: 500...90000), marketCap: 1100013258170, marketCapRank: 1, fullyDilutedValuation: 1235028318246, totalVolume: 69075964521, high24H: 59504, low24H: 57672, priceChange24H: 808.94, priceChangePercentage24H: 1.39234, marketCapChange24H: 13240944103, marketCapChangePercentage24H: 1.21837, circulatingSupply: 18704250, totalSupply: 21000000, maxSupply: 21000000, ath: 64805, athChangePercentage: -9.24909, athDate: "2021-04-14T11:54:46.763Z", atl: 67.81, atlChangePercentage: 86630.1867, atlDate: "2013-07-06T00:00:00.000Z", lastUpdated: "2021-05-09T04:06:09.766Z", sparklineIn7D: DeveloperPreview.instance.coin.sparklineIn7D, priceChangePercentage24HInCurrency: 1.3923423473152687, currentHoldings: 1)
//
//let c2 = CoinModel(id: "ali", symbol: "dd", name: "sssas", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579", currentPrice: Double.random(in: 500...90000), marketCap: 1100013258170, marketCapRank: 1, fullyDilutedValuation: 1235028318246, totalVolume: 69075964521, high24H: 59504, low24H: 57672, priceChange24H: 808.94, priceChangePercentage24H: 1.39234, marketCapChange24H: 13240944103, marketCapChangePercentage24H: 1.21837, circulatingSupply: 18704250, totalSupply: 21000000, maxSupply: 21000000, ath: 64805, athChangePercentage: -9.24909, athDate: "2021-04-14T11:54:46.763Z", atl: 67.81, atlChangePercentage: 86630.1867, atlDate: "2013-07-06T00:00:00.000Z", lastUpdated: "2021-05-09T04:06:09.766Z", sparklineIn7D: DeveloperPreview.instance.coin.sparklineIn7D, priceChangePercentage24HInCurrency: 1.3923423473152687, currentHoldings: 1)
//let c3 = CoinModel(id: "salam", symbol: "ss", name: "salamCoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579", currentPrice: Double.random(in: 500...90000), marketCap: 1100013258170, marketCapRank: 1, fullyDilutedValuation: 1235028318246, totalVolume: 69075964521, high24H: 59504, low24H: 57672, priceChange24H: 808.94, priceChangePercentage24H: 1.39234, marketCapChange24H: 13240944103, marketCapChangePercentage24H: 1.21837, circulatingSupply: 18704250, totalSupply: 21000000, maxSupply: 21000000, ath: 64805, athChangePercentage: -9.24909, athDate: "2021-04-14T11:54:46.763Z", atl: 67.81, atlChangePercentage: 86630.1867, atlDate: "2013-07-06T00:00:00.000Z", lastUpdated: "2021-05-09T04:06:09.766Z", sparklineIn7D: DeveloperPreview.instance.coin.sparklineIn7D, priceChangePercentage24HInCurrency: 1.3923423473152687, currentHoldings: 1)
//let c4 = CoinModel(id: "kka", symbol: "ddd", name: "drcoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579", currentPrice: Double.random(in: 500...90000), marketCap: 1100013258170, marketCapRank: 1, fullyDilutedValuation: 1235028318246, totalVolume: 69075964521, high24H: 59504, low24H: 57672, priceChange24H: 808.94, priceChangePercentage24H: 1.39234, marketCapChange24H: 13240944103, marketCapChangePercentage24H: 1.21837, circulatingSupply: 18704250, totalSupply: 21000000, maxSupply: 21000000, ath: 64805, athChangePercentage: -9.24909, athDate: "2021-04-14T11:54:46.763Z", atl: 67.81, atlChangePercentage: 86630.1867, atlDate: "2013-07-06T00:00:00.000Z", lastUpdated: "2021-05-09T04:06:09.766Z", sparklineIn7D: DeveloperPreview.instance.coin.sparklineIn7D, priceChangePercentage24HInCurrency: 1.3923423473152687, currentHoldings: 1)
//let c5 = CoinModel(id: "amir", symbol: "bamtc", name: "amircoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579", currentPrice: Double.random(in: 500...90000), marketCap: 1100013258170, marketCapRank: 1, fullyDilutedValuation: 1235028318246, totalVolume: 69075964521, high24H: 59504, low24H: 57672, priceChange24H: 808.94, priceChangePercentage24H: 1.39234, marketCapChange24H: 13240944103, marketCapChangePercentage24H: 1.21837, circulatingSupply: 18704250, totalSupply: 21000000, maxSupply: 21000000, ath: 64805, athChangePercentage: -9.24909, athDate: "2021-04-14T11:54:46.763Z", atl: 67.81, atlChangePercentage: 86630.1867, atlDate: "2013-07-06T00:00:00.000Z", lastUpdated: "2021-05-09T04:06:09.766Z", sparklineIn7D: DeveloperPreview.instance.coin.sparklineIn7D, priceChangePercentage24HInCurrency: 1.3923423473152687, currentHoldings: 1)
//let c6 = CoinModel(id: "kitcoin", symbol: "beewtc", name: "kitcoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579", currentPrice: Double.random(in: 500...90000), marketCap: 1100013258170, marketCapRank: 1, fullyDilutedValuation: 1235028318246, totalVolume: 69075964521, high24H: 59504, low24H: 57672, priceChange24H: 808.94, priceChangePercentage24H: 1.39234, marketCapChange24H: 13240944103, marketCapChangePercentage24H: 1.21837, circulatingSupply: 18704250, totalSupply: 21000000, maxSupply: 21000000, ath: 64805, athChangePercentage: -9.24909, athDate: "2021-04-14T11:54:46.763Z", atl: 67.81, atlChangePercentage: 86630.1867, atlDate: "2013-07-06T00:00:00.000Z", lastUpdated: "2021-05-09T04:06:09.766Z", sparklineIn7D: DeveloperPreview.instance.coin.sparklineIn7D, priceChangePercentage24HInCurrency: 1.3923423473152687, currentHoldings: 1)
//let c7 = CoinModel(id: "naficoin", symbol: "naf", name: "nafisehcoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579", currentPrice: Double.random(in: 500...90000), marketCap: 1100013258170, marketCapRank: 1, fullyDilutedValuation: 1235028318246, totalVolume: 69075964521, high24H: 59504, low24H: 57672, priceChange24H: 808.94, priceChangePercentage24H: 1.39234, marketCapChange24H: 13240944103, marketCapChangePercentage24H: 1.21837, circulatingSupply: 18704250, totalSupply: 21000000, maxSupply: 21000000, ath: 64805, athChangePercentage: -9.24909, athDate: "2021-04-14T11:54:46.763Z", atl: 67.81, atlChangePercentage: 86630.1867, atlDate: "2013-07-06T00:00:00.000Z", lastUpdated: "2021-05-09T04:06:09.766Z", sparklineIn7D: DeveloperPreview.instance.coin.sparklineIn7D, priceChangePercentage24HInCurrency: 1.3923423473152687, currentHoldings: 1)
//let c8 = CoinModel(id: "mohammcoin", symbol: "mm", name: "Bitcmdsdoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579", currentPrice: Double.random(in: 500...90000), marketCap: 1100013258170, marketCapRank: 1, fullyDilutedValuation: 1235028318246, totalVolume: 69075964521, high24H: 59504, low24H: 57672, priceChange24H: 808.94, priceChangePercentage24H: 1.39234, marketCapChange24H: 13240944103, marketCapChangePercentage24H: 1.21837, circulatingSupply: 18704250, totalSupply: 21000000, maxSupply: 21000000, ath: 64805, athChangePercentage: -9.24909, athDate: "2021-04-14T11:54:46.763Z", atl: 67.81, atlChangePercentage: 86630.1867, atlDate: "2013-07-06T00:00:00.000Z", lastUpdated: "2021-05-09T04:06:09.766Z", sparklineIn7D: DeveloperPreview.instance.coin.sparklineIn7D, priceChangePercentage24HInCurrency: 1.3923423473152687, currentHoldings: 1)
//let c9 = CoinModel(id: "bitcoqwqwin", symbol: "btwwc", name: "Bieewewrtcoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579", currentPrice: Double.random(in: 500...90000), marketCap: 1100013258170, marketCapRank: 1, fullyDilutedValuation: 1235028318246, totalVolume: 69075964521, high24H: 59504, low24H: 57672, priceChange24H: 808.94, priceChangePercentage24H: 1.39234, marketCapChange24H: 13240944103, marketCapChangePercentage24H: 1.21837, circulatingSupply: 18704250, totalSupply: 21000000, maxSupply: 21000000, ath: 64805, athChangePercentage: -9.24909, athDate: "2021-04-14T11:54:46.763Z", atl: 67.81, atlChangePercentage: 86630.1867, atlDate: "2013-07-06T00:00:00.000Z", lastUpdated: "2021-05-09T04:06:09.766Z", sparklineIn7D: DeveloperPreview.instance.coin.sparklineIn7D, priceChangePercentage24HInCurrency: 1.3923423473152687, currentHoldings: 1)
//
//let c10 = CoinModel(id: "bffff", symbol: "btffwwc", name: "bffffcoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579", currentPrice: Double.random(in: 500...90000), marketCap: 1100013258170, marketCapRank: 1, fullyDilutedValuation: 1235028318246, totalVolume: 69075964521, high24H: 59504, low24H: 57672, priceChange24H: 808.94, priceChangePercentage24H: 1.39234, marketCapChange24H: 13240944103, marketCapChangePercentage24H: 1.21837, circulatingSupply: 18704250, totalSupply: 21000000, maxSupply: 21000000, ath: 64805, athChangePercentage: -9.24909, athDate: "2021-04-14T11:54:46.763Z", atl: 67.81, atlChangePercentage: 86630.1867, atlDate: "2013-07-06T00:00:00.000Z", lastUpdated: "2021-05-09T04:06:09.766Z", sparklineIn7D: DeveloperPreview.instance.coin.sparklineIn7D, priceChangePercentage24HInCurrency: 1.3923423473152687, currentHoldings: 1)
//
//let c11 = CoinModel(id: "boooss", symbol: "btwwc", name: "booosscoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579", currentPrice: Double.random(in: 500...90000), marketCap: 1100013258170, marketCapRank: 1, fullyDilutedValuation: 1235028318246, totalVolume: 69075964521, high24H: 59504, low24H: 57672, priceChange24H: 808.94, priceChangePercentage24H: 1.39234, marketCapChange24H: 13240944103, marketCapChangePercentage24H: 1.21837, circulatingSupply: 18704250, totalSupply: 21000000, maxSupply: 21000000, ath: 64805, athChangePercentage: -9.24909, athDate: "2021-04-14T11:54:46.763Z", atl: 67.81, atlChangePercentage: 86630.1867, atlDate: "2013-07-06T00:00:00.000Z", lastUpdated: "2021-05-09T04:06:09.766Z", sparklineIn7D: DeveloperPreview.instance.coin.sparklineIn7D, priceChangePercentage24HInCurrency: 1.3923423473152687, currentHoldings: 1)
//
//let c12 = CoinModel(id: "bitttt", symbol: "btwwc", name: "bitttt", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579", currentPrice: Double.random(in: 500...90000), marketCap: 1100013258170, marketCapRank: 1, fullyDilutedValuation: 1235028318246, totalVolume: 69075964521, high24H: 59504, low24H: 57672, priceChange24H: 808.94, priceChangePercentage24H: 1.39234, marketCapChange24H: 13240944103, marketCapChangePercentage24H: 1.21837, circulatingSupply: 18704250, totalSupply: 21000000, maxSupply: 21000000, ath: 64805, athChangePercentage: -9.24909, athDate: "2021-04-14T11:54:46.763Z", atl: 67.81, atlChangePercentage: 86630.1867, atlDate: "2013-07-06T00:00:00.000Z", lastUpdated: "2021-05-09T04:06:09.766Z", sparklineIn7D: DeveloperPreview.instance.coin.sparklineIn7D, priceChangePercentage24HInCurrency: 1.3923423473152687, currentHoldings: 1)
//
//let c13 = CoinModel(id: "bbbb", symbol: "bbbbtwwc", name: "bbbbb", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579", currentPrice: Double.random(in: 500...90000), marketCap: 1100013258170, marketCapRank: 1, fullyDilutedValuation: 1235028318246, totalVolume: 69075964521, high24H: 59504, low24H: 57672, priceChange24H: 808.94, priceChangePercentage24H: 1.39234, marketCapChange24H: 13240944103, marketCapChangePercentage24H: 1.21837, circulatingSupply: 18704250, totalSupply: 21000000, maxSupply: 21000000, ath: 64805, athChangePercentage: -9.24909, athDate: "2021-04-14T11:54:46.763Z", atl: 67.81, atlChangePercentage: 86630.1867, atlDate: "2013-07-06T00:00:00.000Z", lastUpdated: "2021-05-09T04:06:09.766Z", sparklineIn7D: SparklineIn7D(price: [
//    57812.96915967891,
//    57504.33531773738,
//  ]), priceChangePercentage24HInCurrency: 1.3923423473152687, currentHoldings: 1)
//
//var coinsaaaa = [c1,c2,c3,c4, c5, c6, c7, c8, c9, c10, c11, c12,c13]
//
//let st1 = StatisticModel(title: "nisn", value: "992", percentageChange: 0.0)
//let st2 = StatisticModel(title: "sadd", value: "213", percentageChange: -10.1)
//let st3 = StatisticModel(title: "wwqw", value: "41", percentageChange: 40.1)
//let st4 = StatisticModel(title: "eewe", value: "331", percentageChange: 30.1)
//let statisss = [st1,st2,st3,st4]
// JSON Response:
// {
//     "id": "bitcoin",
//     "symbol": "btc",
//     "name": "Bitcoin",
//     "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
//     "current_price": 58908,
//     "market_cap": 1100013258170,
//     "market_cap_rank": 1,
//     "fully_diluted_valuation": 1235028318246,
//     "total_volume": 69075964521,
//     "high_24h": 59504,
//     "low_24h": 57672,
//     "price_change_24h": 808.94,
//     "price_change_percentage_24h": 1.39234,
//     "market_cap_change_24h": 13240944103,
//     "market_cap_change_percentage_24h": 1.21837,
//     "circulating_supply": 18704250,
//     "total_supply": 21000000,
//     "max_supply": 21000000,
//     "ath": 64805,
//     "ath_change_percentage": -9.24909,
//     "ath_date": "2021-04-14T11:54:46.763Z",
//     "atl": 67.81,
//     "atl_change_percentage": 86630.1867,
//     "atl_date": "2013-07-06T00:00:00.000Z",
//     "roi": null,
//     "last_updated": "2021-05-09T04:06:09.766Z",
//     "sparkline_in_7d": {
//       "price": [
//         57812.96915967891,
//         57504.33531773738,
//       ]
//     },
//     "price_change_percentage_24h_in_currency": 1.3923423473152687
//   }
//
// */
//

import Foundation


struct CoinModel: Identifiable , Codable{
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H: Double?
    let priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    let currentHoldings: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case currentHoldings
    }
    
    init(id: String, symbol: String, name: String, image: String, currentPrice: Double, marketCap: Double?, marketCapRank: Double?, fullyDilutedValuation: Double?, totalVolume: Double?, high24H: Double?, low24H: Double?, priceChange24H: Double?, priceChangePercentage24H: Double?, marketCapChange24H: Double?, marketCapChangePercentage24H: Double?, circulatingSupply: Double?, totalSupply: Double?, maxSupply: Double?, ath: Double?, athChangePercentage: Double?, athDate: String?, atl: Double?, atlChangePercentage: Double?, atlDate: String?, lastUpdated: String?, sparklineIn7D: SparklineIn7D?, priceChangePercentage24HInCurrency: Double?, currentHoldings: Double?) {
        self.id = id
        self.symbol = symbol
        self.name = name
        self.image = image
        self.currentPrice = currentPrice
        self.marketCap = marketCap
        self.marketCapRank = marketCapRank
        self.fullyDilutedValuation = fullyDilutedValuation
        self.totalVolume = totalVolume
        self.high24H = high24H
        self.low24H = low24H
        self.priceChange24H = priceChange24H
        self.priceChangePercentage24H = priceChangePercentage24H
        self.marketCapChange24H = marketCapChange24H
        self.marketCapChangePercentage24H = marketCapChangePercentage24H
        self.circulatingSupply = circulatingSupply
        self.totalSupply = totalSupply
        self.maxSupply = maxSupply
        self.ath = ath
        self.athChangePercentage = athChangePercentage
        self.athDate = athDate
        self.atl = atl
        self.atlChangePercentage = atlChangePercentage
        self.atlDate = atlDate
        self.lastUpdated = lastUpdated
        self.sparklineIn7D = sparklineIn7D
        self.priceChangePercentage24HInCurrency = priceChangePercentage24HInCurrency
        self.currentHoldings = currentHoldings
    }
    func updateHoldings(amount: Double) -> CoinModel {
        return CoinModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency, currentHoldings: amount)
    }
    
    var currentHoldingsValue: Double {
        return (currentHoldings ?? 0) * currentPrice
    }
    
    var rank: Int {
        return Int(marketCapRank ?? 0)
    }
    
}

struct SparklineIn7D: Codable {
    let price: [Double]?
}
