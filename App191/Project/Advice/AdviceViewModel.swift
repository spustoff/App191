//
//  AdviceViewModel.swift
//  App191
//
//  Created by Вячеслав on 9/14/23.
//

import SwiftUI
import Alamofire

final class AdviceViewModel: ObservableObject {
    
    @Published var calendar_items: [AdviceItem] = []
    
    @Published var isDetail: Bool = false
    @Published var selected_item: AdviceItem?
    
    @Published var isLoading: Bool = false
    
    func getNews() {
        
        isLoading = true
        
        self.fetchNews() { result in
            
            switch result {
                
            case .success(let success):
                
                self.calendar_items = success.news
                
            case .failure(let failure):
                
                debugPrint("Parse error - \(failure)")
                
                self.isLoading = false
            }
        }
    }
    
    func fetchNews(completion: @escaping (Result<AdviceModel, Error>) -> Void ) {
        
        isLoading = true
        
        let params: Parameters = [
            
            "token": "2d1a37cd-fd36-447c-bfbc-31ba2a816cdd",
        ]
        
        let request = AF.request("https://kukusup.space/api/v2/news_avia", method: .get, parameters: params)
        
        request.responseDecodable(of: AdviceModel.self) { response in
            
            guard let value = response.value else {
                
                print("decode error")
                print(response)
                self.isLoading = false
                return
            }
                           
            switch response.result {
                
            case .success(_):
                
                completion(.success(value))
                self.isLoading = false
                
            case .failure(_):
                
                completion(.failure(response.error.debugDescription as! Error))
                self.isLoading = false
            }
        }
    }
}
