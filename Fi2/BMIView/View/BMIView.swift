//
//  BMIView.swift
//  Fi2
//
//  Created by Joseph William Santoso on 06/03/23.
//

import SwiftUI

struct BMIView: View {
    @ObservedObject var BMI = BMIViewModel()
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                VStack{
                    
                    Spacer()
                        .frame(height: geometry.size.height * 0.02)
                    
                    Text("BMI Calculator")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                        .frame(height: geometry.size.height * 0.1)
                    
                    Group{
                        
                        
                        
                        TextField("Your Height", value: $BMI.height, formatter: NumberFormatter())
                            .textFieldStyle(.roundedBorder)
                            .padding()
                            .keyboardType(.numberPad)
                        
                        Spacer()
                            .frame(height: geometry.size.height * 0.01)
                        
                        TextField("Your Weight", value: $BMI.weight, formatter: NumberFormatter())
                            .textFieldStyle(.roundedBorder)
                            .padding()
                            .keyboardType(.numberPad)
                        
                        Spacer()
                            .frame(height: geometry.size.height * 0.05)
                        
                        Button(action:{self.BMI.bmi()} , label: {
                            VStack(spacing: 4) {
                                Text("Calculate")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                        })
                        .background((Rectangle()
                            .fill(Color.green)
                            .frame(width: geometry.size.width * (0.9), height: geometry.size.height * 0.06)
                            .cornerRadius(25)))
                        
                        Spacer()
                            .frame(height: geometry.size.height * 0.1)
                        
                        Text("Your BMI is \(BMI.result) and you are \(BMI.category)!")
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                }
            }
        }
    }
}

struct BMIView_Previews: PreviewProvider {
    static var previews: some View {
        BMIView()
    }
}
