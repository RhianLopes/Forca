//
//  ViewController.swift
//  Forcas
//
//  Created by Rhian Lopes da Costa on 06/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    var jogo: JogoDaForca = JogoDaForca.aleatorio()
    
    @IBOutlet weak var chutesLabel: UILabel!
    @IBOutlet weak var letraTextField: UITextField!
    @IBOutlet weak var bonecoImageView: UIImageView!
    @IBOutlet weak var dicaLabel: UILabel!
    @IBOutlet weak var palavraMascarada: UILabel!
    
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
        novoJogo()
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
        chutesLabel.attributedText = formatarChutesAnteriores()
        letraTextField.text = ""
        atualizarImagem()
        if jogo.derrota {
            avisarPerdedor()
        } else if jogo.vitoria {
            avisarVencedor()
        }
    }
    
    private func formatarChutesAnteriores() -> NSAttributedString {
        jogo.tentativasAnteriores.reduce(NSMutableAttributedString()) { (texto, letra) in
            if jogo.palavra.contains(letra) {
                texto.append(letra.corVerde)
            } else {
                texto.append(letra.corVermelho)
            }
            return texto
        }.espacada
    }
    
    private func avisarPerdedor() {
        let alerta = UIAlertController(title: "Que pena, você errou!", message: "Pensa mais, o cavalo", preferredStyle: .alert)
        alerta.addAction(acao)
        present(alerta, animated: true, completion: nil)
    }
    
    var acao: UIAlertAction { UIAlertAction(title: "Jogar novamente", style: .default) { _ in
            self.novoJogo()
        }
    }
    
    private func novoJogo() {
        jogo = JogoDaForca.aleatorio()
        atualizarTela()
    }
    
    private func avisarVencedor() {
        let alerta = UIAlertController(title: "Maoe!", message: "Parabéns, você ganhou!", preferredStyle: .alert)
        alerta.addAction(acao)
        present(alerta, animated: true, completion: nil)
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
