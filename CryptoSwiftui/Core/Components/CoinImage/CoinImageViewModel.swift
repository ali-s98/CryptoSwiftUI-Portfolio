//
//  CoinImageViewModel.swift
//  CryptoSwiftui
//
//  Created by ali sadeghi on 01/08/1402 AP.
//

import Foundation


class CoinImageViewModel: ObservableObject{
    
    @Published private(set) var imageData: Data? = nil
    @Published var isLoading: Bool = true
    
    private let coin: CoinModel
        
    init(coin: CoinModel) {
        self.coin = coin
        getImage(urlString: coin.image)
    }
    
    
    private func getImage(urlString: String){
        
        Task{
           
            let _imageData = await CoinImageService(coin: coin).getCoinImage(urlString: urlString)
            DispatchQueue.main.async {[weak self] in
                self?.imageData = _imageData
                self?.isLoading = false
            }
        }

    }
    
}
