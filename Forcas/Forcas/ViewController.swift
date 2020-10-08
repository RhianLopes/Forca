//
//  ViewController.swift
//  Forcas
//
//  Created by Rhian Lopes da Costa on 06/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var chutesLabel: UILabel!
    
    @IBOutlet weak var letraTextField: UITextField!
    
    @IBOutlet weak var bonecoImageView: UIImageView!
    
    @IBOutlet weak var dicaLabel: UILabel!
    
    @IBOutlet weak var palavraMascarada: UILabel!
    
    var jogo: JogoDaForca = JogoDaForca(palavra: "DESNATADO", dica: "MICROFONE", palavraMascarada: "_________")
    
    var indice: Int = 1
    
    @IBAction func textoAlterado(_ sender: Any) {
        letraTextField.text = letraTextField.text?.last?.uppercased()
    }
    
    @IBAction func toqueTecladoPronto(_ sender: Any) {
        if let texto = letraTextField.text {
            jogo.tentativa(letra: texto)
            atualizarTela()
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        atualizarTela()
    }
    
}

extension ViewController {
    
    private func atualizarTela() {
        dicaLabel.text = "A dica é: \(jogo.dica)"
        palavraMascarada.attributedText = jogo.palavraMascarada.espacada
        chutesLabel.attributedText = jogo.tentativasAnteriores.joined().espacada
        atualizarImagem()
    }
    
    private func atualizarImagem() {
        let imagem: UIImage?
        if jogo.derrota {
            imagem = UIImage(named: "bonecao_completo_e_mortinho")
        } else if jogo.erros == 0 {
            imagem = nil
        } else {
            imagem = UIImage(named: "bonecao_fase_\(jogo.erros)")
        }
        
        UIView.transition(
            with: bonecoImageView,
            duration: 0.1,
            options: .transitionCrossDissolve,
            animations: {
                self.bonecoImageView.image = imagem
                
            },
            completion: nil)
    }
}
