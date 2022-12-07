//
//  DecoderReport.swift
//  Social Contributor
//
//  Created by Emin Grbo -> @emin_ui
//

import Foundation

/// This method would get any data, and provide you with a more specific info on WHY decode failed.
/// Too often when fetching remote JSON you fail the see the response because something changed in the model.
/// This way, you will have some insight into which key was invalid.
/// I know, there are lots of new lines, but it really gelps you spot the message 😅
func decoderReport<T: Decodable>(data: Data, expecing: T) {
        do {
            let _ = try JSONDecoder().decode(T.self, from: data)
            print("\n\n👍ALL GOOD\n\n")
        } catch  DecodingError.keyNotFound( let  key,  let  context) {
            print("\n\n⛔️FAILED TO DECODE\n\n")
            print("could not find key \(key) in JSON: \(context.debugDescription)")
        } catch  DecodingError.valueNotFound( let  type,  let  context) {
            print("\n\n⛔️FAILED TO DECODE\n\n")
            print("could not find type \(type) in JSON: \(context.debugDescription)")
        } catch  DecodingError.typeMismatch( let  type,  let  context) {
            print("\n\n⛔️FAILED TO DECODE\n\n")
            print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
        } catch  DecodingError.dataCorrupted( let  context) {
            print("\n\n⛔️FAILED TO DECODE\n\n")
            print("data found to be corrupted in JSON: \(context.debugDescription)")
        } catch   let  error  as  NSError {
            print("\n\n⛔️FAILED TO DECODE\n\n")
            print(String(data: data, encoding: String.Encoding.utf8) ??  "NIL")
            print("\n\n —————————— ")
            NSLog("Error in read(from:ofType:) domain = \(error.domain), description= \(error.localizedDescription)")
        }
        return
    }
