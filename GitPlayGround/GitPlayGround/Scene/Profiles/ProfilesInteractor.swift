//
//  ProfilesInteractor.swift
//  GitPlayGround
//
//  Created by Tnk. on 26/8/2562 BE.
//  Copyright (c) 2562 Tnk.. All rights reserved.
//

import UIKit

protocol ProfilesInteractorInterface {
  func doSomething(request: Profiles.Something.Request)
  var model: Entity? { get }
}

class ProfilesInteractor: ProfilesInteractorInterface {
  var presenter: ProfilesPresenterInterface!
  var worker: ProfilesWorker?
  var model: Entity?

  // MARK: - Business logic

  func doSomething(request: Profiles.Something.Request) {
    worker?.doSomeWork { [weak self] in
      if case let Result.success(data) = $0 {
        // If the result was successful, we keep the data so that we can deliver it to another view controller through the router.
        self?.model = data
      }

      // NOTE: Pass the result to the Presenter. This is done by creating a response model with the result from the worker. The response could contain a type like UserResult enum (as declared in the SCB Easy project) with the result as an associated value.
      let response = Profiles.Something.Response()
      self?.presenter.presentSomething(response: response)
    }
  }
}
