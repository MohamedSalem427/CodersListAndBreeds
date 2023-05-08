//
//  RemoveListSeperator.swift
//  CodersList
//
//  Created by Mohamed Salem on 22/03/2022.
//

import SwiftUI
struct RemoveListSeparator: ViewModifier {
    func body(content: Content) -> some View {
        Group {
            if #available(iOS 15, *) {
                content.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .listRowInsets(EdgeInsets())
                        .background(Color(UIColor.systemBackground))
                        .listRowSeparator(.hidden)
            } else {
                content.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .listRowInsets(EdgeInsets())
                        .background(Color(UIColor.systemBackground))
            }
        }
    }
}

public extension View {
    func removeListSeparator() -> some View {
        ModifiedContent(content: self, modifier: RemoveListSeparator())
    }
}
