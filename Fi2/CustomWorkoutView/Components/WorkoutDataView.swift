//
//  WorkoutDataView.swift
//  Fi2
//
//  Created by Joseph William Santoso on 29/03/23.
//

import SwiftUI

struct WorkoutDataView: View {
    let workout: CustomWorkout
    let selected: Bool
    let onSelect: () -> Void
    
    var body: some View {
        GeometryReader{ geometry in
            Button(action: onSelect) {
                HStack {
//                    GIFView(type: .name(workout.image))
//                        .scaledToFit()
//                        .frame(width: geometry.size.width * 0.2, height: geometry.size.width * 0.2)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 10)
//                                .stroke(Color.black, lineWidth: 2))
                    AsyncImage(url: URL(string: workout.image)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width * 0.2, height: geometry.size.width * 0.2)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 2))
                        case .failure:
                            Color.gray
                                .clipShape(Circle())
                                .shadow(radius: 2)
                                .frame(width: geometry.size.width * 0.2, height: geometry.size.width * 0.2)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text(workout.name)
                            .font(.headline)
                            .fixedSize(horizontal: false, vertical: true)
                            .foregroundColor(.white)
                        Text(workout.bodypart)
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text(workout.reps)
                            .font(.subheadline)
                            .foregroundColor(.white)
                            
                    }
                    
                    Spacer()
                }
            }
            .padding()
//            .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.2)
            .background(selected ? Color("Select").opacity(0.3) : Color("Item"))
            .cornerRadius(20)
            .shadow(radius: 5)
            
        }
        .environment(\.colorScheme, .dark)
    }
}
