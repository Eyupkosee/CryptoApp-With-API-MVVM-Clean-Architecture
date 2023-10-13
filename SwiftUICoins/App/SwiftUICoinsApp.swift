//
//  SwiftUICoinsApp.swift
//  SwiftUICoins
//
//  Created by eyüp köse on 2.10.2023.
//

import SwiftUI

@main
struct SwiftUICoinsApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = false
    var body: some Scene {
        WindowGroup {
            OpeningScreen()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
