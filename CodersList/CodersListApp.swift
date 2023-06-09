//
//  CodersListApp.swift
//  CodersList
//
//  Created by Mohamed Salem on 21/03/2022.
//

import SwiftUI
import Kingfisher

@main
struct CodersListApp: App {
    
    let persistenceController = PersistenceController.shared
    @Environment(\.scenePhase) var scenePhase
    
    
    var body: some Scene {
        WindowGroup {
            CatTypesScreen.build(persistenceController.container.viewContext)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }.onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            case .background:
                print("Scene is in background")
                persistenceController.save()
            case .inactive:
                print("Scene is inactive")
            case .active:
                print("Scene is active")
            @unknown default:
                print("Apple must have changed something")
            }
        }
    }
}
