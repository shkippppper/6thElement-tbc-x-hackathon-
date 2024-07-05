//
//  Module.swift
//  tbc-x-hackathon
//
//  Created by Akaki Titberidze on 05.07.24.
//

import Foundation

struct Module: Codable {
    let id: Int
    let name: String
    let type: String
    let imagePath: String
    let chapters: [Chapter]?
}
