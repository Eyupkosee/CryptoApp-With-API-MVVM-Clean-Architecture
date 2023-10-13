//
//  AllCoinView.swift
//  SwiftUICoins
//
//  Created by eyüp köse on 3.10.2023.
//

import SwiftUI

struct AllCoinView: View {
    @ObservedObject var viewModel = HomeViewModel()
    
    init(viewModel: HomeViewModel) {
           self.viewModel = viewModel
       }
    
    
    var body: some View {
        VStack(alignment: .leading){
            Text("All Coins")
                .font(.headline)
                .padding()
            
            HStack{
                Text("Coin")
                Spacer()
                Text("Price")
            }
            .foregroundColor(.gray)
            .font(.caption) 
            .padding(.horizontal)
            
            ScrollView{
                VStack{
                    ForEach(viewModel.coins) { coin in
                        NavigationLink(destination: CoinDetailView(coin: coin)) {
                            CoinRowView(coin: coin)
                        }
                    }
                }
            }
        }
        
    }
}

struct AllCoinView_Previews: PreviewProvider {
    static var previews: some View {
        AllCoinView(viewModel: HomeViewModel())
        
    }
}
