//
//  ImageDataService.swift
//  CryptoSwiftui
//
//  Created by ali sadeghi on 01/08/1402 AP.
//

import Foundation
import Combine


class CoinImageService{
    
    private var disposables = Set<AnyCancellable>()
    
    private var coin: CoinModel
    private var fileManager = LocalFileManager.sheard
    private var folderName = "coin_images"

    init(coin: CoinModel) {
        self.coin = coin
    }
    
    func getCoinImage(urlString: String) async -> Data?{
        
        if let savedImage = fileManager.getImage(imageName: coin.id, folderName: folderName) {
            return savedImage
        }else{
            return await withCheckedContinuation { continuation in
                
                NetworkManager.shared.fetch(endPoint: CoinImageApi.coinImage(path: urlString))
                    .sink(receiveCompletion: NetworkManager.handleCompleition(compleition:), receiveValue: {[weak self] imageData in
                        guard let self = self else{
                            return continuation.resume(returning: nil)
                        }
                        
                        self.fileManager.saveImage(imageData: imageData, imageName: self.coin.id, folderName: self.folderName)
                        return continuation.resume(returning: imageData)
                    })
                    .store(in: &disposables)
            }
        }
    }
}
