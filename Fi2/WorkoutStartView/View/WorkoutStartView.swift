//
//  WorkoutStartView.swift
//  Fi2
//
//  Created by Joseph William Santoso on 19/03/23.
//

import SwiftUI

struct WorkoutStartView: View {
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                Rectangle()
                    .fill(Color.green)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.35)
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.13)
                    .ignoresSafeArea()
                
                VStack{
                    Text("Your Workout")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.top, 70.0)
                    
                    Spacer()
                        .frame(height: geometry.size.height * 0.2)
                    
                    Image("myImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.6, height: geometry.size.width * 0.6)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2)
                        )
                    Text("Push-Up")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .padding(.top, 30.0)
                    
                    Text("00.00")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .padding(.top, 20.0)
                    
                    Spacer()
                    
                    HStack{
                        Button(action:{} , label: {
                            VStack(spacing: 4) {
                                Text("Pause")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                        })
                        .background((Rectangle()
                            .fill(Color.green)
                            .frame(width: geometry.size.width * (0.4), height: geometry.size.height * 0.06)
                            .cornerRadius(25)))
                        Spacer()
                            .frame(width: geometry.size.width * 0.3)
                        Button(action:{} , label: {
                            VStack(spacing: 4) {
                                Text("Forfeit")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                        })
                        .background((Rectangle()
                            .fill(Color.green)
                            .frame(width: geometry.size.width * (0.4), height: geometry.size.height * 0.06)
                            .cornerRadius(25)))
                    }
                }
            }
        }
    }
}

struct WorkoutStartView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutStartView()
    }
}
