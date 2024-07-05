//
//  Questions.swift
//  tbc-x-hackathon
//
//  Created by Akaki Titberidze on 05.07.24.
//

import Foundation

struct Questions: Codable {
    let imagePath: String
    let description: String
    let answers: [Question]
}
