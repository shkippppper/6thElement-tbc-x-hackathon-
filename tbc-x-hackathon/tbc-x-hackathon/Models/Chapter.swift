//
//  Chapter.swift
//  tbc-x-hackathon
//
//  Created by Akaki Titberidze on 05.07.24.
//

import Foundation

struct Chapter: Codable {
    let id: Int
    let order: Int
    let moduleId: Int
    let questions: [Questions]?
}
