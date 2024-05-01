//
//  FrameworkGridView.swift
//  framework2.0
//
//  Created by Briana D on 12/21/23.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns : columns) {
                    ForEach (MockData.frameworks) { framework in
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
                            viewModel.selectedFramework = framework
                        }
                    }
                }
            }
            .sheet(isPresented: $viewModel.isShowingDetailView) { FrameWorkDetailView(framework: viewModel.selectedFramework ?? MockData.sampleFramework, isShowingDetailView: $viewModel.isShowingDetailView)
            }
            
            .padding(.top)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HeaderView(ImageName:"flower.leaf", Title: "Frameworks")
                }

            }
        }
    }
}

struct FrameworkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
    }
}
    
struct FrameworkTitleView: View{
    let framework: Framework
    
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
        .padding()
    }
}

struct HeaderView: View {
    
    var ImageName: String
    var Title: String
    
    var body: some View {
        
            HStack (spacing: 15){
                Image(ImageName)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .symbolRenderingMode(.multicolor)
                    .foregroundStyle(.mint,.green)
                Text(Title)
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
        }
    }



