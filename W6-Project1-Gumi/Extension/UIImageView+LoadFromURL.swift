//
//  UIImageView+LoadFromURL.swift
//  W6-Project1-Gumi
//
//  Created by Thành Nguyên on 20/04/2021.
//

import UIKit

extension UIImageView {
    func loadFromURL(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
