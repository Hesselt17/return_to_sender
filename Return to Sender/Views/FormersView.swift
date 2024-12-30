//
//  FormersView.swift
//  Return to Sender
//
//  Created by Tommy Hessel on 12/30/24.
//

import SwiftUI

struct FormersView: View {
    
    private var formers = [
        Formers(name: "Tommy Hessel"),
        Formers(name: "Lance Armstrong"),
        Formers(name: "Lance Armstrong Lance Armstrong Lance Armstrong"),
    ]
    
    var body: some View {
        Text ("Former Tenants")
            .font(.largeTitle)
            .multilineTextAlignment(.leading)
            .bold()
        Spacer()
        List (formers){former in
            Button(action: {
                print ("yo")
            }, label: {
                Text(former.name)
            })
        }
    }
}

struct Formers: Identifiable {
    let name: String
    let id = UUID()
}


#Preview {
    FormersView()
}
