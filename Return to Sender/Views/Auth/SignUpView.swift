//
//  ViewA.swift
//  Return to Sender
//
//  Created by Tommy Hessel on 12/29/24.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject private var coordinator: NavCoordinator

    var body: some View {
        VStack {
            Text("This is sign up")
        }
    }
}

#Preview {
    SignUpView()
}
