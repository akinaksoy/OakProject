//
//  ProductCell.swift
//  OakProject
//
//  Created by Akın Aksoy on 10.05.2023.
//

import SwiftUI
import Kingfisher
struct ProductCell: View {
    let product: AppModel
    
    var body: some View {
        ZStack {
            HStack {
                KFImage(URL(string: product.iconURL))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .padding(.leading,8)
                    .alignmentGuide(.leading) { _ in
                        return 0
                    }
                VStack(alignment: .leading) {
                Text(product.name.capitalized)
                        .font(.headline)
                Text(product.category.rawValue)
                        .font(.system(size: 14))
                    HStack(spacing: 4) {
                        Text(String(product.ratingValue))
                            .font(.system(size: 12))
                        Image(systemName: "star.fill")
                            .font(.system(size: 12))
                            .foregroundColor(.yellow)
                        Text("(\(String(product.ratingCount)))")
                            .font(.system(size: 12))
                        Text("\(String(product.downloads))")
                            .font(.system(size: 12))
                    }
                    
                }
                Spacer()
            }
            
        }
    }
}
