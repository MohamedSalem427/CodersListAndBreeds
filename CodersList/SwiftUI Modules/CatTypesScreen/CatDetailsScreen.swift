//
//  CatDetailsScreen.swift
//  CodersList
//
//  Created by Mohamed Salem on 23/03/2022.
//

import SwiftUI

struct CatDetailsScreen: View {
    let breed: BreedItem
    let imageSize: CGFloat = 300
    
    var body: some View {
        ScrollView {
            VStack {
                if breed.image?.url != nil {
                    if #available(iOS 15.0, *) {
                        AsyncImage(url: URL(string: breed.image!.url!)) { phase in
                            if let image = phase.image {
                                image.resizable()
                                    .scaledToFit()
                                    .frame( height: imageSize)
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
                    Color.gray.frame(height: imageSize)
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text(breed.name)
                        .font(.headline)
                    Text(breed.temperament)
                        .font(.footnote)
                    Text(breed.description)
                    if breed.hairless == 1 {
                        Text("hairless")
                    }
                    
                    HStack {
                        Text("Energy level")
                        Spacer()
                        ForEach(1..<6) { id in
                            Image(systemName: "star.fill")
                                .foregroundColor(breed.energyLevel > id ? Color.accentColor : Color.gray )
                        }
                    }
                    
                    Spacer()
                }.padding()
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
