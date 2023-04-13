//
//  LoginView.swift
//  Fi2
//
//  Created by Joseph William Santoso on 03/03/23.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var login = LoginViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                Picker("", selection: $login.isLogin) {
                    Text("Log In")
                        .tag(true)
                    Text("Create Account")
                        .tag(false)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                TextField("Email", text: $login.email)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 280, height: 45, alignment: .center)

                SecureField("Password", text: $login.password)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 280, height: 45, alignment: .center)

                Spacer()

                Button(action: {
                    if login.isLogin {
                        login.loginUser()
                    } else {
                        login.createUser()
                    }
                }, label: {
                    Text(login.isLogin ? "Log In" : "Create Account")
                        .foregroundColor(.white)
                })
                .frame(width: 280, height: 45, alignment: .center)
                .background(Color.blue)
                .cornerRadius(8)

                NavigationLink(
                    destination: MenuPageView().environmentObject(login),
                    isActive: $login.navigateToMenuPageView, // Bind to the navigateToMenuPageView property in LoginViewModel
                    label: { EmptyView() }
                )
                .hidden()
            }
            .navigationTitle(login.isLogin ? "Welcome Back" : "Welcome")

        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}





