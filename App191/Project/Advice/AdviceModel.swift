//
//  AdviceModel.swift
//  App191
//
//  Created by Вячеслав on 9/14/23.
//

import SwiftUI

struct AdviceModel: Codable, Hashable {

    var news: [AdviceItem]
}

struct AdviceItem: Codable, Hashable {
 
    var title, content, image, date: String
}
