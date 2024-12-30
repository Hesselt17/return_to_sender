//
//  WelcomeView.swift
//  Return to Sender
//
//  Created by Tommy Hessel on 12/28/24.
//

import SwiftUI

struct WelcomeView: View {
    
    @StateObject private var coordinator = NavCoordinator()
    
    var body: some View {
        NavigationStack (path: $coordinator.path) {
            VStack {
                Image("RTSIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text ("Welcome to \n Return to Sender")
                    .multilineTextAlignment(.center)
                    .font (.title)
                    .bold()
                    .foregroundStyle(Color.accentColor)
                Spacer()
                VStack (spacing: 10){
                    Button(action: {
                        coordinator.show (SignUpView.self)
                    }, label: {
                        Text ("Sign up")
                            .font(.title2)
                    })
                    Text ("OR")
                    Button(action: {
                        coordinator.show (LoginView.self)
                    }, label: {
                        Text ("Login")
                            .font(.title2)
                    })
                }
            }
            .navigationDestination(for: String.self) { id in
                if id == String(describing: SignUpView.self) {
                    SignUpView()
                } else if id == String(describing: LoginView.self) {
                    LoginView()
                }
            }
        }
        .environmentObject(coordinator)
    }
}

#Preview {
    WelcomeView()
}
