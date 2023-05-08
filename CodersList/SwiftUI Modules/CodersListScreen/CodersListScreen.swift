//
//  ContentView.swift
//  CodersList
//
//  Created by Mohamed Salem on 21/03/2022.
//

import SwiftUI
struct CodersListScreen: View {
    @ObservedObject private var vm: CodersListVM
    var body: some View {
        ZStack {
            ActivityIndicator(isAnimating: .constant(vm.isloading), style: .large, color: .red)
            ContentView()
        }
    }
    
    private func ContentView() -> some View {
        NavigationView {
            CodersList(items: $vm.codersList) { selectedItem in
                
            }
            .navigationTitle("Find Coder")
        }
    }
}
extension CodersListScreen {
    static func build() -> CodersListScreen {
        let vm = CodersListVM()
        return CodersListScreen(vm: vm)
    }
}


