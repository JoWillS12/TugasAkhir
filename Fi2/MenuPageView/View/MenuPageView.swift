//
//  MenuPageView.swift
//  Fi2
//
//  Created by Joseph William Santoso on 03/03/23.
//

import SwiftUI

struct MenuPageView: View {
    var body: some View {
        TabView {
            MainMenuView()
                .tabItem {
                    Label("Menu", systemImage: "list.clipboard")
                }
            
            FriendPageView()
                .tabItem {
                    Label("Friend", systemImage: "person.2")
                }
        }    }
}

struct MenuPageView_Previews: PreviewProvider {
    static var previews: some View {
        MenuPageView()
//            .environmentObject(FriendPageView())
    }
}
