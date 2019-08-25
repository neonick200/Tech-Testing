//
//  DiaryViewController.swift
//  GitPlayGround
//
//  Created by Tnk. on 25/8/2562 BE.
//  Copyright (c) 2562 Tnk.. All rights reserved.
//

import UIKit

protocol DiaryViewControllerInterface: class {
  func displaySomething(viewModel: Diary.Something.ViewModel)
}

class DiaryViewController: UIViewController, DiaryViewControllerInterface {
  var interactor: DiaryInteractorInterface!
  var router: DiaryRouter!

  // MARK: - Object lifecycle

  override func awakeFromNib() {
    super.awakeFromNib()
    configure(viewController: self)
  }

  // MARK: - Configuration

  private func configure(viewController: DiaryViewController) {
    let router = DiaryRouter()
    router.viewController = viewController

    let presenter = DiaryPresenter()
    presenter.viewController = viewController

    let interactor = DiaryInteractor()
    interactor.presenter = presenter
    interactor.worker = DiaryWorker(store: DiaryStore())

    viewController.interactor = interactor
    viewController.router = router
  }

  // MARK: - View lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    doSomethingOnLoad()
  }

  // MARK: - Event handling

  func doSomethingOnLoad() {
    // NOTE: Ask the Interactor to do some work

    let request = Diary.Something.Request()
    interactor.doSomething(request: request)
  }

  // MARK: - Display logic

  func displaySomething(viewModel: Diary.Something.ViewModel) {
    // NOTE: Display the result from the Presenter

    // nameTextField.text = viewModel.name
  }

  // MARK: - Router

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    router.passDataToNextScene(segue: segue)
  }

  @IBAction func unwindToDiaryViewController(from segue: UIStoryboardSegue) {
    print("unwind...")
    router.passDataToNextScene(segue: segue)
  }
}
