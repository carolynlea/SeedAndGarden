//
//  SeedController.swift
//  SeedsAndPlants
//
//  Created by Carolyn Lea on 10/29/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import Foundation
import CoreData

class SeedController
{
    var seed: Seed?
    var seeds: [Seed]
    {
        return loadFromCoreData()
    }
    
    func saveToCoreData(context: NSManagedObjectContext)
    {
        context.performAndWait {
            
            let moc = CoreDataStack.shared.mainContext
            
            do
            {
                try moc.save()
                
            }
            catch
            {
                NSLog("There was an error while saving managed object context: \(error)")
            }
            
        }
    }
    
    func loadFromCoreData() -> [Seed]
    {
        let fetchRequest: NSFetchRequest<Seed> = Seed.fetchRequest()
        let moc = CoreDataStack.shared.mainContext
        
        do
        {
            return try moc.fetch(fetchRequest)
        }
        catch
        {
            NSLog("There was an error while fetching Calories: \(error)")
            return []
        }
    }
    
    func createSeed(name: String,
                    variety: String,
                    description: String,
                    seedImage: Data,
                    sunPreference: String,
                    plantType: String,
                    plantingDepth: String,
                    plantSpacing: String,
                    plantHeight: String,
                    plantWidth: String,
                    bestZones: String,
                    waterPreference: String,
                    climatePreference: String,
                    soilPreference: String,
                    seedBrand: String,
                    latinName: String,
                    purchaseFrom: String,
                    bestByDate: String,
                    purchaseDate: String,
                    numberOfPackages: String,
                    purchasePrice: String,
                    packageSize: String,
                    notes: String,
                    plantCategory: String,
                    context: NSManagedObjectContext)
    {
        let _ = Seed(seedName: name, seedVariety: variety, seedDescription: description, seedImage: seedImage, sunPreference: sunPreference, plantType: plantType, plantingDepth: plantingDepth, plantSpacing: plantSpacing, plantHeight: plantHeight, plantWidth: plantWidth, bestZones: bestZones, waterPreference: waterPreference, climatePreference: climatePreference, soilPreference: soilPreference, seedBrand: seedBrand, latinName: latinName, purchasedFrom: purchaseFrom, bestByDate: bestByDate, purchaseDate: purchaseDate, numberOfPackages: numberOfPackages, purchasePrice:purchasePrice, packageSize: packageSize, seedNotes: notes, plantCategory: plantCategory)
        
        saveToCoreData(context: context)
        
        if let seed = seed
        {
            print(seed)
        }
    }
    
    func updateSeed(seed: Seed,
                    name: String,
                    variety: String,
                    description: String,
                    seedImage: Data,
                    sunPreference: String,
                    plantType: String,
                    plantingDepth: String,
                    plantSpacing: String,
                    plantHeight: String,
                    plantWidth: String,
                    bestZones: String,
                    waterPreference: String,
                    climatePreference: String,
                    soilPreference: String,
                    seedBrand: String,
                    latinName: String,
                    purchaseFrom: String,
                    bestByDate: String,
                    purchaseDate: String,
                    numberOfPackages: String,
                    purchasePrice: String,
                    packageSize: String,
                    notes: String,
                    plantCategory: String,
                    timestamp: Date = Date(),
                    context: NSManagedObjectContext)
    {
        let seed = seed
        seed.seedName = name
        seed.seedVariety = variety
        seed.seedDescription = description
        seed.seedImage = seedImage
        seed.sunPreference = sunPreference
        seed.plantType = plantType
        seed.plantingDepth = plantingDepth
        seed.plantSpacing = plantSpacing
        seed.plantHeight = plantHeight
        seed.plantWidth = plantWidth
        seed.bestZones = bestZones
        seed.waterPreference = waterPreference
        seed.climatePreference = climatePreference
        seed.soilPreference = soilPreference
        seed.seedBrand = seedBrand
        seed.latinName = latinName
        seed.purchaseFrom = purchaseFrom
        seed.bestByDate = bestByDate
        seed.purchaseDate = purchaseDate
        seed.numberOfPackages = numberOfPackages
        seed.purchasePrice = purchasePrice
        seed.packageSize = packageSize
        seed.seedNotes = notes
        seed.plantCategory = plantCategory
        seed.timestamp = timestamp
        
        saveToCoreData(context: context)
        print(seed)
    }
    
    func deleteSeed(seed: Seed, context: NSManagedObjectContext)
    {
        context.performAndWait {
            let moc = CoreDataStack.shared.mainContext
            moc.delete(seed)
            
            do
            {
                try moc.save()
            }
            catch
            {
                moc.reset()
                NSLog("There was an error while saving managed object context: \(error)")
            }
        }
    }
}
