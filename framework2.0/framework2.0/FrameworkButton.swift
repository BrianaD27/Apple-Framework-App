//
//  FrameworkButton.swift
//  framework2.0
//
//  Created by Briana D on 12/21/23.
//

import SwiftUI

struct FrameworkButton: View {
    var title: String
    
    var body: some View {
        Text (title)
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(width: 280, height: 50)
            .background(.blue)
            .cornerRadius(10)    }
}

struct FrameworkButton_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkButton(title: "Test Title")
            .preferredColorScheme(.dark)
    }
}
