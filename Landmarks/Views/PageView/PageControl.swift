//
//  PageControl.swift
//  Landmarks
//
//  Created by Jacklyn Tsai on 7/19/23.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int

    // use coordinator so that users can tap on one side or the other to move between pages
    func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(
                    context.coordinator,
                    action: #selector(Coordinator.updateCurrentPage(sender:)),
                    for: .valueChanged)

        return control
    }


    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    class Coordinator: NSObject {
           var control: PageControl


           init(_ control: PageControl) {
               self.control = control
           }


           @objc
           func updateCurrentPage(sender: UIPageControl) {
               control.currentPage = sender.currentPage
           }
       }
}



