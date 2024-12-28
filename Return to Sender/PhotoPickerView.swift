//
//  PhotoPickerView.swift
//  Return to Sender
//
//  Created by Tommy Hessel on 12/27/24.
//

import SwiftUI
import PhotosUI
import Vision

struct PhotoPickerView: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImage: UIImage? = nil  // Store the selected UIImage
    @State private var extractedText: String = "Text will appear here"
    
    var body: some View {
        VStack {
            // Title
            Text("OCR Photo Picker")
                .font(.largeTitle)
                .padding()

            // Image picker
            PhotosPicker(
                selection: $selectedItem,
                matching: .images,
                photoLibrary: .shared()  // Corrected to .shared()
            ) {
                Text("Select a Photo")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .task(id: selectedItem) {  // Using .task to perform an action on selection change
                if let item = selectedItem {
                    // Load the selected image as Data
                    if let imageData = try? await item.loadTransferable(type: Data.self) {
                        // Convert Data to UIImage
                        if let image = UIImage(data: imageData) {
                            selectedImage = image
                            performOCR(on: image)
                        } else {
                            extractedText = "Failed to convert data to image"
                        }
                    } else {
                        extractedText = "Failed to load image data"
                    }
                }
            }
            .padding()

            // Display the selected image if available
            if let selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .cornerRadius(10)
                    .padding()
            }

            // Display the OCR result
            Text(extractedText)
                .padding()
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)

            Spacer()
        }
        .padding()
    }

    // Function to perform OCR on the selected image
    func performOCR(on image: UIImage) {
        guard let ciImage = CIImage(image: image) else {
            extractedText = "Failed to load image"
            return
        }

        // Initialize Vision request to recognize text
        let requestHandler = VNImageRequestHandler(ciImage: ciImage, options: [:])
        let textRequest = VNRecognizeTextRequest { request, error in
            // Use self explicitly (no weak reference needed here)
            self.processTextRequest(request, error: error)
        }

        do {
            try requestHandler.perform([textRequest])
        } catch {
            extractedText = "Error performing OCR: \(error.localizedDescription)"
        }
    }

    // Function to process text extracted from OCR
    func processTextRequest(_ request: VNRequest, error: Error?) {
        if let error = error {
            extractedText = "OCR error: \(error.localizedDescription)"
            return
        }

        guard let results = request.results as? [VNRecognizedTextObservation] else {
            extractedText = "No text detected"
            return
        }

        // Combine all recognized text
        var recognizedText = ""
        for observation in results {
            if let topCandidate = observation.topCandidates(1).first {
                recognizedText += topCandidate.string + "\n"
            }
        }

        // Update the UI with the recognized text
        DispatchQueue.main.async {
            self.extractedText = recognizedText.isEmpty ? "No text detected" : recognizedText
        }
    }
}

struct PhotoPickerView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPickerView()
    }
}
