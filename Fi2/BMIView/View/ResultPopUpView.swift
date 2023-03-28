//
//  ResultPopUpView.swift
//  Fi2
//
//  Created by Joseph William Santoso on 27/03/23.
//

import SwiftUI

struct ResultPopUpView: View {
    var title: String
    var message: String
    var buttonBack: String
    @Binding var show: Bool
    
    @ObservedObject var BMI = BMIViewModel()
    
    var body: some View {
        ZStack {
            if show {
                // PopUp background color
                Color.black.opacity(show ? 0.3 : 0).edgesIgnoringSafeArea(.all)
                // PopUp Window
                VStack(alignment: .center, spacing: 0) {
                    Spacer()
                        .frame(height: 20)
                    Text(title)
                        .frame(maxWidth: .infinity)
                        .frame(height: 45, alignment: .center)
                        .font(Font.system(size: 23, weight: .semibold))
                        .foregroundColor(.black)
                    //                            .background(Color.white)
                    Text(message)
                        .multilineTextAlignment(.center)
                        .font(Font.system(size: 16))
                        .padding(EdgeInsets(top: 10, leading: 25, bottom: 10, trailing: 25))
                        .foregroundColor(.black)
                    Spacer()
                        .frame(height: 20)
                    HStack{
                        Button(action: {
                            withAnimation(.linear(duration: 0.3)) {
                                show = false
                            }
                        }, label: {
                            Text(buttonBack)
                                .frame(maxWidth: .infinity)
                                .frame(height: 54, alignment: .center)
                                .foregroundColor(.black)
                            //                                    .background(Color.white)
                                .font(Font.system(size: 20))
                                .overlay(Rectangle().frame(width: nil, height: 1, alignment: .top).foregroundColor(.secondary), alignment: .top )
                                .padding(.leading, -5.0)
                        })
                        
                    }
                }
                .frame(maxWidth: 300, maxHeight: 200)
//                .border(.background, width: 1)
                .background(.white)
                .cornerRadius(10)
            }
        }
    }
}

struct ResultPopUpView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ResultPopUpView(title: "Your Result", message: "It's", buttonBack: "Back", show: .constant(true))
                .preferredColorScheme(.dark)
                .previewInterfaceOrientation(.portrait)
        }
    }
}

