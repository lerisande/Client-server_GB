//
//  CustomSegue.swift
//  Vkontakte
//
//  Created by Lera on 02.08.21.
//

import UIKit

class CustomSegue: UIStoryboardSegue {
    
    override func perform() { // вызывается во время осуществления перехода
        // получаем источник для нашего перехода
        guard let containerView = source.view.superview else { return }
        // запоминаем размер экрана нашего источника
        let containerViewFrame = containerView.frame
        // указываем цель, куда наш источник должен отъехать после запуска анимациии
        let sourceViewTargetFrame = CGRect(x: -containerViewFrame.width, // по x уезжает влево
                                           y: -containerViewFrame.height, // по y перемещается вверх
                                           width: source.view.frame.width,
                                           height: source.view.frame.height)
        // пункт назначения конечного контроллера
        let destinationViewTargetFrame = source.view.frame
        // на наш контейнер добавляем вью нашего конечного контроллера
        containerView.addSubview(destination.view)
        // задаем фрейм конечного контроллера
        destination.view.frame = CGRect(x: containerViewFrame.width, // задаем начальную точку в углу экрана
                                        y: containerViewFrame.height,
                                        width: source.view.frame.width,
                                        height: source.view.frame.height)

        
        UIView
            .animate(withDuration: 3,
                     animations: {
                      self.source.view.frame = sourceViewTargetFrame // помещаем source в таргет и меняем фрейм
                      self.destination.view.frame = destinationViewTargetFrame // помещаем destination в таргет
            }) { finished in  // по окончании анимации выполняем переход без анимации
                self.source.present(self.destination, // презентуй конечный контроллер
                                    animated: false,
                                    completion: nil)
        }
    }
    
}
