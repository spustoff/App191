//
//  CalendarModel.swift
//  App191
//
//  Created by Вячеслав on 9/14/23.
//

import SwiftUI

struct CalendarResponseModel: Codable, Hashable {

    var results: [CalendarModel]
}

struct CalendarModel: Codable, Hashable {
 
    var resultIdItem: Int?
    var resultCurrencyItem: String?
    var resultBuyItem: Int?
    var resultSellItem: Int?
    var resultCreated_atItem: String?
    var resultUpdated_atItem: String?

}
