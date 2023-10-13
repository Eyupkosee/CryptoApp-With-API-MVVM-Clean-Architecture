//
//  HomeViewMolde.swift
//  SwiftUICoins
//
//  Created by eyüp köse on 3.10.2023.
//

import SwiftUI

class HomeViewModel : ObservableObject{
    @Published var coins = [Coin]()
    @Published var topMovingCoins = [Coin]()
    @Published var topHighCoin = [Coin]()
    @Published var filteredCoins = [Coin]()
    
    @Published var searchText: String = ""
    
    
    init(){
        fetchCoinData()
    }
    
    
    func fetchCoinData(){
        
       /*
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=7d&locale=en"
        */
        
        let urlString = "https://eyupkosee.github.io/crypto_data/crypto_data.json"
        
        
        guard let url = URL(string: urlString) else{return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error{
                print("DEBUG: Error \(error)")
                return
            }
            
            if let response = response as? HTTPURLResponse{
                print("DEBUG : response code \(response.statusCode)")
            }
            
            guard let data = data else{return}
            print("DEBUG: \(data)")
            
            do{
                let coins = try JSONDecoder().decode([Coin].self , from: data)
                //print("DEBUG : Coins \(coins)")
                DispatchQueue.main.async {
                    self.coins = coins
                    self.configureTopMovingCoins()
                    self.configureTopHighCoins()
                }
            } catch{
                print("DEBUG : Failed to error(Coins) : \(error)")
            }
            
        }.resume()
    }
    
    func configureTopMovingCoins(){
        let topMovers = coins.sorted(by: {$0.priceChangePercentage24H > $1.priceChangePercentage24H})
        self.topMovingCoins = Array(topMovers.prefix(5))
    }
    
    
    func configureTopHighCoins(){
        let topCoin = coins.sorted(by: {$0.marketCap ?? 1 > $1.marketCap ?? 1})
        self.topHighCoin = Array(topCoin.prefix(5))
    }
    
    func filterCoins(searchText: String) {
        // viewModel içindeki tüm coinleri içeren bir diziyi filtrele
        let filteredCoins = coins.filter { coin in
            return coin.name.lowercased().contains(searchText.lowercased()) ||
                   coin.symbol.lowercased().contains(searchText.lowercased())
        }
        self.filteredCoins = Array(filteredCoins)
    }



    
}
