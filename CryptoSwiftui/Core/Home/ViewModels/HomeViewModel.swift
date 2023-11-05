//
//  HomeViewModel.swift
//  CryptoSwiftui
//
//  Created by ali sadeghi on 30/07/1402 AP.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject{
    
    private var disposables = Set<AnyCancellable>()

    @Published private(set) var allCoins: [CoinModel] = []
    @Published private(set) var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    @Published var statistics: [StatisticModel] = []
    @Published var sortOption: SortOption = .holdings

    @Published var isLoading: Bool = false

    private var dataService = CoinDataService()
    private var portfolioService = PortfolioDataService()

    enum SortOption{
        case rank, rankReversed, holdings, holdingsReversed, price, priceReversed
    }

    init() {
        addSubscribers()
    }
    
    private func addSubscribers(){
        
        // update allCoins
        $searchText
            .combineLatest(dataService.$allCoins, $sortOption)
            .debounce(for: .milliseconds(250), scheduler: RunLoop.main)
            .map(filterAndSortCoins)
            .sink {[weak self] coins in
                self?.allCoins = coins
            }
            .store(in: &disposables)
        
        
        $allCoins
            .combineLatest(portfolioService.$savedEntity)
            .map(mapPortfolioCoins)
            .sink { [weak self] returnCoins in
                self?.portfolioCoins = self?.sortPortfolioCoinsIfNeeded(coins: returnCoins) ?? []
            }
            .store(in: &disposables)
        
        // update marketData
        dataService.$marketData
            .combineLatest($portfolioCoins)
            .map(mapGlobalMarketData)
            .sink {[weak self] stats in
                self?.statistics = stats
                self?.isLoading = false
            }
            .store(in: &disposables)
     
    }
    
    
    func updatePortfolio(coin: CoinModel, amount: Double){
        portfolioService.updatePortfolio(coin: coin, amount: amount)
    }
    
    func reloadData(){
        isLoading = true
        dataService.getAllCoins()
        dataService.getStatistics()
    }
    
    private func filterAndSortCoins(text: String, coins: [CoinModel], sort: SortOption)-> [CoinModel]{
        var updateCoins = filterCoins(text: text, coins: coins)
        sortCoins(sort: sort, coins: &updateCoins)
        return updateCoins
    }
    
    private func filterCoins(text: String, coins: [CoinModel])-> [CoinModel]{
        guard !text.isEmpty else{
            return coins
        }
        let lowercasedText = text.lowercased()
        
        return coins.filter { coin -> Bool in
            return coin.name.lowercased().contains(lowercasedText) ||
                   coin.id.lowercased().contains(lowercasedText) ||
                   coin.symbol.lowercased().contains(lowercasedText)
        }
    }
    
    private func sortCoins(sort: SortOption, coins: inout [CoinModel]){
        switch sort {
        case .rank, .holdings:
            coins.sort(by: {$0.rank < $1.rank })
        case .rankReversed, .holdingsReversed:
            coins.sort(by: {$0.rank > $1.rank })
        case .price:
            coins.sort(by: {$0.currentPrice > $1.currentPrice })
        case .priceReversed:
            coins.sort(by: {$0.currentPrice < $1.currentPrice })

        }
    }
    
    private func sortPortfolioCoinsIfNeeded(coins: [CoinModel])-> [CoinModel]{
        switch sortOption{
        case .holdings:
            return coins.sorted(by: {$0.currentHoldingsValue > $1.currentHoldingsValue})
        case .holdingsReversed:
            return coins.sorted(by: {$0.currentHoldingsValue <  $1.currentHoldingsValue})

        default:
            return coins
        }
    }
    
    
    private func  mapGlobalMarketData(marketDataModel: MarketDataModel?, portfolioCoins: [CoinModel])-> [StatisticModel]{
        var stats: [StatisticModel] = []
        
        guard let data = marketDataModel else{
            return []
        }
        
        let marketCap = StatisticModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
        let volume = StatisticModel(title: "24h Volume", value: data.volume)
        let btcDomainace = StatisticModel(title: "BTC Domainace", value: data.btcDominance)
        
        let portfolioValue = portfolioCoins
            .map({$0.currentHoldingsValue})
            .reduce(0, +)
        
        let previousValue = portfolioCoins
            .map({ coin -> Double in
                let currentValue = coin.currentHoldingsValue
                let percentChange = coin.priceChangePercentage24H ?? 0 / 100
                let previousValue = currentValue / (1 + percentChange)
                return previousValue
            })
            .reduce(0, +)
        
        let percentageChange = ((portfolioValue - previousValue) / portfolioValue)
        
        let portfolio = StatisticModel(title: "Portfolio Value", value: portfolioValue.asCurrencyWith2Decimals(), percentageChange: percentageChange)
        
        stats.append(contentsOf: [marketCap, volume, btcDomainace, portfolio])
        return stats
    }
    
    
    
    
    private func mapPortfolioCoins(coinModels: [CoinModel], portfolioEntites: [PortfolioEntity])-> [CoinModel]{
        coinModels.compactMap { coin -> CoinModel? in
            guard let entity = portfolioEntites.first(where: { $0.coinID == coin.id}) else{
                return nil
            }
            return coin.updateHoldings(amount: entity.amount)
        }
    }
    
}


