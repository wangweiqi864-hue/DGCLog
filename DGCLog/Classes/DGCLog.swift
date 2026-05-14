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
    
    private let logger = SwiftyBeaver.self
    private let consoleDestination = ConsoleDestination()
    private let fileDestination = FileDestination()
    
    private let relativeLogDirectoryPath = "DGCLog/logs"
    private var logFilePath = ""
    
    private init() { configureLogger() }
    
    private func configureLogger() {
        
        let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? ""
        let logDirectoryPath = (documentDirectoryPath as NSString).appendingPathComponent(relativeLogDirectoryPath)
        logFilePath = (logDirectoryPath as NSString).appendingPathComponent("log")
        
//        logFilePath = dir.appending(logFilePath)
        
        // 默认swiftybeaver.log文件日志
        fileDestination.logFileAmount = 4
        fileDestination.logFileURL = URL(fileURLWithPath: logFilePath)
        fileDestination.format = "$D YYYY:MM:dd HH:mm:ss$d $L: $M"
        
        // Xcode控制台日志
        consoleDestination.format = "$D YYYY:MM:dd HH:mm:ss$d $L: $M"

        //添加配置到SwiftyBeaver
        logger.addDestination(consoleDestination)
        logger.addDestination(fileDestination)
    }
    
    public static func debug<T>(_ message: T, file: String = #file, function: String = #function, line: Int = #line) {
        autoreleasepool {
            let sourceFileName = (file as NSString).lastPathComponent
            let logMessage = "file=\(sourceFileName)::\(message)"
            self.shared.logger.debug(logMessage)
        }
    }
    
    
    public static func info<T>(_ message: T, file: String = #file, function: String = #function, line: Int = #line) {
        autoreleasepool {
            let sourceFileName = (file as NSString).lastPathComponent
            let logMessage = "file=\(sourceFileName)::\(message)"
            self.shared.logger.info(logMessage)
        }
    }

    
    public static func error<T>(_ message: T, file: String = #file, function: String = #function, line: Int = #line) {
        autoreleasepool {
            let sourceFileName = (file as NSString).lastPathComponent
            let logMessage = "file=\(sourceFileName)::\(message)"
            self.shared.logger.error(logMessage)
        }
    }
    
    // 打印的debu
    public static func log<T>(_ message: T, file: String = #file) {
        autoreleasepool {
            let sourceFileName = (file as NSString).lastPathComponent
            let logMessage = "file=\(sourceFileName)::\(message)"
            self.shared.logger.debug(logMessage)
        }
    }
    
}
