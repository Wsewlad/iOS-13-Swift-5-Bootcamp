//
//  CoinData.swift
//  ByteCoin
//
//  Created by  Vladyslav Fil on 26.06.2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Codable {
    let rate: Double
    let asset_id_base: String
    let asset_id_quote: String
    let time: String
}
