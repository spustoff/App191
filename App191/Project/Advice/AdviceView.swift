//
//  AdviceView.swift
//  App191
//
//  Created by Вячеслав on 9/14/23.
//

import SwiftUI

struct AdviceView: View {
    
    @StateObject var viewModel = AdviceViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Advice")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .semibold))
                    
                    Spacer()
                }
                .padding()
                
                if viewModel.isLoading {
                    
                    ProgressView()
                        .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    if viewModel.calendar_items.isEmpty {
                        
                        VStack(spacing: 10, content: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .padding(15)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                            
                            Text("Empty")
                                .foregroundColor(.white)
                                .font(.system(size: 21, weight: .semibold))
                                .multilineTextAlignment(.center)
                            
                            Text("No any advice item on our platfrom")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .multilineTextAlignment(.center)
                        })
                        .frame(maxHeight: .infinity, alignment: .center)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: true) {
                            
                            LazyVStack {
                                
                                ForEach(viewModel.calendar_items, id: \.self) { index in
                                    
                                   Button(action: {
                                       
                                       viewModel.selected_item = index
                                       viewModel.isDetail = true
                                       
                                   }, label: {
                                       
                                       HStack {
                                           
                                           WebPic(urlString: index.image, width: 100, height: 100, cornerRadius: 10, isPlaceholder: true)
                                               
                                           VStack(alignment: .leading, content: {
                                               
                                               Text(index.title)
                                                   .foregroundColor(.white)
                                                   .font(.system(size: 16, weight: .medium))
                                                   .lineLimit(2)
                                                   .multilineTextAlignment(.leading)
                                               
                                               Text(index.content)
                                                   .foregroundColor(.gray)
                                                   .font(.system(size: 13, weight: .regular))
                                                   .lineLimit(3)
                                                   .multilineTextAlignment(.leading)
                                           })
                                           
                                           Spacer()
                                       }
                                       .padding()
                                       .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                                   })
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
            .onAppear {
                
                viewModel.getNews()
            }
            .sheet(isPresented: $viewModel.isDetail, content: {
                
                if let index = viewModel.selected_item {
                    
                    AdviceDetail(index: index)
                }
            })
        }
    }
}

struct AdviceView_Previews: PreviewProvider {
    static var previews: some View {
        AdviceView()
    }
}
