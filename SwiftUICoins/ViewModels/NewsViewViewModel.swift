//
//  NewsViewViewModel.swift
//  SwiftUICoins
//
//  Created by eyüp köse on 4.10.2023.
//

import SwiftUI

class NewsViewViewModel : ObservableObject{
    @Published var articles : [Article]?
    
    func fetchingData(){
        
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=df503c5085b5416b81663206984efe32"
        
        guard let url = URL(string: urlString) else{return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error{
                print("DEBUG: Error \(error)")
                return
            }
            
            if let response = response as? HTTPURLResponse{
                print("DEBUG : response code \(response.statusCode)")
            }
            
            guard let data = data else{
                print("veri alınamadı...")
                return}
                print("DEBUG: data ")
            
            do{
                let news = try JSONDecoder().decode(News.self , from: data)
                DispatchQueue.main.async {
                    self.articles = news.articles
                }
            } catch{
                print("DEBUG : Failed to error(news) : \(error)")
            }
            
        }.resume()
    }
    
    
}
