//
//  TopMoversView.swift
//  SwiftUICoins
//
//  Created by eyüp köse on 3.10.2023.
//

import SwiftUI

struct TopMoversView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Top Movers")
                .font(.headline)
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 16){
                    ForEach(viewModel.topMovingCoins) { coin in
                        NavigationLink(destination: CoinDetailView(coin: coin)) {
                            TopMoversItemView(coin: coin)
                        }
                        
                    }
                }
            }
        }
        .padding()
    }
}

struct TopMoversView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoversView()
    }
}
