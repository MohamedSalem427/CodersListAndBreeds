//
//  CatTypeCell.swift
//  CodersList
//
//  Created by Mohamed Salem on 23/03/2022.
//


import SwiftUI

struct CatTypeCell: View {
    let breed: BreedDataEntity
    let imageSize: CGFloat = 100
    var body: some View {
        HStack {
            if breed.url != nil {
                if #available(iOS 15.0, *) {
                    AsyncImage(url: URL(string: breed.url!)) { phase in
                        if let image = phase.image {
                            image.resizable()
                                .scaledToFill()
                                .frame(width: imageSize, height: imageSize)
                                .clipped()
                            
                        } else if phase.error != nil {
                            Text(phase.error?.localizedDescription ?? "error")
                                .foregroundColor(Color.pink)
                                .frame(width: imageSize, height: imageSize)
                        } else {
                            ProgressView()
                                .frame(width: imageSize, height: imageSize)
                        }
                    }
                } else {
                    // Fallback on earlier versions
                }
            }else {
                Color.gray.frame(width: imageSize, height: imageSize)
            }
            VStack(alignment: .leading, spacing: 5) {
                Text(breed.name ?? "")
                    .font(.headline)
                Text(breed.temperament ?? "")
            }
        }
    }
}
