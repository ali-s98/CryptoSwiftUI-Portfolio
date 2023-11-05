//
//  LocationNetwork.swift
//  ProTick
//
//  Created by ali sadeghi on 10/30/1400 AP.
//

import Foundation
import Combine


class CoinDataService{
    
    private var disposables = Set<AnyCancellable>()
    @Published var allCoins: [CoinModel] = []
    @Published var marketData: MarketDataModel?
    @Published var coinDetail: CoinDetailModel?

    
    init(){
        getAllCoins()
        getStatistics()
    }
    
    func getAllCoins(){
        NetworkManager.shared.fetchData(endPoint: CoinApi.allCoins(
            vs_currency: "usd",
            order: "market_cap_desc",
            per_page: 250,
            page: 1,
            sparkline: true,
            price_change_percentage: "24h"))
        .map { response-> [CoinModel] in
            return response
        }
        .sink(receiveCompletion: NetworkManager.handleCompleition(compleition:), receiveValue: {[weak self] coins in
            self?.allCoins = coins
        })
        .store(in: &disposables)
    }
    
    
    func getStatistics(){
        NetworkManager.shared.fetchData(endPoint: MarketApi.globalMarket)
        .map { response-> ApiData<MarketDataModel> in
            return response
        }
        .sink(receiveCompletion: NetworkManager.handleCompleition(compleition:), receiveValue: {[weak self] marketData in
            self?.marketData = marketData.data
        })
        .store(in: &disposables)
    }
    
    func getCoinDetail(coin: CoinModel){
        NetworkManager.shared.fetchData(endPoint: CoinApi.detail(id: coin.id,
                                                                 localization: "false",
                                                                 tickers: false,
                                                                 market_data: false,
                                                                 community_data: false,
                                                                 developer_data: false,
                                                                 sparkline: false))
        .map { response-> CoinDetailModel in
            return response
        }
        .sink(receiveCompletion: NetworkManager.handleCompleition(compleition:), receiveValue: {[weak self] coinDetail in
                self?.coinDetail = coinDetail
        })
        .store(in: &disposables)
    }
    
}













