//
//  TopMarkCapCoin.swift
//  SwiftUICoins
//
//  Created by eyüp köse on 10.10.2023.
//

import SwiftUI

struct TopMarkCapCoin: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Most Popular")
                .font(.headline)
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 16){
                    ForEach(viewModel.topHighCoin) { coin in
                        NavigationLink(destination: CoinDetailView(coin: coin)) {
                            TopMarkCapCoinItemView(coin: coin)
                        }
                        
                    }
                }
            }
        }
        .padding()
    }
}

struct TopMarkCapCoin_Previews: PreviewProvider {
    static var previews: some View {
        TopMarkCapCoin()
    }
}
