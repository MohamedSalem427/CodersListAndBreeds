//
//  CatTypesScreen.swift
//  CodersList
//
//  Created by Mohamed Salem on 23/03/2022.
//

import SwiftUI
import CoreData

struct CatTypesScreen: View {
    
    @StateObject private var vm: CatTypesVM
    @State private var searchText: String = ""

    var body: some View {
        NavigationView {
            if #available(iOS 15.0, *) {
                List {
                    ForEach(vm.savedBreeds,id: \.id) { breed in
                        NavigationLink {
//                            CatDetailsScreen(breed: breed)
                        } label: {
                            CatTypeCell(breed: breed)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Find Your Perfect Cat")
                .searchable(text: $searchText)
            } else {
                // Fallback on earlier versions
            }
        }
    }
}
extension CatTypesScreen {
    static func build(_ context: NSManagedObjectContext) -> CatTypesScreen {
        let vm = CatTypesVM(context,
                            store: BreedsDBHandler())
        return CatTypesScreen(vm: vm)
    }
}
