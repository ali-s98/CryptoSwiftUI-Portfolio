//
//  DetailView.swift
//  CryptoSwiftui
//
//  Created by ali sadeghi on 11/08/1402 AP.
//

import SwiftUI

struct DetailLoadingView: View {
    
    @Binding var coin: CoinModel?
    
    var body: some View {
        ZStack{
            if let coin = coin{
                DetailView(coin: coin)
            }
        }
    }
}


struct DetailView: View {
    
    @StateObject private var vm: DetailViewModel
    @State private var showFullDescription: Bool = false

    private let columns = [GridItem(.flexible()),GridItem(.flexible())]
        
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
    }
   
    var body: some View {
        ScrollView {
            VStack {
                ChartView(coin: vm.coin)
                    .padding(.vertical)
                
                VStack(spacing: 20) {
                    
                    overviewTitle
                    Divider()
                    
                    descriptionSection
                    overviewGrid
                    
                    additionalTitle
                    Divider()
                    
                    additionalGrid
                    
                    URLSection
                    
                }
                .padding()
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                navigationBarTrailingItem
            }
        })
        .navigationTitle(vm.coin.name)
        .navigationBarTitleDisplayMode(.large)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(coin: dev.coin)
        }
    }
}

extension DetailView{
    
    
    private var navigationBarTrailingItem: some View{
        HStack{
            Text((vm.coin.symbol.uppercased()))
                .font(.headline)
                .foregroundColor(Color.theme.secondaryText)
            CoinImageView(coin: vm.coin)
                .frame(width: 25, height: 25)
        }
    }
    
    
    private var overviewTitle: some View{
        Text("Overview")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
    private var additionalTitle: some View{
        Text("Additional Details")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
    private var overviewGrid: some View{
        LazyVGrid(columns: columns,
                  alignment: .leading,
                  spacing: 30,
                  pinnedViews: [],
                  content: {
            ForEach(vm.overviewStatistics) { stat in
                StatisticView(stat: stat)
            }
            
        })
    }
    
    private var additionalGrid: some View{
        LazyVGrid(columns: columns,
                  alignment: .leading,
                  spacing: 30,
                  pinnedViews: [],
                  content: {
            ForEach(vm.additionalStatistics) { stat in
                StatisticView(stat: stat)
            }
            
        })
    }
    
    private var descriptionSection: some View{
        ZStack {
            if let coinDescription = vm.coinDescription, !coinDescription.isEmpty{
                VStack(alignment: .leading) {
                    Text(coinDescription)
                        .font(.callout)
                        .foregroundColor(Color.theme.secondaryText)
                        .lineLimit(showFullDescription ? nil : 3)
                    
                    Button {
                        withAnimation(.easeInOut) {
                            showFullDescription.toggle()
                        }
                        
                    } label: {
                        Text(showFullDescription ? "Less": "Read More...")
                            .font(.caption)
                            .foregroundColor(Color.blue)
                            .fontWeight(.bold)
                            .padding(.vertical, 4)
                    }

                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        
    }
    
    private var URLSection: some View{
        VStack(alignment: .leading, spacing: 20) {
            
            if let websiteURL = vm.websiteURL, let url = URL(string: websiteURL){
                Link("Website", destination: url)
            }
            
            if let redditURL = vm.redditURL, let url = URL(string: redditURL){
                Link("Reddit", destination: url)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(.blue)
        .font(.headline)
        
    }
    
    
}
