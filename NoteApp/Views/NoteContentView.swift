//
//  NoteContentView.swift
//  NoteApp
//
//  Created by Thanadon Boontawee on 4/4/2567 BE.
//

//import SwiftUI
//import FirebaseFirestoreSwift
//
//struct NoteContentView: View {
//    @StateObject var viewModel: NoteContentViewModel
//    let item: NoteItem
//    
//    init(userId: String, item: NoteItem) {
//        self.item = item
//        self._viewModel = StateObject(wrappedValue: NoteContentViewModel(userId: userId))
//    }
//    
//    var body: some View {
//        
//        VStack {
//            HStack {
//                Text(item.content)
//                    .font(.title3)
//                    .foregroundColor(Color(.secondaryLabel))
//                Spacer()
//            }
//        }
//        .navigationTitle(item.title)
//        .toolbar {
//            Button {
//                viewModel.showingItemView = true
//            } label: {
//                Image(systemName: "pencil")
//            }
//        }
//        .padding()
//            
//        Spacer()
//    }
//}
//
//struct NoteContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        NoteContentView(userId: "A7fMXIMP7pctLhRFNH5Ue17uzYB2", item: NoteItem(id: "123", title: "Get Milk", content: "temp", createDate: Date().timeIntervalSince1970))
//    }
//}
