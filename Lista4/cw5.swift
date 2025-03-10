//
//  cw5.swift
//  Lista4
//
//  Created by Natanael Jop on 24/02/2025.
//

import SwiftUI
import PDFKit

struct Cw5View: View {
    @State var data: Data?
    @State var url: URL?
    var body: some View {
        VStack {
            if let data = data {
                PDFKitRepresentedView(data: data)
            }else{
                Button {
                    url = Bundle.main.url(forResource: "mypdf", withExtension: "pdf")
                    if let url = url {
                        self.data = try? Data(contentsOf: url)
                    }
                } label: {
                    Text("PDF Viewer")
                }
            }

        }
    }
}

struct PDFKitRepresentedView: UIViewRepresentable {
    typealias UIViewType = PDFView
    
    let data: Data
    
    init(data: Data) {
        self.data = data
    }
    
    func makeUIView(context: UIViewRepresentableContext<PDFKitRepresentedView>) -> UIViewType {
        let pdfView = PDFView()
        pdfView.document = PDFDocument(data: data)
        pdfView.autoScales = true
        pdfView.displayMode = .singlePage
        return pdfView
    }
    
    func updateUIView(_ pdfView: UIViewType, context: UIViewRepresentableContext<PDFKitRepresentedView>) {
        pdfView.document = PDFDocument(data: data)
    }
}

#Preview {
    Cw5View()
}
