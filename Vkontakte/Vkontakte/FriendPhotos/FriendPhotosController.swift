//
//  FriendPhotosController.swift
//  Vkontakte
//
//  Created by Lera on 09.07.21.
//

import UIKit

final class FriendPhotosController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet var collectionView: UICollectionView!
    
    var friend: FriendModel?
    var selectedItem: Int = 0
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = friend?.name
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // размещение контрола на экране
        setLikeControl()
    }
    
    func setLikeControl() {
        let itemSize = UIScreen.main.bounds.width/3 - 3
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        
        collectionView.collectionViewLayout = layout
    }
}

    // MARK: Extensions

extension FriendPhotosController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let friendPhotos = friend?.photoLibrary else { return 0 }
        return friendPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseIdentifier, for: indexPath) as! PhotoCell
        guard let imageModel = friend?.photoLibrary[indexPath.item] else { return cell }
        cell.configure(photoModel: imageModel)
        // когда лайк нажат, срабатывает замыкание
        cell.likeTapped = { [weak self] in
            // у модели данных, откуда берем фотографию, меняем состояние isLiked на противоположное
            self?.friend?.photoLibrary[indexPath.item].isLiked.toggle()
            collectionView.reloadItems(at: [indexPath]) // обновление ячейки по тому же индексу
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showScaledPhoto",
           let fullScreenController = segue.destination as? FullScreenPhotoController,
           let photos = friend?.photoLibrary {
            fullScreenController.selectedItem = selectedItem
            // определяем нажатую ячейку и передаем ее индекс
            fullScreenController.row = collectionView.indexPathsForSelectedItems?.last?.row
            
            fullScreenController.photo = photos.compactMap {$0.image}
        }
    }
}

extension FriendPhotosController: UICollectionViewDelegate {}


