//
//  Courses.swift
//  ApiTask
//
//  Created by Денис Александров on 27.06.2024.
//

import Foundation

struct Information: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
