//
//  ViewController.swift
//  photo
//
//  Created by Евгений on 21.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet  var collectionView: UICollectionView!
    
    var choosedImage = UIImage()
    
    

    @IBOutlet weak var loadButtonOutlet: UIButton!
    var photos: [Photo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "ImageCell", bundle: nil),
                                forCellWithReuseIdentifier: "ImageCell")
        
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))

        self.collectionView.addGestureRecognizer(tap)

        self.collectionView.isUserInteractionEnabled = true
        
        }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        if self.collectionView?.indexPathForItem(at: sender.location(in: self.collectionView)) != nil {
            print(collectionView.indexPathForItem(at: sender.location(in: self.collectionView))) != nil
            
            var indexTouchedImage = collectionView.indexPathForItem(at: sender.location(in: self.collectionView))
            
//            imageSheet.image = photos[indexTouchedImage!.row].image
            choosedImage = photos[indexTouchedImage!.row].image!
            performSegue(withIdentifier: "viewId", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewId" {
            let dvc = segue.destination as! ChoosedImage
            dvc.newImage = choosedImage
        }
    }
    
    @IBAction func loadButton(_ sender: Any) {
        setupPhoto()
        loadButtonOutlet.isEnabled = false
        loadButtonOutlet.backgroundColor = .gray
        loadButtonOutlet.setTitle("Фото загруженно", for: .normal)
    }

    
    func setupPhoto() {
        photos = Array(repeating: Photo(url: "https://picsum.photos/300"), count: 40)
        print(photos)
        collectionView.reloadData()
    
    }


    
}

//MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
//            photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        if photos.isEmpty == false {
            cell.setImage(photoModel: photos[indexPath.item]) {[weak self] image in
                self?.photos[indexPath.item].image = image
            }
        }
        return cell
    }

    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

            let size = (collectionView.frame.width - 30) / 3
        return .init(width: size, height: size)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
    }


 //MARK: - Why it doesnt work ??? so i used UITapGestureRecognizer
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        print("WHy")
    }

}



struct Photo {
    let url: String
    var image: UIImage?
    
    init(url:String) {
        self.url = url
    }
}


