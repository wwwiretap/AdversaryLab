//
//  RedisServerController.swift
//  AdversaryLabSwift
//
//  Created by Adelita Schule on 4/5/18.
//  Copyright © 2018 Operator Foundation. All rights reserved.
//

import Foundation
import Auburn

class RedisServerController: NSObject
{
    static let sharedInstance = RedisServerController()
    
    var redisProcess:Process!
    
    func launchRedisServer(completion:@escaping (_ completion:Bool) -> Void)
    {
        isRedisServerRunning
        {
            (serverIsRunning) in
            
            if serverIsRunning
            {
                completion(false)
                return
            }
            else
            {
                let bundle = Bundle.main
                
                guard let redisConfigPath = bundle.path(forResource: "redis", ofType: "conf")
                    else
                {
                    print("Unable to launch Redis server: could not find terraform executable.")
                    completion(false)
                    return
                }
                
                guard let redisPath = bundle.path(forResource: "redis-server", ofType: nil)
                    else
                {
                    print("Unable to launch Redis server: could not find terraform executable.")
                    completion(false)
                    return
                }
                
                guard let redisModulePath = bundle.path(forResource: "subsequences", ofType: "so")
                    else
                {
                    print("Unable to launch Redis server: could not find the needed module.")
                    completion(false)
                    return
                }
                
                guard let path = bundle.path(forResource: "LaunchRedisServerScript", ofType: "sh")
                    else
                {
                    print("Unable to launch Redis server. Could not find the script.")
                    completion(false)
                    return
                }
                
                print("\n👇👇 Running Script 👇👇:\n")
                
                self.runRedisScript(path: path, arguments: [redisPath, redisConfigPath, redisModulePath])
                {
                    (hasCompleted) in
                    
                    print("\n🚀 Launch Redis Server Script Complete 🚀")
                    completion(hasCompleted)
                }
            }
        }
    }
    
    func shutdownRedisServer()
    {
        if redisProcess != nil
        {
            if redisProcess.isRunning
            {
                redisProcess.terminate()
            }
        }
        
        guard let path = Bundle.main.path(forResource: "ShutdownRedisServerScript", ofType: "sh")
        else
        {
            print("Unable to shutdown Redis server. Could not find the script.")
            return
        }
        
        guard let redisPath = Bundle.main.path(forResource: "redis-cli", ofType: nil)
            else
        {
            print("Unable to launch Redis server. Could not find terraform executable.")
            return
        }
        
        print("\n👇👇 Running Script 👇👇:\n")
        
        runRedisScript(path: path, arguments: [redisPath])
        {
            (taskCompleted) in
            
            print("Server has been 🤖 TERMINATED 🤖")
        }        
    }
    
    func isRedisServerRunning(completion:@escaping (_ completion:Bool) -> Void)
    {
        guard let redisCliPath = Bundle.main.path(forResource: "redis-cli", ofType: nil)
            else
        {
            print("Unable to ping Redis server. Could not find terraform executable.")
            completion(false)
            return
        }
        guard let path = Bundle.main.path(forResource: "CheckRedisServerScript", ofType: "sh")
            else
        {
            print("Unable to ping Redis server. Could not find the script.")
            completion(false)
            return
        }
        
        let process = Process()
        process.launchPath = path
        process.arguments = [redisCliPath]
        let pipe = Pipe()
        process.standardOutput = pipe
        process.terminationHandler =
        {
            (task) in
            
            // Get the data
            let data = pipe.fileHandleForReading.readDataToEndOfFile()
            let output = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
            
            print(output ?? "no output")
            
            if output == "PONG\n"
            {
                print("\nWe received a pong, server is already running!!")
                completion(true)
            }
            else
            {
                print("\nNo Pong, launch the server!!")
                completion(false)
            }
        }
        process.waitUntilExit()
        process.launch()
    }
    
    // Redis considers switching databases to be switching between numbered partitions within the same db file.
    // We will be switching instead to a database represented by a completely different file.
    func switchDatabaseFile(withFile fileURL: URL, completion:@escaping (_ completion:Bool) -> Void)
    {
        let fileManager = FileManager.default
        let currentDirectory = fileManager.currentDirectoryPath
        let newDBName = fileURL.lastPathComponent
        let destinationURL = URL(fileURLWithPath: currentDirectory).appendingPathComponent(newDBName)
        
        // Rewrite redis.conf to use the dbfilename for the name of the new .rdb file
        // Setting the dbFilename calls config rewrite with the new name in Redis
        Auburn.dbfilename = newDBName
        NotificationCenter.default.post(name: .updateDBFilename, object: nil)
        
        // Issue a SHUTDOWN command to the Redis server
        Auburn.shutdownRedis()
        //Auburn.restartRedis()
        
        // Copy the .rdb file into the Redis working directory, as specified in redis.conf (defaults to ./, which is the directory the Redis server was run from)
        /*
        # The working directory.
        #
        # The DB will be written inside this directory, with the filename specified
        # above using the 'dbfilename' configuration directive.
        #
        # The Append Only File will also be created inside this directory.
        #
        # Note that you must specify a directory here, not a file name.
         dir ./
         */

        do
        {
            if fileManager.fileExists(atPath: destinationURL.path)
            {
                try fileManager.removeItem(at: destinationURL)
            }
            
            try fileManager.copyItem(at: fileURL, to: destinationURL)
            
            print("\n📂  Copied file from: \n\(fileURL)\nto:\n\(destinationURL)\n")
            // Start Redis
            launchRedisServer
            {
                (success) in
                
                completion(success)
            }
        }
        catch let copyError
        {
            print("\nError copying redis DB file from \(fileURL) to \(currentDirectory):\n\(copyError)")
            // Start Redis
            launchRedisServer
            {
                (success) in
                
                completion(success)
            }
            
            // Reset dbfilename to the default as we failed to copy the new file over
            Auburn.dbfilename = "dump.rdb"
        }

        
    }
    
    func runRedisScript(path: String, arguments: [String]?, completion:@escaping (_ completion:Bool) -> Void)
    {
        let processQueue = DispatchQueue.global(qos: .background)
        processQueue.async
        {
            print("🚀🚀🚀🚀🚀🚀🚀")
            self.redisProcess = Process()
            self.redisProcess.launchPath = path
            
            if let arguments = arguments
            {
                self.redisProcess.arguments = arguments
            }
            
            self.redisProcess.terminationHandler =
            {
                (task) in
                
                //Main Thread Stuff Here If Needed
                DispatchQueue.main.async(execute:
                {
                    print("Redis Script Has Terminated.")
                    completion(true)
                })
            }
            self.redisProcess.launch()
        }
    }
}

