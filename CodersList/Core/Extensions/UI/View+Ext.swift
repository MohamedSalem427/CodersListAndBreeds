//
//  View+Ext.swift
//  ModernMVVM
//
//  Created by Vadim Bulavin on 3/20/20.
//  Copyright © 2020 Vadym Bulavin. All rights reserved.
//

import SwiftUI

extension View {
    func eraseToAnyView() -> AnyView { AnyView(self) }
}

extension View {
    func hideNavigationBar() -> some View {
        self
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
    }
}

extension View {
    func endEditing(_ force: Bool) {
        UIApplication.shared.windows.forEach { $0.endEditing(force)}
    }
}
