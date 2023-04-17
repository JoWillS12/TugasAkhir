//
//  ProfileView.swift
//  Fi2
//
//  Created by Joseph William Santoso on 13/03/23.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var profile = ProfileViewModel()
    @ObservedObject var login = LoginViewModel()
    @ObservedObject var edit: EditProfileViewModel // pass the same instance of EditProfileViewModel
    
    init(edit: EditProfileViewModel) {
        self.edit = edit
    }
    
    var body: some View {
        NavigationView {
            GeometryReader{ geometry in
                ZStack{
                    Rectangle()
                        .fill(Color("GreenAssets"))
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
                                        .stroke(Color.black, lineWidth: 2)
                                )
                            Spacer()
                                .frame(width: geometry.size.width * 0.13)
                            VStack(alignment: .leading, spacing: 8) {
                                Text(edit.name)
                                    .foregroundColor(.black)
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                
                                Text("Score : \(profile.updateScore)")
                                    .foregroundColor(.black)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                
                                
                                NavigationLink(destination: EditProfileView(profile: profile)) {
                                    Text("Edit Profile")
                                        .font(.headline)
                                        .foregroundColor(.black)
                                        .padding(.all, 4.0)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 4)
                                                .stroke(Color.black, lineWidth: 2)
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
                        
                        Picker("Menu", selection: $profile.selectedMenu) {
                            ForEach(profile.menu, id: \.self) { menuItem in
                                Text(menuItem)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.horizontal)
                        
                        if profile.selectedMenu == "Add Friend" {
                            VStack {
                                TextField("Friend's Code", text: $profile.friendCode)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding()
                                    .autocapitalization(.none)
                                
                                Button(action: {
                                    profile.addFriend()
                                    profile.friendCode = ""
                                }) {
                                    Text("Add Friend")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                        .padding()
                                        .frame(width: geometry.size.width * 0.5, alignment: .center)
                                        .background(Color("GreenAssets"))
                                        .cornerRadius(15.0)
                                }
                            }
                        } else if profile.selectedMenu == "Friend List" {
                            FriendListView()
                                .padding()
                        }
                        
                        Spacer() // Add some space here
                    }
                    
                    
                }
            }
            .background(Color("Background"))
        }
        .environment(\.colorScheme, .dark)
        
    }
    
}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(edit: EditProfileViewModel())
    }
}
