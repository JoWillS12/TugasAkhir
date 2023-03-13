//
//  MainMenuView.swift
//  Fi2
//
//  Created by Joseph William Santoso on 03/03/23.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                VStack{
                    Group{
                        Text("Get Fit")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .padding(.top, 70.0)
                            .frame(width: geometry.size.width * (1), height: geometry.size.height * 0.3)
                            .background(Rectangle().fill(Color.green)
                            )
                            .ignoresSafeArea()
                    }
                    Group{
                        Button(action:{} , label: {
                            VStack(spacing: 4) {
                                Text("BMI CALCULATOR")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Text("Test your body mass index.")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                
                            }
                        })
                        .background((Rectangle()
                            .fill(Color.gray)
                            .frame(width: geometry.size.width * (0.9), height: geometry.size.height * 0.17)
                            .cornerRadius(25)))
                        
                        Spacer()
                            .frame(height: 100)
                        
                        Button(action:{} , label: {
                            VStack(spacing: 4) {
                                Text("WORKOUT")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Text("Your workout start here.")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                
                            }
                        })
                        .background((Rectangle()
                            .fill(Color.gray)
                            .frame(width: geometry.size.width * (0.9), height: geometry.size.height * 0.17)
                            .cornerRadius(25)))
                        
                        Spacer()
                            .frame(height: 100)
                        
                        Button(action:{} , label: {
                            VStack(spacing: 4) {
                                Text("CUSTOM WORKOUT")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Text("Custom your workout here.")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                
                            }
                        })
                        .background((Rectangle()
                            .fill(Color.gray)
                            .frame(width: geometry.size.width * (0.9), height: geometry.size.height * 0.17)
                            .cornerRadius(25)))
                    }
                }
            }
        }
        
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
