////
////  WorkoutTestView.swift
////  Fi2
////
////  Created by Joseph William Santoso on 29/03/23.
////
//
//import SwiftUI
//
//struct WorkoutTestView: View {
//    @StateObject private var viewModel = WorkoutTestModel()
//    @Environment(\.presentationMode) var presentationMode
//    
//    var body: some View {
//        GeometryReader { geometry in
//            ZStack {
//                VStack {
//                    //                    Text("Choose Your Workout")
//                    //                        .font(.title)
//                    //                        .fontWeight(.bold)
//                    //                        .padding(.top, 30)
//                    
//                    ScrollView {
//                        VStack {
//                            ForEach(viewModel.worktest) { workout in
//                                HStack {
//                                    AsyncImage(url: URL(string: workout.image)) { phase in
//                                        switch phase {
//                                        case .empty:
//                                            ProgressView()
//                                        case .success(let image):
//                                            image.resizable()
//                                                .frame(width: geometry.size.width * 0.2, height: geometry.size.width * 0.2)
//                                        case .failure:
//                                            Color.gray
//                                                .clipShape(Circle())
//                                                .shadow(radius: 2)
//                                                .frame(width: 90, height: 90, alignment: .center)
//                                        @unknown default:
//                                            EmptyView()
//                                        }
//                                        
//                                        Spacer()
//                                            .frame(width: geometry.size.width * 0.1)
//                                        
//                                        VStack(alignment: .leading) {
//                                            Text(workout.name)
//                                                .font(.headline)
//                                            Text(workout.reps)
//                                                .font(.subheadline)
//                                                .foregroundColor(.gray)
//                                        }
//                                    }
//                                    
//                                    
//                                    .padding()
//                                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.2)
//                                    //                                            .background(viewModel.selectedWorkouts.contains(workout) ? Color.blue.opacity(0.3) : Color.white)
//                                    .cornerRadius(20)
//                                    .shadow(radius: 5)
//                                    
//                                }
//                                .padding(.top, 20.0)
//                            }
//                            .padding(.horizontal, 20)
//                            .padding(.bottom, 50)
//                            
//                        }
//                        
//                        //                            if !viewModel.selectedWorkouts.isEmpty {
//                        //                                WorkoutEditorView(selectedWorkouts: Array(custom.selectedWorkouts))
//                        //                            }
//                    }
//                    .navigationBarTitle("Choose Your Workout")
//                    .navigationBarBackButtonHidden(true)
//                    .navigationBarItems(
//                        leading: Button(action: {
//                            // Action to perform when the back button is tapped
//                            presentationMode.wrappedValue.dismiss()
//                        }) {
//                            Image(systemName: "chevron.left")
//                                .foregroundColor(.blue)
//                                .font(.title)
//                        }
//                    )
//                    .edgesIgnoringSafeArea(.bottom)
//                    .onAppear {
//                        viewModel.listentoRealtimeDatabase()
//                    }
//                    .onDisappear {
//                        viewModel.stopListening()
//                    }
//                }
//            }
//        }
//    }
//}
//
//struct WorkoutTestView_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkoutTestView()
//    }
//}
