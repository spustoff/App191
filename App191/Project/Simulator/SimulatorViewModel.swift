//
//  SimulatorViewModel.swift
//  App191
//
//  Created by Вячеслав on 9/14/23.
//

import SwiftUI

final class SimulatorViewModel: ObservableObject {
    
    @Published var currencies: [String] = ["EURUSD", "EURTRY", "EURKZT", "EURRUB", "EURJPY", "USDTRY", "USDRUB", "USDJPY", "USDCAD", "CADUSD", "CADTRY", "CADJPY", "CADRUB"]
    @Published var current_currency: String = ""
    
    @Published var isDetail: Bool = false
}
