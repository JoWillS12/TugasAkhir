//
//  MenuPageView.swift
//  Fi2
//
//  Created by Joseph William Santoso on 03/03/23.
//

import SwiftUI

struct MenuPageView: View {
    @EnvironmentObject var login: LoginViewModel
    @ObservedObject var menu = WorkoutMenuViewModel()
    var body: some View {
        TabView {
            WorkoutMenuView()
                .tabItem {
                    Label("Menu", systemImage: "list.clipboard")
                }
            
            BMIView()
                .tabItem {
                    Label("BMI", systemImage: "scalemass")
                }
            
            ProfileView(edit: EditProfileViewModel())
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
        
        .accentColor(Color("GreenAssets"))
        .environmentObject(login)
        .environmentObject(menu)
        .environment(\.colorScheme, .dark)
    }
    
}

struct MenuPageView_Previews: PreviewProvider {
    static var previews: some View {
        MenuPageView()
            .environmentObject(LoginViewModel())
    }
}
