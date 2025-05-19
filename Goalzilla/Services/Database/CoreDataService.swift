//
//  CoreDataService.swift
//  Goalzilla
//
//  Created by Khaled Mustafa on 19/05/2025.
//

import CoreData

/// A singleton service class that encapsulates the Core Data stack setup and management
/// for the Goalzilla app.
///
/// This class provides a centralized interface for accessing the Core Data persistent container,
/// its managed object context, and saving changes to the persistent store.
///
/// Usage:
/// - Access the shared instance via `CoreDataService.shared`
/// - Use `context` to perform fetch, insert, delete, and update operations on managed objects.
/// - Call `saveContext()` to persist any changes made in the managed object context.
///
/// The persistent container is lazily initialized with the Core Data model named "Goalzilla".
/// If there is an error loading the persistent store or saving context, the app will terminate
/// with a fatal error, which helps catch configuration issues early during development.
final class CoreDataService {
    
    /// Private initializer to enforce singleton pattern.
    private init() {}
    
    /// The shared singleton instance of `CoreDataService`.
    static let shared = CoreDataService()
    
    /// The main managed object context associated with the persistent container.
    /// Use this context for most Core Data operations on the main thread.
    lazy var context = persistentContainer.viewContext
    
    /// The persistent container that encapsulates the Core Data stack,
    /// including the managed object model, persistent store coordinator,
    /// and the underlying persistent store.
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Goalzilla")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // In a production app, handle this more gracefully.
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    /// Saves any changes in the managed object context to the persistent store.
    ///
    /// If the context has any changes, this method attempts to commit them.
    /// If an error occurs during saving, the app will terminate with a fatal error.
    ///
    /// Call this method after creating, updating, or deleting managed objects
    /// to persist the changes permanently.
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                // In a production app, handle this more gracefully.
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
