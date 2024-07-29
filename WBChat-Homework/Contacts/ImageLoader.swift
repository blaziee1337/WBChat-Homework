//
//  ImageLoader.swift
//  WBChat-Homework
//
//  Created by Halil Yavuz on 29.07.2024.
//

import SwiftUI

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    func loadImage(from name: String) {
        DispatchQueue.global().async {
            let image = UIImage(named: name)
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}

