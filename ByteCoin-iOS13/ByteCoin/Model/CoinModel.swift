//
//  CoinModel.swift
//  ByteCoin
//
//  Created by  Vladyslav Fil on 26.06.2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel {
    let price: Double
    let coin: String
    let currency: String
    let time: String
    
    var priceString: String {
        return String(format: "%.2f", price)
    }
}
