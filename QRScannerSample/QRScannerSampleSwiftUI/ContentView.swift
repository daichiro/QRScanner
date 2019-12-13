//
//  ContentView.swift
//  QRScannerSampleSwiftUI
//
//  Created by daichiro on 2019/12/12.
//  Copyright © 2019 mercari.com. All rights reserved.
//

import SwiftUI
import QRScanner

struct ContentView: UIViewRepresentable {
    typealias UIViewType = QRScannerView

    func makeUIView(context: Context) -> UIViewType {
        QRScannerView(frame: .zero)
    }

    func updateUIView(_ uiView: ContentView.UIViewType, context: UIViewRepresentableContext<ContentView>) {
        uiView.configure(delegate: context.coordinator)
        uiView.startRunning()
    }

    func makeCoordinator() -> ContentView.Coordinator {
        Coordinator()
    }
}

extension ContentView {
    class Coordinator: NSObject, QRScannerViewDelegate {
        func qrScannerView(_ qrScannerView: QRScannerView, didSuccess code: String) {
            print(code)
        }

        func qrScannerView(_ qrScannerView: QRScannerView, didFailure error: QRScannerError) {
            print(error)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
