//
//  CoderCell.swift
//  CodersList
//
//  Created by Mohamed Salem on 22/03/2022.
//


import SwiftUI
public struct CoderCell: View {
    let item: CoderItem
    var onTapped: (CoderItem) -> ()
    init(item: CoderItem,
         onTapped: @escaping (CoderItem) -> ()) {
        self.item = item
        self.onTapped = onTapped
        UITableView.appearance().separatorStyle = .none
    }
    public var body: some View {
        VStack{
            HStack {
                CoderImageView()
                VStack{
                    Text(item.fullName)
                        .foregroundColor(.black)
                    Spacer()
                }
            }
        }.contentShape(Rectangle())
            .onTapGesture {
//                item.isSelected = true
                onTapped(item)
            }
    }
    private func CoderImageView() -> some View {
        RoundedRectangle(cornerRadius: 15)
//            .stroke(isSelected ? .white : .blue, lineWidth: 5)
                .stroke(.white, lineWidth: 5)
                .background(Color.white).cornerRadius(15)
                .overlay(
                    AppRemoteImage.url(URL(string: item.owner.avatarURL))
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(15)
                                .clipped()

                ).frame(width: 120, height: 120)
    }
}
