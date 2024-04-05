//
//  NoteItem.swift
//  NoteApp
//
//  Created by Thanadon Boontawee on 3/4/2567 BE.
//

import Foundation

struct NoteItem: Codable, Identifiable {
    let id: String
    let title: String
    let content: String
    let createDate: TimeInterval
}
