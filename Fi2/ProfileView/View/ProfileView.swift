//
//  ProfileView.swift
//  Fi2
//
//  Created by Joseph William Santoso on 13/03/23.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var Profile = ProfileViewModel()
    
    var body: some View {
        NavigationView {
            GeometryReader{ geometry in
                ZStack{
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.35)
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.13)
                        .ignoresSafeArea()
                    
                    VStack {
                        HStack{
                            Image("myImage")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width * 0.4, height: geometry.size.width * 0.4)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 2)
                                )
                            Spacer()
                                .frame(width: geometry.size.width * 0.13)
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Joseph")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                
                                Text("Score: 500")
                                    .foregroundColor(.white)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                
                                
                                NavigationLink(destination: EditProfileView()){
                                    Text("Edit Profile")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding(.all, 4.0)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 4)
                                                .stroke(Color.white, lineWidth: 2)
                                        )
                                }
                                
                            }
                            //                        Spacer() // Use a Spacer only where necessary
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity) // Expand the HStack to fill the available space
                        
                        //                    Spacer() // Add some space here
                        Spacer()
                            .frame(height: geometry.size.height * 0.05)
                        
                        Picker("Menu", selection: $Profile.selectedMenu) {
                            ForEach(Profile.menu, id: \.self) { menuItem in
                                Text(menuItem)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.horizontal)
                        
                        if Profile.selectedMenu == "Add Friend" {
                            VStack {
                                TextField("Friend's Name", text: $Profile.friendName)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding()
                                
                                Button(action: {
                                    // Perform the action here
                                    Profile.friendName = ""
                                    Profile.friendScore = ""
                                }) {
                                    Text("Add Friend")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(width: geometry.size.width * 0.5, alignment: .center)
                                        .background(Color.blue)
                                        .cornerRadius(15.0)
                                }
                            }
                        } else if Profile.selectedMenu == "Friend List" {
                            ScrollView{
                                VStack {
                                    ForEach(1...10, id: \.self) { index in
                                        HStack {
                                            Text("Friend \(index)")
                                                .font(.headline)
                                                .foregroundColor(.white)
                                            Spacer()
                                            Text("\(index * 50)")
                                                .font(.headline)
                                                .foregroundColor(.white)
                                        }
                                        .padding()
                                        .frame(width: geometry.size.width * 0.9)
                                        .background(Color.gray)
                                        .cornerRadius(15.0)
                                    }
                                }
                            }
                            
                        }
                        
                        Spacer() // Add some space here
                    }
                    
                    
                }
            }
        }
        
    }
}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
