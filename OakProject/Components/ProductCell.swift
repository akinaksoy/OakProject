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
            Button(action: {
            guard let url = URL(string: "https://play.google.com/store/apps/details?id=\(product.packageName)") else { return }
            let detailView = DetailView(url: url)
                UIApplication.shared.windows.first?.rootViewController?.present(UIHostingController(rootView: detailView), animated: true)
            }) {
           
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
                    Text(product.category)
                        .font(.system(size: 14))
                    HStack(spacing: 4) {
                        Text(String(product.ratingValue ?? 0.0))
                            .font(.system(size: 12))
                        Image(systemName: "star.fill")
                            .font(.system(size: 12))
                            .foregroundColor(.yellow)
                        Text("(\(String(product.ratingCount ?? 0)))")
                            .font(.system(size: 12))
                        Text("\(String(product.downloads))")
                            .font(.system(size: 12))
                    }
                    
                }
                Spacer()
            }
            }.buttonStyle(PlainButtonStyle())
            
        }
    }
}
