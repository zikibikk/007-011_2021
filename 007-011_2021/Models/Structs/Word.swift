//
//  Word.swift
//  007-011_2021
//
//  Created by Alina Bikkinina on 19.12.2021.
//

import Foundation
struct Word: Codable {
    
    let word: String
    let origin: String?
    let meanings: [Meanings]?
}
