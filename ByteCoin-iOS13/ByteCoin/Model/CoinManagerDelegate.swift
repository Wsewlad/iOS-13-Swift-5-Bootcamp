//
//  CoinManagerDelegate.swift
//  ByteCoin
//
//  Created by  Vladyslav Fil on 26.06.2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateCionPrice(_ coinManager: CoinManager, coinInfo: CoinModel)
    func didFailWithError(_ error: Error)
}
