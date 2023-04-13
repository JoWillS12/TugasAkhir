//
//  MenuPageView.swift
//  Fi2
//
//  Created by Joseph William Santoso on 03/03/23.
//

import SwiftUI

struct MenuPageView: View {
    @EnvironmentObject var login: LoginViewModel
    
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
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
        .environmentObject(login)
        
    }
}

struct MenuPageView_Previews: PreviewProvider {
    static var previews: some View {
        MenuPageView()
            .environmentObject(LoginViewModel())
    }
}
