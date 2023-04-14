//
//  WorkoutStartView.swift
//  Fi2
//
//  Created by Joseph William Santoso on 19/03/23.
//

import SwiftUI

struct WorkoutStartView: View {
    @StateObject var viewModel: WorkoutStartViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .fill(Color.green)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.35)
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.13)
                    .ignoresSafeArea()
                
                VStack {
                    Text(viewModel.savedWorkout.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.top)
                    
                    Spacer()
                        .frame(height: geometry.size.height * 0.1)
                    
                    AsyncImage(url: URL(string: viewModel.workouts[viewModel.currentIndex].image)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image.resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width * 0.6, height: geometry.size.width * 0.6)
                                .cornerRadius(15)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                        case .failure:
                            Color.gray
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .frame(width: geometry.size.width * 0.6, height: geometry.size.width * 0.6)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    
                    Text(viewModel.workouts[viewModel.currentIndex].name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.top, 10.0)
                    
                    Text(viewModel.workouts[viewModel.currentIndex].reps)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.top)
                    
                    Text("\(viewModel.remainingTime)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.top, 10.0)
                    
                    HStack(spacing: 20) {
                        Button(action: {
                            // Pause or resume the timer
                            viewModel.togglePause()
                        }, label: {
                            VStack(spacing: 4) {
                                Image(systemName: viewModel.isPaused ? "play.circle.fill" : "pause.circle.fill")
                                    .font(.title2)
                                    .foregroundColor(.white)
                            }
                        })
                        .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.06)
                        .background(Rectangle().fill(Color.green).cornerRadius(25))
                        
                        
                        
                        ZStack{
                            
                            Button(action: {
                                // Go back to the detail view
                                viewModel.showWorkoutDetail = true
                            }, label: {
                                VStack(spacing: 4) {
                                    Image(systemName: "arrow.left.circle.fill")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                }
                            })
                            .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.06)
                            .background(Rectangle().fill(Color.green).cornerRadius(25))
                            NavigationLink(
                                destination: WorkoutDetailView(detail: WorkoutDetailViewModel(savedWorkout: viewModel.savedWorkout)) .navigationBarBackButtonHidden(true),
                                isActive: $viewModel.showWorkoutDetail,
                                label: {
                                    EmptyView()
                                })
                            .hidden()
                            
                        }
                        
                        
                    }
                    .padding(.top, 30.0)
                }
            }
        }
    }
}

struct WorkoutStartView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutStartView(viewModel: WorkoutStartViewModel(savedWorkout: SavedWorkout(title: "My Workout", workouts: [CustomWorkout(id: "FBB882FB-5F6F-4950-BD44-E006EEA7E333", name: "Workout 1", bodypart: "Arms", image: "https://example.com/image.jpg", reps: "10x3")])))
    }
}
