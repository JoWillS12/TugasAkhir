//
//  KeypadExtension.swift
//  Fi2
//
//  Created by Joseph William Santoso on 27/03/23.
//

import SwiftUI

struct CustomToolbar: UIViewRepresentable {
    typealias UIViewType = UIToolbar
    
    func makeUIView(context: Context) -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: context.coordinator, action: #selector(Coordinator.endEditing))
        toolbar.items = [spacer, doneButton]
        return toolbar
    }
    
    func updateUIView(_ uiView: UIToolbar, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject {
        @objc func endEditing() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}
