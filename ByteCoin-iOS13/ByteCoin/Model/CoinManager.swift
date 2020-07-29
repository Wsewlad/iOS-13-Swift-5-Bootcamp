//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    
    // API Key needed
    let apiKey = "Place API Key here!"
    
    let currencyArray = ["AUD", "BRL", "UAH", "CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?

    func getCoinPrice(for currency: String) {
        let url = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        performRequest(with: url)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error!)
                    return
                }
                if let safeData = data {
                    if let coinModel = self.parseJSON(safeData) {
                        self.delegate?.didUpdateCionPrice(self, coinInfo: coinModel)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let coinData = try decoder.decode(CoinData.self, from: data)
            let rate = coinData.rate
            let time = coinData.time
            let asset_id_base = coinData.asset_id_base
            let asset_id_quote = coinData.asset_id_quote
            
            let coinModel = CoinModel(price: rate, coin: asset_id_base, currency: asset_id_quote, time: time)
            return coinModel
        } catch {
            self.delegate?.didFailWithError(error)
            return nil
        }
        
    }
}

