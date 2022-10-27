//
//  ViewController.swift
//  Alert
//
//  Created by 이조은 on 2022/10/20.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func touchUpShowAlertButton(_ snder: UIButton) {
    self.showAlertController(style: .alert)
  }

  @IBAction func touchUpShowActionSheetButton(_ snder: UIButton) {
    self.showAlertController(style: .actionSheet)
  }

  func showAlertController(style: UIAlertController.Style) {
    let alertController: UIAlertController
    alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: style)

    let okAction: UIAlertAction
    okAction = UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction) in
        print("OK pressed")
    })

    let cancelAction: UIAlertAction
    cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

    alertController.addAction(okAction)
    alertController.addAction(cancelAction)
      
    let handler: (UIAlertAction) -> Void
    handler = { (action: UIAlertAction) in
        print("action pressed \(action.title ?? "")")
    }
    
    let someAction: UIAlertAction
    someAction = UIAlertAction(title: "Some", style:
                                UIAlertAction.Style.destructive, handler: handler)
      
    let anotherAction: UIAlertAction
    anotherAction = UIAlertAction(title: "Another", style:
                                    UIAlertAction.Style.default, handler: handler)
      
    alertController.addAction(someAction)
    alertController.addAction(anotherAction)
      
    alertController.addTextField { (field: UITextField) in
        field.placeholder = "플레이스 홀더"
        field.textColor = UIColor.red
    }

    self.present(alertController, animated: true, completion: {
      print("Alert controller shown")
    })

  }

}

