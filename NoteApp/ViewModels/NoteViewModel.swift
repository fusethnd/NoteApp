//
//  NoteViewModel.swift
//  NoteApp
//
//  Created by Thanadon Boontawee on 3/4/2567 BE.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class NoteViewModel: ObservableObject {
    @Published var showingNewItemView = false
    @Published var showingEditItemView = false // To control the visibility of the edit view
    @Published var title = ""
    @Published var content = ""
    @Published var showAlert = false
    @Published var editingNoteId: String? // ID of the note being edited

    
    private let userId: String
    private let db = Firestore.firestore()

    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
    
    func edit(id: String) {
        editingNoteId = id
        showingEditItemView = true
        
        // Load the note's data. Assume the note has 'title' and 'content' fields.
        let docRef = db.collection("users").document(userId).collection("todos").document(id)

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                self.title = data?["title"] as? String ?? ""
                self.content = data?["content"] as? String ?? ""
            } else {
                print("Document does not exist")
            }
        }
    }

    func updateNote() {
        guard let editingNoteId = editingNoteId else { return }

        let docRef = db.collection("users").document(userId).collection("todos").document(editingNoteId)

        docRef.updateData([
            "title": title,
            "content": content
        ]) { error in
            if let error = error {
                print("Error updating document: \(error)")
                self.showAlert = true // Optionally show an error alert
            } else {
                print("Document successfully updated")
                self.showingEditItemView = false // Dismiss the edit view
            }
        }
    }
}
