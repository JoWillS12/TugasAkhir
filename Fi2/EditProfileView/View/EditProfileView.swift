//
//  EditProfileView.swift
//  Fi2
//
//  Created by Joseph William Santoso on 18/03/23.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct EditProfileView: View {
    @State var name = ""
    @State var age = ""
    @State var gender = ""
    @ObservedObject var profile: ProfileViewModel
    @State private var email: String
    
    init(profile: ProfileViewModel) {
        self._profile = ObservedObject(wrappedValue: profile)
        self._email = State(initialValue: profile.email)
    }
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                VStack{
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.4)
                        .padding()
                    
                    TextField("NickName", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    TextField("Age", text: $age)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .keyboardType(.numberPad)
                    
                    TextField("Gender", text: $gender)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    TextField("Email", text: $profile.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .disabled(true)
                    
                    Button(action: {
                        // Update profile logic
                        let db = Firestore.firestore()
                        let userRef = db.collection("users").document(profile.email)
                        userRef.updateData([
                            "name": name,
                            "age": age,
                            "gender": gender
                        ]) { error in
                            if let error = error {
                                print("Error updating document: \(error)")
                            } else {
                                print("Document successfully updated")
                                // You may want to show an alert or navigate back to the previous view here
                            }
                        }
                    }, label: {
                        Text("Save Changes")
                            .padding(.horizontal, 40)
                            .padding(.vertical, 10)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    })
                    .frame(width: geometry.size.width * 0.6)
                }
            }
        }
        .navigationBarTitle("Edit Profile")
        .onAppear {
            self.email = email
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditProfileView(profile: ProfileViewModel())
        }
    }
}

