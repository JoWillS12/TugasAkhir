//
//  EditProfileView.swift
//  Fi2
//
//  Created by Joseph William Santoso on 18/03/23.
//

import SwiftUI
import FirebaseAuth

struct EditProfileView: View {
    @ObservedObject var profile: ProfileViewModel
    @State private var email: String
    @ObservedObject var login = LoginViewModel()
    @ObservedObject var edit = EditProfileViewModel()
    
    
    init(profile: ProfileViewModel) {
        self._profile = ObservedObject(wrappedValue: profile)
        self._email = State(initialValue: Auth.auth().currentUser?.email ?? "")
    }
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                VStack{
                    Text("EDIT PROFILE")
                        .font(.title)
                        .fontWeight(.bold)
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.4)
                        .padding()
                    
                    TextField("NickName", text: $edit.name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    TextField("Age", text: $edit.age)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .keyboardType(.numberPad)
                    
                    TextField("Gender", text: $edit.gender)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    HStack{
                        VStack{
                            TextField("UNIQUE CODE", text: $edit.uCode)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.leading, 20.0)
                        }
                        
                        
                        Button(action: {
                            edit.uCode = edit.generateUniqueCode()
                        }, label: {
                            Text("Generate Unique Code")
                                .foregroundColor(.black)
                        })
                        .frame(width: geometry.size.width * 0.46, height: geometry.size.height * 0.05, alignment: .center)
                        .background(Color("GreenAssets"))
                        .cornerRadius(8)
                        .opacity(edit.codeGenerated ? 0 : 1)
                        .disabled(edit.codeGenerated)
                        .padding(20.0)
                        
                    }
                    
                    
                    Text("Email: \(email)")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding(.top, 16)
                    
                    Button(action: {
                        edit.saveChanges()
                    }, label: {
                        Text("Save Changes")
                            .padding(.horizontal, 40)
                            .padding(.vertical, 10)
                            .background(Color("GreenAssets"))
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    })
                    .frame(width: geometry.size.width * 0.6)
                    
                    Text(edit.saveStatus)
                        .foregroundColor(edit.saveStatus.contains("failed") ? .red : .green)
                }
            }
            
        }
        .environment(\.colorScheme, .dark)
        .background(Color("Background"))
        .onAppear {
            self.email = email
        }
        
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditProfileView(profile: ProfileViewModel())
        }
    }
}

