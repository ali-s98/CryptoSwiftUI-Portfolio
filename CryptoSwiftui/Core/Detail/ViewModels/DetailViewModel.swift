//
//  DetailViewModel.swift
//  CryptoSwiftui
//
//  Created by ali sadeghi on 11/08/1402 AP.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject{
    
    private var disposables = Set<AnyCancellable>()

    @Published private(set) var coin: CoinModel
    @Published private(set) var overviewStatistics: [StatisticModel] = []
    @Published private(set) var additionalStatistics: [StatisticModel] = []
    @Published private(set) var coinDescription: String? = nil
    @Published private(set) var websiteURL: String? = nil
    @Published private(set) var redditURL: String? = nil

    private var coinDetailService = CoinDataService()

    init(coin: CoinModel) {
        self.coin = coin
        coinDetailService.getCoinDetail(coin: coin)
        addSubscribers()
    }
    
    private func addSubscribers(){
        coinDetailService.$coinDetail
            .combineLatest($coin)
            .map(mapDataToStatistics)
            .sink(receiveValue: { [weak self] returnedArray in
               
                self?.overviewStatistics = returnedArray.overview
                self?.additionalStatistics = returnedArray.additional
            })
            .store(in: &disposables)
        
        
        coinDetailService.$coinDetail
            .sink { [weak self] returnedDetails in
                self?.coinDescription = returnedDetails?.description?.en?.removingHTMLOccurances
                self?.websiteURL = returnedDetails?.links?.homepage?.first
                self?.redditURL = returnedDetails?.links?.subredditURL
            }
            .store(in: &disposables)
    }
    
    private func mapDataToStatistics(coinDetails: CoinDetailModel?, coinModel: CoinModel)-> (overview: [StatisticModel], additional: [StatisticModel]){
       
        let overviewArray = createOverviewArray(coinModel: coinModel)
        let additionalArray = createAdditionalArray(coinDetails: coinDetails, coinModel: coinModel)

        return (overviewArray, additionalArray)
    }
    
    
    
    private func createOverviewArray(coinModel: CoinModel)-> [StatisticModel]{
        
        let price = coinModel.currentPrice.asCurrencyWith6Decimals()
        let pricePercentChange = coinModel.priceChangePercentage24H
        let priceStat = StatisticModel(title: "Current Price", value: price, percentageChange: pricePercentChange)
        
       
        let marketCap = "$" + (coinModel.marketCap?.formattedWithAbbreviations() ?? "")
        let marketCapChange = coinModel.marketCapChangePercentage24H
        let marketCapStat = StatisticModel(title: "Market Capitalization", value: marketCap, percentageChange: marketCapChange)
        
        let rank = "\(coinModel.rank)"
        let rankStat = StatisticModel(title: "Rank", value: rank)
        
        let volume = "$" + (coinModel.totalVolume?.formattedWithAbbreviations() ?? "")
        let volumeStat = StatisticModel(title: "Volume", value: volume)
        
        
        let overviewArray: [StatisticModel] = [priceStat, marketCapStat, rankStat, volumeStat]
         
        return overviewArray
    }
    
    
    
    private func createAdditionalArray(coinDetails: CoinDetailModel?, coinModel: CoinModel)-> [StatisticModel]{
        
        let high = coinModel.high24H?.asCurrencyWith6Decimals() ?? "n/a"
        let highStat = StatisticModel(title: "24h High", value: high)
        
        let low = coinModel.low24H?.asCurrencyWith6Decimals() ?? "n/a"
        let lowStat = StatisticModel(title: "24h Low", value: low)
        
        let priceChange = coinModel.priceChange24H?.asCurrencyWith6Decimals() ?? "n/a"
        let pricePercentChange2 = coinModel.priceChangePercentage24H
        let priceChangeStat = StatisticModel(title: "24h Price Change", value: priceChange, percentageChange: pricePercentChange2)
        
        let marketCapChange2 = "$" + (coinModel.marketCapChange24H?.formattedWithAbbreviations() ?? "")
        let marketCapPercentChange2 = coinModel.marketCapChangePercentage24H
        let marketCapChangeStat = StatisticModel(title: "24h Market Cap Change", value: marketCapChange2, percentageChange: marketCapPercentChange2)
        
        let blockTime = coinDetails?.blockTimeInMinutes ?? 0
        let blockTimeString = blockTime == 0 ? "n/a": "\(blockTime)"
        let blockStat = StatisticModel(title: "Block Time", value: blockTimeString)
        
        let hashing = coinDetails?.hashingAlgorithm ?? "n/a"
        let hashingStat = StatisticModel(title: "Hashing Algorithm", value: hashing)
        
        let additionalArray: [StatisticModel] = [highStat, lowStat, priceChangeStat, marketCapChangeStat, blockStat, hashingStat]

        return additionalArray
    }
}
