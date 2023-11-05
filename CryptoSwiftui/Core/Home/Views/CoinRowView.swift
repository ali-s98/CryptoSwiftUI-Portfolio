//
//  CoinRowView.swift
//  CryptoSwiftui
//
//  Created by ali sadeghi on 30/07/1402 AP.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinModel
    let showHoldingsColumn: Bool
    
    var body: some View {
        HStack(spacing: 0) {
           
            leftColumn
            Spacer()
            if showHoldingsColumn{
    
                centerColumn
            }
        
            rightColumn
            
        }
        .font(.subheadline)
        .background(Color.theme.background.opacity(0.0001))
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinRowView(coin: dev.coin, showHoldingsColumn: true)
                .previewLayout(.sizeThatFits)
            
            CoinRowView(coin: dev.coin, showHoldingsColumn: true)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
        
    }
}


extension CoinRowView{
    
    private var leftColumn: some View{
        HStack(spacing: 0){
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 30.0)
            CoinImageView(coin: coin)
                .frame(width: 30, height: 30)
            
            Text(coin.symbol.uppercased())
                .font(.headline)
                .foregroundColor(Color.theme.accent)
                .padding(.leading, 6)
        }
    }
    
    private var centerColumn: some View{
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundColor(Color.theme.accent)
        
    }
    
    private var rightColumn: some View{
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWith2Decimals())
                .bold()
                .foregroundColor(Color.theme.accent)
            
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                .foregroundColor(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ?
                    Color.theme.green:
                    Color.theme.red
                )
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
    
}
