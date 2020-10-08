//
//  ViewController.swift
//  Forcas
//
//  Created by Rhian Lopes da Costa on 06/10/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var chutesLabel: UILabel!
    
    @IBOutlet weak var letraTextField: UITextField!
    
    @IBOutlet weak var bonecoImageView: UIImageView!
    
    var indice: Int = 1
    
    @IBAction func textoAlterado(_ sender: Any) {
        letraTextField.text = letraTextField.text?.last?.uppercased()
    }
    
    @IBAction func toqueTecladoPronto(_ sender: Any) {
        if let texto = letraTextField.text {
            chutesLabel.text?.append(texto)
        }
    }
    
    @IBAction func toqueBotaoRecomecar(_ sender: Any) {
        indice += 1
        
        UIView.transition(
            with: bonecoImageView,
            duration: 0.1,
            options: .transitionCrossDissolve,
            animations: {
                self.bonecoImageView.image = UIImage(named: "bonecao_fase_\(self.indice)")
            },
            completion: nil)
        
        
        if indice == 5 {
            indice = 0
        }
    }
    
}

