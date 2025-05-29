//
//  OTPTextFieldRepresentable.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 29/05/25.
//

import SwiftUI
import UIKit

struct OTPTextFieldRepresentable: UIViewRepresentable {
    @Binding var text: String
        var onTextChange: ((String) -> Void)?
        
        class Coordinator: NSObject, UITextFieldDelegate {
            var parent: OTPTextFieldRepresentable
            
            init(_ parent: OTPTextFieldRepresentable) {
                self.parent = parent
            }
            
            func textFieldDidChangeSelection(_ textField: UITextField) {
                parent.text = textField.text ?? ""
                parent.onTextChange?(parent.text)
            }
        }

        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }

        func makeUIView(context: Context) -> UITextField {
            let textField = UITextField()
            textField.keyboardType = .numberPad
            textField.textContentType = .oneTimeCode
            textField.delegate = context.coordinator
            textField.becomeFirstResponder()
            textField.tintColor = .clear // cursor color
            textField.textColor = .clear // hide actual text
            return textField
        }

        func updateUIView(_ uiView: UITextField, context: Context) {
            uiView.text = text
        }
}
