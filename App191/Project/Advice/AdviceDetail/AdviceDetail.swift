//
//  AdviceDetail.swift
//  App191
//
//  Created by Вячеслав on 9/14/23.
//

import SwiftUI

struct AdviceDetail: View {
    
    let index: AdviceItem
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack {
                        
                        WebPic(urlString: index.image, width: .infinity, height: 300, cornerRadius: 0, isPlaceholder: true)
                        
                        VStack(alignment: .leading, content: {
                            
                            Text(index.title)
                                .foregroundColor(.white)
                                .font(.system(size: 19, weight: .medium))
                                .multilineTextAlignment(.leading)
                            
                            Text(index.content)
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                                .multilineTextAlignment(.leading)
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    }
                }
            }
            .ignoresSafeArea(.all, edges: .top)
        }
    }
}

struct AdviceDetail_Previews: PreviewProvider {
    static var previews: some View {
        AdviceDetail(index: AdviceItem(title: "dasp[okd[", content: "dspaojdsapod", image: "dpsaojd", date: "dspaj"))
    }
}
