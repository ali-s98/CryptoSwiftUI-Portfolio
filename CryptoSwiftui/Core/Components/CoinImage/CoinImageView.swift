//
//  CoinImageView.swift
//  CryptoSwiftui
//
//  Created by ali sadeghi on 01/08/1402 AP.
//

import SwiftUI

struct CoinImageView: View {
    
    @StateObject var vm: CoinImageViewModel
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }
    var body: some View {
        
       imageView
    }
}

struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageView(coin: dev.coin)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}

extension CoinImageView{
    
    
    private var imageView: some View{
        ZStack{
            if vm.imageData != nil{
                let image = UIImage(data: vm.imageData!)
                Image(uiImage: image!)
                    .resizable()
                    .scaledToFit()
            }else if vm.isLoading{
                ProgressView()
            }else{
                Image(systemName: "questionmark")
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
    }
}
