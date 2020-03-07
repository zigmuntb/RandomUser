//
//  ImageLoader.swift
//  RandomUser
//
//  Created by Arsenkin Bogdan on 07.03.2020.
//  Copyright © 2020 Arsenkin Bogdan. All rights reserved.
//

import UIKit
import SDWebImage

final class ImageLoader {
    static func loadImage(with indicatorType: SDWebImageActivityIndicator, urlString: String, imageView: UIImageView?, completion: ((UIImage) -> ())?) {
        guard let url = URL(string: urlString) else { return }
        
        imageView?.sd_imageIndicator = indicatorType
        
        if let completion = completion {
            imageView?.sd_setImage(with: url) { (image, _, _, _) in
                completion(image ?? UIImage())
            }
        } else {
            imageView?.sd_setImage(with: url)
        }
    }
}
