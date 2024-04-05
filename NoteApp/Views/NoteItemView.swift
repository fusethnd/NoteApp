//
//  NoteItemView.swift
//  NoteApp
//
//  Created by Thanadon Boontawee on 3/4/2567 BE.
//

import SwiftUI

struct NoteItemView: View {
    @StateObject var viewModel = NoteItemViewModel()
    let item: NoteItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.title)
                    .bold()
                
                Text("\(Date(timeIntervalSince1970: item.createDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
        }
    }
}

struct NoteItemView_Previews: PreviewProvider {
    static var previews: some View {
        NoteItemView(item: NoteItem(id: "123", title: "Get Milk", content: "Get Milk in today.", createDate: Date().timeIntervalSince1970))
    }
}
