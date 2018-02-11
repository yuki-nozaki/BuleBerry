//
//  ViewController.swift
//  Lean Canvas
//
//  Created by 野崎勇樹 on 2018/01/21.
//  Copyright © 2018年 野崎勇樹. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Buttons
        self.view.addSubview(saveButton())
        self.view.addSubview(cancelButton())
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        self.view.addSubview(remakeView())
        self.view.addSubview(firstView())
        self.view.addSubview(secondUnderView())
        self.view.addSubview(thirdView())
        self.view.addSubview(fourthUnderView())
        self.view.addSubview(fiveView())

        self.view.addSubview(eightView())
        self.view.addSubview(nineView())
        
    }
    
    // Mark- Self.View
    
    // view height:647, width:
    func remakeView() -> UIView {
        let view = UIView()
        let viewOriginX = self.view.frame.width / 10
        let viewOriginY = self.view.frame.height / 100
        let frame = CGRect(x: viewOriginX, y: viewOriginY, width: self.view.frame.width - viewOriginX * 2, height: self.view.frame.height - viewOriginY * 2)
        view.frame = frame
        return view
    }

    // Mark- UpperView
    
    func firstView() -> UIView {
        let fView = UIView()
        fView.frame = CGRect(x: self.remakeView().frame.origin.x, y: self.remakeView().frame.origin.y, width: self.remakeView().frame.width / 5, height: self.remakeView().frame.height * 2 / 3)
        fView.backgroundColor = .red
        fView.addSubview(selectTitle(name: "first", view: fView))
        fView.addSubview(setSentence(view: fView))
        return fView
    }
    
    func secondUnderView() -> UIView {
        let sView = UIView()
        sView.frame = CGRect(x: self.remakeView().frame.origin.x + self.firstView().frame.width, y: self.remakeView().frame.origin.y, width: self.remakeView().frame.width / 5, height: self.remakeView().frame.height * 2 / 3)
        sView.backgroundColor = .clear
        sView.addSubview(secondView())
        sView.addSubview(sixView())
        return sView
    }
    
    func secondView() -> UIView {
        let sView = UIView()
        sView.frame = CGRect(x: (self.remakeView().frame.origin.x + self.firstView().frame.width) / 100, y: self.remakeView().frame.origin.y, width: self.remakeView().frame.width / 5, height: self.remakeView().frame.height / 3)
        sView.backgroundColor = .blue
        sView.addSubview(selectTitle(name: "second", view: sView))
        sView.addSubview(setSentence(view: sView))
        return sView
    }

    func sixView() -> UIView {
        let sView = UIView()
        sView.frame = CGRect(x: (self.remakeView().frame.origin.x + self.firstView().frame.width) / 100, y: self.remakeView().frame.origin.y + self.secondView().frame.height, width: self.remakeView().frame.width / 5, height: self.remakeView().frame.height / 3)
        sView.backgroundColor = .purple
        sView.addSubview(selectTitleCenter(name: "six", view: sView))
        sView.addSubview(setSentenceCenter(view: sView))
        return sView
    }


    func thirdView() -> UIView {
        let tView = UIView()
        tView.frame = CGRect(x: self.secondUnderView().frame.origin.x + self.secondUnderView().frame.width, y: self.remakeView().frame.origin.y, width: self.remakeView().frame.width / 5, height: self.remakeView().frame.height * 2 / 3)
        tView.backgroundColor = .green
        tView.addSubview(selectTitle(name: "third", view: tView))
        tView.addSubview(setSentence(view: tView))
        return tView
    }

    func fourthUnderView() -> UIView {
        let fView = UIView()
        fView.frame = CGRect(x: self.thirdView().frame.origin.x + self.thirdView().frame.width, y: self.remakeView().frame.origin.y, width: self.remakeView().frame.width / 5, height: self.remakeView().frame.height * 2 / 3)
        fView.backgroundColor = .clear
        fView.addSubview(fourthView())
        fView.addSubview(sevenView())
        return fView
    }
    
    func fourthView() -> UIView {
        let fView = UIView()
        fView.frame = CGRect(x: (self.thirdView().frame.origin.x + self.thirdView().frame.width) / 100, y: self.remakeView().frame.origin.y, width: self.remakeView().frame.width / 5, height: self.remakeView().frame.height / 3)
        fView.backgroundColor = .yellow
        fView.addSubview(selectTitle(name: "fourth", view: fView))
        fView.addSubview(setSentence(view: fView))
        return fView
    }

    func sevenView() -> UIView {
        let sView = UIView()
        sView.frame = CGRect(x: (self.thirdView().frame.origin.x + self.thirdView().frame.width) / 100, y: self.remakeView().frame.origin.y + self.fourthView().frame.height, width: self.remakeView().frame.width / 5, height: self.remakeView().frame.height / 3)
        sView.backgroundColor = .gray
        sView.addSubview(selectTitleCenter(name: "seven", view: sView))
        sView.addSubview(setSentenceCenter(view: sView))
        return sView
    }

    func fiveView() -> UIView {
        let fView = UIView()
        fView.frame = CGRect(x: self.fourthUnderView().frame.origin.x + self.fourthUnderView().frame.width, y: self.remakeView().frame.origin.y, width: self.remakeView().frame.width / 5, height: self.remakeView().frame.height * 2 / 3)
        fView.backgroundColor = .orange
        fView.addSubview(selectTitle(name: "five", view: fView))
        fView.addSubview(setSentence(view: fView))
        return fView
    }
    
    // Mark- UnderView
    
    func eightView() -> UIView {
        let eView = UIView()
        eView.frame = CGRect(x: self.remakeView().frame.origin.x, y: self.remakeView().frame.height * 2 / 3, width: self.remakeView().frame.width / 2, height: self.remakeView().frame.height / 3)
        eView.backgroundColor = .magenta
        eView.addSubview(selectTitleUnder(name: "eight", view: eView))
        eView.addSubview(setSentenceUnder(view: eView))
        return eView
    }
    
    func nineView() -> UIView {
        let nView = UIView()
        nView.frame = CGRect(x: self.remakeView().frame.width / 2, y: self.remakeView().frame.height * 2 / 3, width: self.remakeView().frame.width / 2, height: self.remakeView().frame.height / 3)
        nView.backgroundColor = .darkGray
        nView.addSubview(selectTitleUnder(name: "nine", view: nView))
        nView.addSubview(setSentenceUnder(view: nView))
        return nView
    }
    
    // Mark- SupportView
    
    func selectTitle(name: String, view: UIView) -> UITextField {
        let title = UITextField()
        title.delegate = self
        title.frame = CGRect(x: view.frame.origin.x / 100, y: view.frame.origin.y, width: view.frame.width * 4 / 5, height: view.frame.height / 10)
        title.textColor = .black
        title.borderStyle = .roundedRect
        title.clearButtonMode = .always
        title.placeholder = name
        title.clearButtonMode = .whileEditing
        title.returnKeyType = .done
        return title
    }
    
    func setSentence(view: UIView) -> UITextField {
        let sentence = UITextField()
        sentence.delegate = self
        sentence.frame = CGRect(x: view.frame.origin.x / 100, y: view.frame.origin.y + view.frame.height * 3 / 20, width: view.frame.width, height: view.frame.height * 17 / 20)
        sentence.textColor = .black
        sentence.borderStyle = .roundedRect
        sentence.clearButtonMode = .always
        sentence.placeholder = "Input Idea!!!"
        return sentence
    }
    
    func selectTitleCenter(name: String, view: UIView) -> UITextField {
        let title = UITextField()
        title.delegate = self
        title.frame = CGRect(x: view.frame.origin.x / 100, y: view.frame.origin.y / 100, width: view.frame.width * 4 / 5, height: view.frame.height / 10)
        title.textColor = .black
        title.borderStyle = .roundedRect
        title.clearButtonMode = .always
        title.placeholder = name
        title.returnKeyType = .done
        return title
    }
    
    func setSentenceCenter(view: UIView) -> UITextField {
        let sentence = UITextField()
        sentence.delegate = self
        sentence.frame = CGRect(x: view.frame.origin.x / 100, y: view.frame.origin.y / 100 + view.frame.height * 3 / 20, width: view.frame.width, height: view.frame.height * 17 / 20)
        sentence.textColor = .black
        sentence.borderStyle = .roundedRect
        sentence.clearButtonMode = .always
        sentence.placeholder = "Input Idea!!!"
        return sentence
    }

    func selectTitleUnder(name: String, view: UIView) -> UITextField {
        let title = UITextField()
        title.delegate = self
        title.frame = CGRect(x: view.frame.origin.x / 100, y: view.frame.origin.y / 100, width: view.frame.width * 4 / 5, height: view.frame.height / 10)
        title.textColor = .black
        title.borderStyle = .roundedRect
        title.clearButtonMode = .always
        title.placeholder = name
        title.returnKeyType = .done
        return title
    }
    
    func setSentenceUnder(view: UIView) -> UITextField {
        let sentence = UITextField()
        sentence.delegate = self
        sentence.frame = CGRect(x: view.frame.origin.x / 100, y: view.frame.origin.y / 100 + view.frame.height * 3 / 20, width: view.frame.width, height: view.frame.height * 17 / 20)
        sentence.textColor = .black
        sentence.borderStyle = .roundedRect
        sentence.clearButtonMode = .always
        sentence.placeholder = "Input Idea!!!"
        return sentence
    }

    //: Mark- Button
    
    func saveButton() -> UIButton {
        let sButton = UIButton()
        sButton.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.height / 4, width: self.view.frame.width / 10, height: self.view.frame.height / 5)
        sButton.contentMode = .bottomRight
        
        // Normal
        sButton.setTitle("save", for: .normal)
        sButton.setTitleColor(.black, for: .normal)
        
        // Tapped
        sButton.setTitle("save!!!", for: .highlighted)
        sButton.setTitleColor(.red, for: .highlighted)
        
        // selecteor -> getScreenShot
        sButton.addTarget(self, action: #selector(self.saveScreen), for: .touchUpInside)
        return sButton
    }
    
    func cancelButton() -> UIButton {
        let cButton = UIButton()
        cButton.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.height / 2, width: self.view.frame.width / 10, height: self.view.frame.height / 5)
        cButton.contentMode = .bottomRight
        
        // Normal
        cButton.setTitle("erase", for: .normal)
        cButton.setTitleColor(.black, for: .normal)
        
        // Tapped
        cButton.setTitle("erase!!!", for: .highlighted)
        cButton.setTitleColor(.red, for: .highlighted)
        
        // selecteor -> eraseTextContents
        cButton.addTarget(self, action: #selector(self.eraseTextContents), for: .touchUpInside)

        return cButton
    }
    
    //: Mark- ButtonFunction
    private func getScreenShot() -> UIImage {
        let rect = self.view.bounds
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()!
        self.view.layer.render(in: context)
        saveButton().isHidden = true
        let capturedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        return capturedImage
    }
    
    @objc func saveScreen() {
        let image = getScreenShot()
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
    
    @objc func eraseTextContents() {
        let upperViews = [firstView(), secondView(), thirdView(), fourthView(), fiveView()]
        for childView in upperViews {
            setSentence(view: childView).text = ""
            selectTitle(name: "", view: childView).text = ""
        }
        
        let centerViews = [sixView(), secondView()]
        for childView in centerViews {
            setSentenceCenter(view: childView).text = ""
            selectTitleCenter(name: "", view: childView).text = ""
        }
        
        let underViews = [eightView(), nineView()]
        for childView in underViews {
            setSentenceUnder(view: childView).text = ""
            selectTitleUnder(name: "", view: childView).text = ""
        }
    }
}

// Mark: -UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let maxLenght = 200
        guard let text = textField.text else { return true }
        var sentenceLength = text + string
        
        if sentenceLength.count < maxLenght {
            return true
        }
        return false
    }
}
