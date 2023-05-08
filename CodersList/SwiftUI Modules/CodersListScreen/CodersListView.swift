//
//  CodersListView.swift
//  CodersList
//
//  Created by Mohamed Salem on 22/03/2022.
//

import SwiftUI

struct CodersList: View {
    @Binding var items: [CoderItem]
    @State public var selectedItem: CoderItem? = nil
    public let onItemTapped: (CoderItem) -> Void


    public init(items: Binding<[CoderItem]>,
                onItemTapped: @escaping (CoderItem) -> Void) {
        _items = items
        self.onItemTapped = onItemTapped
    }

    var body: some View {
        List {
            ForEach(items, id: \.id) { item in
                CoderCell(item: item) { itemSelected in
                    selectedItem = itemSelected
                    selectItem(item: itemSelected)
                }
            }
            .removeListSeparator()
            .id(UUID())
        }.listStyle(.plain)
    }

    private func selectItem(item: CoderItem) {
        items.forEach { item in
//            item.isSelected = false
        }
//        item.isSelected = true
        onItemTapped(item)
    }

}
