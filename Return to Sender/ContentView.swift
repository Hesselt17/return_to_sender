//
//  ContentView.swift
//  Return to Sender
//
//  Created by Tommy Hessel on 12/26/24.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack{
                PhotoPickerView()
            }
            /*VStack {
                Text("Scan a document")
                    .font(.title)
                    .padding()
                DocumentScannerView()
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
            }*/
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
