//
//  ContentView.swift
//  Return to Sender
//
//  Created by Tommy Hessel on 12/26/24.
//

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        TabView {
            Tab("Formers", systemImage: "figure.wave") {
                FormersView()
            }
            Tab("Upload", systemImage: "tray.and.arrow.up.fill") {
                //PhotoPickerView()
                //DocumentScannerView()
            }
            Tab("Profile", systemImage: "person.crop.circle.fill") {
                //ProfileView()
            }
        }
    }
}

#Preview {
    ContentView()
}


/*
     struct ContentView_Previews: PreviewProvider {
     static var previews: some View {
     ContentView()
     }
     }
*/
