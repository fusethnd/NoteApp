//
//  MainViewModel.swift
//  NoteApp
//
//  Created by Thanadon Boontawee on 3/4/2567 BE.
//

import Foundation
import FirebaseAuth

class MainViewModel: ObservableObject {
    @Published var currentUserId = ""
    
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
