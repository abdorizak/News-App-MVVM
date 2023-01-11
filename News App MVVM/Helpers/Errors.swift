//
//  Errors.swift
//  News App MVVM
//
//  Created by Abdirizak Hassan on 1/8/23.
//

import Foundation

enum AppError: String, Error {
    case httpResponse = "False"
    case invalidURL = "HEYYY!!! Give me a valid URL"
    case invalidUsernameOrPassword = "invalid Username and Password. please try again.."
    case invalidPin = "Please Enter Valid Pin.."
    case invalidCredentials = "please check that you have used the correct email and password"
    case unableTopComplete = "Unable to complete you request. Please check your Internet connection.."
    case invalidResponse = "Invalid response from the server. please try again."
    case inValidData = "the data recevied from the server was Invalid. please try again."
    case decodingError = "Response could not be decoded"
    case unableToFavorite = "There was an error favoriting this user. Please Try again."
    case alreadyInFavorite = "You've already Favorite this user. You must really like them!"
    case NotFound = "Not Found"
    case somethingWrong = "HEYYY!!!! Something Wrong."
}
