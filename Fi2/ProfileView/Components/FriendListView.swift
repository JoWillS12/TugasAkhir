//
//  FriendListView.swift
//  Fi2
//
//  Created by Joseph William Santoso on 17/04/23.
//

import SwiftUI

struct FriendListView: View {
    @ObservedObject var profile = ProfileViewModel()
    
    var body: some View {
        GeometryReader{ geometry in
            ScrollView{
                VStack {
                    ForEach(profile.friends) { friend in
                        HStack {
                            Text(friend.name)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Spacer()
                            
                            Text(String(friend.score))
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .frame(width: geometry.size.width * 1)
                        .background(Color("Item"))
                        .cornerRadius(15.0)
                    }                                }
            }
            
        }
    }
}

