//
//  LoginView.swift
//  Fi2
//
//  Created by Joseph William Santoso on 03/03/23.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View{
    @ObservedObject var Login = LoginViewModel()
    
    var body: some View{
        NavigationView {
            VStack(spacing: 16) {
                Picker("", selection: $Login.isLogin) {
                    Text("Log In")
                        .tag(true)
                    Text("Create Account")
                        .tag(false)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding()
                
                TextField("Email", text: $Login.email)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 280, height: 45, alignment: .center)
                
                SecureField("Password", text: $Login.password)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 280, height: 45, alignment: .center)
                
                Spacer()
                
                Button(action: {
                    // TODO
                }, label: {
                    Text(Login.isLogin ? "Log In" : "Create Account")
                        .foregroundColor(.white)
                }).frame(width: 280, height: 45, alignment: .center)
                    .background(Color.blue)
                    .cornerRadius(8)
            }.navigationTitle(Login.isLogin ? "Welcome Back" : "Welcome")
        }
    }
    
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}




