//
//  DGCLog.swift
//  Pods
//
//  Created by Pi0007 on 2026/2/21.
//

import Foundation
import SwiftyBeaver

public class DGCLog{
    
    private static let shared = DGCLog()
    
    private let dgc_logger = SwiftyBeaver.self
    private let dgc_consoleDestination = ConsoleDestination()
    private let dgc_fileDestination = FileDestination()
    
    private let dgc_relativeLogDirectoryPath = "DGCLog/logs"
    private var dgc_logFilePath = ""
    
    private init() { dgc_configureLogger() }
    
    private func dgc_configureLogger() {
        
        let dgc_documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? ""
        let dgc_logDirectoryPath = (dgc_documentDirectoryPath as NSString).appendingPathComponent(dgc_relativeLogDirectoryPath)
        dgc_logFilePath = (dgc_logDirectoryPath as NSString).appendingPathComponent("log")
        
//        dgc_logFilePath = dir.appending(dgc_logFilePath)
        
        // 默认swiftybeaver.log文件日志
        dgc_fileDestination.logFileAmount = 4
        dgc_fileDestination.logFileURL = URL(fileURLWithPath: dgc_logFilePath)
        dgc_fileDestination.format = "$D YYYY:MM:dd HH:mm:ss$d $L: $M"
        
        // Xcode控制台日志
        dgc_consoleDestination.format = "$D YYYY:MM:dd HH:mm:ss$d $L: $M"

        //添加配置到SwiftyBeaver
        dgc_logger.addDestination(dgc_consoleDestination)
        dgc_logger.addDestination(dgc_fileDestination)
    }
    
    public static func debug<T>(_ message: T, file: String = #file, function: String = #function, line: Int = #line) {
        autoreleasepool {
            let dgc_sourceFileName = (file as NSString).lastPathComponent
            let dgc_logMessage = "file=\(dgc_sourceFileName)::\(message)"
            self.shared.dgc_logger.debug(dgc_logMessage)
        }
    }
    
    
    public static func info<T>(_ message: T, file: String = #file, function: String = #function, line: Int = #line) {
        autoreleasepool {
            let dgc_sourceFileName = (file as NSString).lastPathComponent
            let dgc_logMessage = "file=\(dgc_sourceFileName)::\(message)"
            self.shared.dgc_logger.info(dgc_logMessage)
        }
    }

    
    public static func error<T>(_ message: T, file: String = #file, function: String = #function, line: Int = #line) {
        autoreleasepool {
            let dgc_sourceFileName = (file as NSString).lastPathComponent
            let dgc_logMessage = "file=\(dgc_sourceFileName)::\(message)"
            self.shared.dgc_logger.error(dgc_logMessage)
        }
    }
    
    // 打印的debu
    public static func log<T>(_ message: T, file: String = #file) {
        autoreleasepool {
            let dgc_sourceFileName = (file as NSString).lastPathComponent
            let dgc_logMessage = "file=\(dgc_sourceFileName)::\(message)"
            self.shared.dgc_logger.debug(dgc_logMessage)
        }
    }
    
}
