//
//  PostData.swift
//  H4X0R News
//
//  Created by  Vladyslav Fil on 28.07.2020.
//  Copyright © 2020  Vladyslav Fil. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let title: String
    let points: Int
    let url: String?
}
