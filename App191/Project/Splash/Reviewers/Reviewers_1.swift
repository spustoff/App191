//
//  Reviewers_1.swift
//  App191
//
//  Created by Вячеслав on 9/14/23.
//

import SwiftUI

struct Reviewers_1: View {
    
    var body: some View {
        
        ZStack {
            
            Color("primary")
                .ignoresSafeArea()
            
            VStack {
                
                Image("reviewers_1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    VStack(spacing: 7, content: {
                        
                        Text("Distribute income")
                            .foregroundColor(.white)
                            .font(.system(size: 23, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("Allocate your income by goals")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .padding(.horizontal)
                    .padding(.bottom, 130)
                    
                    NavigationLink(destination: {
                        
                        Reviewers_2()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Continue")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                    })
                }
                .padding(.top)
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color("bg").ignoresSafeArea())
            }
        }
    }
}

struct Reviewers_1_Previews: PreviewProvider {
    static var previews: some View {
        Reviewers_1()
    }
}
