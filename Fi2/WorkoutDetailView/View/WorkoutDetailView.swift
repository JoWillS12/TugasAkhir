////
////  WorkoutDetailView.swift
////  Fi2
////
////  Created by Joseph William Santoso on 19/03/23.
////
//
import SwiftUI

struct WorkoutDetailView: View {
    @StateObject var detail: WorkoutDetailViewModel
    @State var showingWorkoutStart = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .fill(Color.green)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.35)
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.13)
                    .ignoresSafeArea()
                VStack {
                    Text(detail.savedWorkout.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.top)
                    
                    Spacer()
                        .frame(height: geometry.size.height * 0.12)
                    ScrollView {
                        VStack {
                            ForEach(detail.savedWorkout.workouts) { workout in
                                HStack {
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
                                    Spacer()
                                        .frame(width: geometry.size.width * 0.1)
                                    
                                    VStack(alignment: .leading) {
                                        Text(workout.name)
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.white)
                                            .fixedSize(horizontal: false, vertical: true)
                                        Text(workout.bodypart)
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                        Text(workout.reps)
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }
                                }
                                .padding()
                                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.2)
                                .background(.gray)
                                .cornerRadius(20)
                                .shadow(radius: 5)
                            }
                            .padding(.top, 10.0)
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 50)
                    }
                    
                    NavigationLink(destination: WorkoutStartView(viewModel: WorkoutStartViewModel(savedWorkout: detail.savedWorkout)), isActive: $showingWorkoutStart) {
                        VStack(spacing: 4) {
                            Text("Start Workout")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                    }
                    .background((Rectangle()
                        .fill(Color.green)
                        .frame(width: geometry.size.width * (0.9), height: geometry.size.height * 0.06)
                        .cornerRadius(25)))
                    
                }
            }
        }
    }
}

struct WorkoutDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        WorkoutDetailView(detail: WorkoutDetailViewModel(savedWorkout: SavedWorkout(title: "My Saved Workout", workouts: [CustomWorkout(id: "FBB882FB-5F6F-4950-BD44-E006EEA7E333", name: "Workout 1", bodypart: "Arms", image: "https://example.com/image.jpg", reps: "10x3")])))
        
        
    }
}
