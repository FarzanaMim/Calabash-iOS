//
//  ViewController.swift
//  RxSwift-Login
//
//  Created by iMeraj-MacbookPro on 10/26/16.
//  Copyright © 2016 Sekai Lab BD. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
 
    let minimalUsernameLength = 5
    let minimalPasswordLength = 5

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var doSomething: UIButton!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let isUsernameValid = username.rx_text
            .map { $0.characters.count >= self.minimalUsernameLength }
            .shareReplay(1)
        
        let isPasswordValid = password.rx_text
            .map { $0.characters.count >= self.minimalPasswordLength }
            .shareReplay(1)
        
//        let everythingValid = Observable.combineLatest(isUsernameValid, isPasswordValid) { $0 && $1 }
//            .shareReplay(1)
        
//        isUsernameValid
//            .bindTo(password.rx_enabled)
//            .addDisposableTo(disposeBag)
//        
//        everythingValid
//            .bindTo(doSomething.rx_enabled)
//            .addDisposableTo(disposeBag)
        
        doSomething.rx_tap
            .subscribe(onNext: { [weak self] in self?.showAlert() })
            .addDisposableTo(disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showAlert() {
        let alertView = UIAlertView(
            title: "RxSwift-Login",
            message: "Stay Tuned!",
            delegate: nil,
            cancelButtonTitle: "OK"
        )
        
        alertView.show()
    }
}

