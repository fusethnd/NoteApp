//
//  NoteView.swift
//  NoteApp
//
//  Created by Thanadon Boontawee on 3/4/2567 BE.
//

import SwiftUI
import FirebaseFirestoreSwift

struct NoteView: View {
    @StateObject var viewModel: NoteViewModel
    @StateObject var profileViewModel = ProfileViewModel()
    
    @FirestoreQuery var items: [NoteItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: NoteViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    NoteItemView(item: item)
                        .swipeActions {
                            Button {
                                viewModel.edit(id: item.id)
                            } label: {
                                Label("Edit", systemImage: "pencil")
                            }
                            .tint(.blue)
                            .sheet(isPresented: $viewModel.showingEditItemView) {
                                EditNoteView(viewModel: viewModel)
                            }

                            Button {
                                viewModel.delete(id: item.id)
                            } label: {
                                Image(systemName: "trash.fill")
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Notes")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingEditItemView) {
                EditNoteView(viewModel: viewModel)
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct EditNoteView: View {
    @ObservedObject var viewModel: NoteViewModel
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $viewModel.title)
                TextEditor(text: $viewModel.content)
                    .frame(height: 200) // Adjust the height as needed
            }
            .navigationTitle("Edit Note")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        viewModel.showingEditItemView = false
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        viewModel.updateNote()
                    }
                }
            }
        }
    }
}

//    var body: some View {
//        NavigationView {
//            VStack {
//                List(items) { item in
//                    NoteItemView(item: item)
//                        .swipeActions {
//                            Button {
//                                viewModel.edit(id: item.id)
//                            } label: {
//                                Label("Edit", systemImage: "pencil")
//                            }
//                            .tint(.blue) // Optional: Change the tint color to differentiate the edit button
//                            .sheet(isPresented: $viewModel.showingEditItemView) {
//                                EditNoteView(viewModel: viewModel)
//                            }
//
//                            Button {
//                                viewModel.delete(id: item.id)
//                            } label: {
////                                Text("Delete")
//                                Image(systemName: "trash.fill")
//                            }
//                            .tint(.red)
//                        }
//                    
//                }
//                .listStyle(PlainListStyle())
//            }
//            .navigationTitle("Notes")
//            .toolbar {
//                Button {
//                    viewModel.showingNewItemView = true
//                } label: {
//                    Image(systemName: "plus")
//                }
//            }
//            .sheet(isPresented: $viewModel.showingNewItemView) {
//                NewItemView(newItemPresented: $viewModel.showingNewItemView)
//            }
//        }
//    }
//}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView(userId: "A7fMXIMP7pctLhRFNH5Ue17uzYB2")
    }
}
