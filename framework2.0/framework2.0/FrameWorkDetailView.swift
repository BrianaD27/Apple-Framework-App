//
//  FrameWorkDetailView.swift
//  framework2.0
//
//  Created by Briana D on 12/21/23.
//

import SwiftUI

struct FrameWorkDetailView: View {
    var framework: Framework
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button {
                    isShowingDetailView = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(Color(.label))
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                }
            }
            .padding()
            
            Spacer()
            
            FrameworkTitleView (framework: framework)
            
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button {
                isShowingSafariView = true
            } label: {
                FrameworkButton(title: "Learn More")
            }
        }
        .fullScreenCover(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
        })
        .padding(.bottom, 50)
    }
}

struct FrameWorkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameWorkDetailView(framework: MockData.sampleFramework, isShowingDetailView: .constant(false))
    }
}
