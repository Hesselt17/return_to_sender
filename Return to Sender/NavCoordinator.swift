//
//  NavCoordinator.swift
//  Return to Sender
//
//  Created by Tommy Hessel on 12/29/24.
//


import SwiftUI

class NavCoordinator: ObservableObject {
    @Published var path = NavigationPath()

    func show<V>(_ viewType: V.Type) where V: View {
        path.append(String(describing: viewType.self))
    }

    func popToRoot() {
        path.removeLast(path.count)
    }
}
