//
//  ProfilesStore.swift
//  GitPlayGround
//
//  Created by Tnk. on 26/8/2562 BE.
//  Copyright (c) 2562 Tnk.. All rights reserved.
//

import Foundation

/*

 The ProfilesStore class implements the ProfilesStoreProtocol.

 The source for the data could be a database, cache, or a web service.

 You may remove these comments from the file.

 */

class ProfilesStore: ProfilesStoreProtocol {
  func getData(_ completion: @escaping (Result<Entity>) -> Void) {
    // Simulates an asynchronous background thread that calls back on the main thread after 2 seconds
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
      completion(Result.success(Entity()))
    }
  }
}
