//
//  ProfilesViewController.swift
//  GitPlayGround
//
//  Created by Tnk. on 26/8/2562 BE.
//  Copyright (c) 2562 Tnk.. All rights reserved.
//

import UIKit

protocol ProfilesViewControllerInterface: class {
  func displaySomething(viewModel: Profiles.Something.ViewModel)
}

class ProfilesViewController: UIViewController, ProfilesViewControllerInterface {
  var interactor: ProfilesInteractorInterface!
  var router: ProfilesRouter!

  // MARK: - Object lifecycle

  override func awakeFromNib() {
    super.awakeFromNib()
    configure(viewController: self)
  }

  // MARK: - Configuration

  private func configure(viewController: ProfilesViewController) {
    let router = ProfilesRouter()
    router.viewController = viewController

    let presenter = ProfilesPresenter()
    presenter.viewController = viewController

    let interactor = ProfilesInteractor()
    interactor.presenter = presenter
    interactor.worker = ProfilesWorker(store: ProfilesStore())

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

    let request = Profiles.Something.Request()
    interactor.doSomething(request: request)
  }

  // MARK: - Display logic

  func displaySomething(viewModel: Profiles.Something.ViewModel) {
    // NOTE: Display the result from the Presenter

    // nameTextField.text = viewModel.name
  }

  // MARK: - Router

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    router.passDataToNextScene(segue: segue)
  }

  @IBAction func unwindToProfilesViewController(from segue: UIStoryboardSegue) {
    print("unwind...")
    router.passDataToNextScene(segue: segue)
  }
}
