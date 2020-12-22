//
//  ImageCell.swift
//  photo
//
//  Created by Евгений on 21.12.2020.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    @IBOutlet private weak var imageView: UIImageView!
    
    
    override func prepareForReuse() {
        imageView.image = nil
        
        
        
    }
    
    
    //MARK: - Public API
    func setImage(photoModel: Photo, completion: @escaping (UIImage?) -> Void) {
        if let image = photoModel.image {
            imageView.image = image
            imageView.isUserInteractionEnabled = false
            return
        }

        guard let imageURL = URL(string: photoModel.url) else { return }

        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            completion(image)
            
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }

    func setImageWithUrlSession(photoModel: Photo, completion: @escaping (UIImage?) -> Void) {
        if let image = photoModel.image {
            imageView.image = image
            return
        }

        guard let imageURL = URL(string: photoModel.url) else { return }

        URLSession.shared.dataTask(with: imageURL) { data, _,  _ in
            if let data = data, let image = UIImage(data: data) {
                completion(image)
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }
        }.resume()
    }

}


