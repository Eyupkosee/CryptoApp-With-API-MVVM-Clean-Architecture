//
//  HomeView.swift
//  SwiftUICoins
//
//  Created by eyüp köse on 3.10.2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State private var showSplash = false
    
    var body: some View {
        
       
            NavigationView{
                ScrollView(.vertical, showsIndicators: false){
                    //Top movers coins
                    TopMoversView(viewModel: viewModel)
                    
                    Divider()
                    //All coins
                    AllCoinView(viewModel: viewModel)
                    
                   
                }
                .navigationTitle("Live Prices")
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
