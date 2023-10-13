//
//  PortfolioActivity.swift
//  SwiftUICoins
//
//  Created by eyüp köse on 11.10.2023.
//

import Foundation


struct PortfolioActivity : Codable, Identifiable,Equatable{
    var symbol : String
    var adet : Int
    var price : Double
    var image : String
    var id = UUID()
}
