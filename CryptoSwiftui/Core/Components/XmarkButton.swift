//
//  XmarkButton.swift
//  CryptoSwiftui
//
//  Created by ali sadeghi on 02/08/1402 AP.
//

import SwiftUI

struct XmarkButton: View {
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
        }

    }
}

struct XmarkButton_Previews: PreviewProvider {
    static var previews: some View {
        XmarkButton()
    }
}
