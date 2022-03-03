//
//  CodeTextView.swift
//  LearningApp
//
//  Created by Тимофей Дудич on 24.02.22.
//

import SwiftUI

struct CodeTextView: UIViewRepresentable {
    @EnvironmentObject var model:ContentModel
    
    func makeUIView(context: Self.Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        return textView
    }
    
    func updateUIView(_ textView: UITextView, context: Self.Context) {
        textView.attributedText = model.codeText
        //This will cause the text to scroll to the its beginnig position
        textView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
    }
}

struct CodeTextView_Previews: PreviewProvider {
    static var previews: some View {
        CodeTextView()
    }
}
