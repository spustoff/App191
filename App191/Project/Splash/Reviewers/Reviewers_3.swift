//
//  Reviewers_3.swift
//  App191
//
//  Created by Вячеслав on 9/14/23.
//

import SwiftUI

struct Reviewers_3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color("primary")
                .ignoresSafeArea()
            
            VStack {
                
                Image("reviewers_3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    VStack(spacing: 7, content: {
                        
                        Text("New accounts")
                            .foregroundColor(.white)
                            .font(.system(size: 23, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("Specify the purposes of your accounts")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .padding(.horizontal)
                    .padding(.bottom, 130)
                    
                    Button(action: {
                        
                        status = true
                        
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

struct Reviewers_3_Previews: PreviewProvider {
    static var previews: some View {
        Reviewers_3()
    }
}
