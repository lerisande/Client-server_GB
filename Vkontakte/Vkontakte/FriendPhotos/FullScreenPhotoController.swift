//
//  FullScreenPhotoController.swift
//  Vkontakte
//
//  Created by Lera on 31.07.21.
//

import UIKit

class FullScreenPhotoController: UIViewController {
    
    var photo = [UIImage]()
    var row: Int?
    var selectedItem: Int = 0
    
    @IBOutlet var scaledImage: UIImageView!
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let row = row else { return }
        scaledImage.image = photo[row]
        scaledImage.backgroundColor = view.backgroundColor
        
        let swipeLeft = UISwipeGestureRecognizer (target: self,
                                                  action: #selector(swipeLeftAction))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer (target: self,
                                                   action: #selector(swipeRightAction))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
    }
    
    // MARK: Swipe Gestures
    
    @objc func swipeLeftAction() {
        guard photo.count > selectedItem + 1 else { return }
        let nextImage = photo [selectedItem + 1]
        let photoView = UIImageView ()
        photoView.backgroundColor = view.backgroundColor
        photoView.contentMode = .scaleAspectFit
        photoView.image = nextImage
        photoView.frame = scaledImage.frame
        photoView.frame.origin.x += scaledImage.frame.maxX
        view.addSubview(photoView)
        UIView.animateKeyframes(withDuration: 1,
                                delay: 0,
                                options: []) {
            UIView.addKeyframe(withRelativeStartTime: 0,
                               relativeDuration: 0.3) {
                self.scaledImage.transform = CGAffineTransform (scaleX: 0.8, y: 0.8)
            }
                                    UIView.addKeyframe(withRelativeStartTime: 0.3,
                                                       relativeDuration: 0.7) {
                                        photoView.frame.origin.x = 0
                                    }
                                } completion: { _ in
                                    self.scaledImage.image = nextImage
                                    self.scaledImage.transform = .identity
                                    photoView.removeFromSuperview()
                                    self.selectedItem += 1
                                }
        
    }
    @objc func swipeRightAction() {
        guard selectedItem - 1 >= 0 else { return }
        let nextImage = photo [selectedItem - 1]
        let photoView = UIImageView ()
        photoView.backgroundColor = view.backgroundColor
        photoView.contentMode = .scaleAspectFit
        photoView.image = nextImage
        photoView.frame = scaledImage.frame
        photoView.transform = CGAffineTransform (scaleX: 0.8, y: 0.8)
        view.addSubview(photoView)
        view.sendSubviewToBack(photoView)
        
        UIView.animateKeyframes(withDuration: 1,
                                delay: 0,
                                options: []) {
            UIView.addKeyframe(withRelativeStartTime: 0,
                               relativeDuration: 0.7) {
                self.scaledImage.transform = CGAffineTransform (translationX: self.view.bounds.width, y: 0)
            }
                                    UIView.addKeyframe(withRelativeStartTime: 0.7,
                                                       relativeDuration: 0.3) {
                                        photoView.transform = .identity
                                    }
                                } completion: { _ in
                                    self.scaledImage.image = nextImage
                                    self.scaledImage.transform = .identity
                                    photoView.removeFromSuperview()
                                    self.selectedItem -= 1
                                }
    }

    
    

}
