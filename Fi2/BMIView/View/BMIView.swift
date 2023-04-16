//
//  BMIView.swift
//  Fi2
//
//  Created by Joseph William Santoso on 06/03/23.
//

import SwiftUI

struct BMIView: View {
    @ObservedObject var BMI = BMIViewModel()
    @State var showPopUp = false
    
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
                        
                        Button(action:{
                            BMI.bmi()
                            withAnimation(.linear(duration: 0.3)) {
                                showPopUp.toggle()
                            }
                            
                        } , label: {
                            VStack(spacing: 4) {
                                Text("Calculate")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                            }
                        })
                        .background((Rectangle()
                            .fill(Color("GreenAssets"))
                            .frame(width: geometry.size.width * (0.9), height: geometry.size.height * 0.06)
                            .cornerRadius(25)))
                        
                        Spacer()
                            .frame(height: geometry.size.height * 0.1)
                        
                        //                        Text("Your BMI is \(BMI.result) and you are \(BMI.category)!")
                        //                            .font(.title3)
                        //                            .fontWeight(.bold)
                    }
                    
                    ScrollView{
                        VStack{
                            Text("YOUR HISTORY")
                                .font(.title)
                                .fontWeight(.bold)
                            Divider()
                                .frame(height: geometry.size.height * 0.01)
                            ForEach(BMI.BMIData, id:\.self){ BData in
                                HStack{
                                    Text("Height: \(BData.height, specifier: "%.0f")")
                                        .font(.body)
                                        .fontWeight(.bold)
                                    Text("Weight: \(BData.weight, specifier: "%.0f")")
                                        .font(.body)
                                        .fontWeight(.bold)
                                    Text("Result: \(BData.result, specifier: "%.0f")")
                                        .font(.body)
                                        .fontWeight(.bold)
                                }
                            }
                        }
                        .onAppear {
                            BMI.fetch()
                        }
                    }
                }
                
            }
            .background(Color("Background"))
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            ResultPopUpView(title: "Your Result", message: "\(BMI.result.rounded()) and you are \(BMI.category)!", buttonBack: "Back", show: $showPopUp)
            
        }
        .environment(\.colorScheme, .dark)
    }
    
}

struct BMIView_Previews: PreviewProvider {
    static var previews: some View {
        BMIView()
    }
}

