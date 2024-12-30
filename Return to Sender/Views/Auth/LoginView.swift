//
//  ViewB.swift
//  Return to Sender
//
//  Created by Tommy Hessel on 12/29/24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var coordinator: NavCoordinator

    var body: some View {
        VStack {
            Text("This is log in")
        }
    }
}

#Preview {
    LoginView()
}
