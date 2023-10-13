//
//  ProfileView.swift
//  SwiftUICoins
//
//  Created by eyüp köse on 4.10.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    var body: some View {
        
        VStack{
            
            //User info
            HStack{
                //Kullanıcı image
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.green)
                
                //Kullanıcı ismi
                VStack(alignment: .leading, spacing: 4){
                    Text("Merhaba, Eyup")
                        .fontWeight(.semibold)
                        .font(.title2)
                        .padding(.leading,20)
                    
                    Text("eyupkose.work@gmail.com")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                        .padding(.leading,22)
                }
                
                Spacer()
            }
            
            //Settings
            VStack{
                //Night mod
                HStack{
                    Text("Night Mod")
                    
                    Spacer()
                    
                    Toggle("Dark Mode", isOn: $isDarkMode)
                }
                .padding(.vertical,5)
                
                Divider()
                    .frame(height: 0.3)
                    .background(.gray)
                //Language Part
                HStack{
                    Text("Language")
                    Spacer()
                    Text("English")
                    Image(systemName: "chevron.right")
                }
                .padding(.vertical,7)
                
                Divider()
                    .frame(height: 0.3)
                    .background(.gray)
                
                //
                HStack{
                    Text("Default Currencies")
                    Spacer()
                    Text("USD & BTC")
                    Image(systemName: "chevron.right")
                }
                .padding(.vertical,7)
            }
            .frame(width: UIScreen.main.bounds.width * 0.8)
            .padding()
            .background(isDarkMode ? Color(red: 0.333, green: 0.337, blue: 0.337) : Color(red: 0.949, green: 0.949, blue: 0.949) )
            .cornerRadius(15)
            .padding(.top,30)
            .padding(.bottom,30)
            .shadow(radius: 8)
            
            VStack{
                //Settings
                HStack{
                    Text("Settings")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding(.vertical,7)
                
                Divider()
                    .frame(height: 0.3)
                    .background(.gray)
                
                //Help Center
                HStack{
                    Text("Help Center")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding(.vertical,7)
                
            }
            .frame(width: UIScreen.main.bounds.width * 0.8)
            .padding()
            .background(isDarkMode ? Color(red: 0.333, green: 0.337, blue: 0.337) : Color(red: 0.949, green: 0.949, blue: 0.949) )
            .cornerRadius(15)
            .shadow(radius: 8)
            
            VStack{
                //Settings
                HStack{
                    Text("Log Out")
                    Spacer()
                    Image(systemName: "rectangle.portrait.and.arrow.forward")
                }
                .padding(.vertical,7)
                
                
                
            }
            .frame(width: UIScreen.main.bounds.width * 0.8)
            .padding()
            .background(isDarkMode ? Color(red: 0.333, green: 0.337, blue: 0.337) : Color(red: 0.949, green: 0.949, blue: 0.949) )
            .cornerRadius(15)
            .shadow(radius: 8)
            .padding(.top,30)
            
            
            Spacer()
        }
        
        .padding()
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
