import Foundation
import CoreData

//class ViewController: UIViewController
//{
//    let appDelegate = NSApplication.shared().delegate as! AppDelegate
//    let managedObjectContext = appDelegate.managedObjectContext
//   // var managedObjectContext
//
//    let article = NSEntityDescription.insertNewObjectForEntityForName("Article", inManagedObjectContext: managedObjectContext) as! Article
//
//   // let article = NSEntityDescription.entityForName("Article", inManagedObjectContext: self.managedObjectContext)
//  //  let articleManager = ArticleManager()
//
//        override func viewDidLoad()
//        {
//
//            //let firstName = "Trevor"
//           // fetchRequest.predicate = NSPredicate(format: "firstName == %@", firstName)
//
//            func newArticle(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
//            {
//                let entityDescription = NSEntityDescription.entityForName("Article", inManagedObjectContext: self.managedObjectContext)
//                let managedObject = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
//
//                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
//                let results = try self.managedObjectContext.executeFetchRequest(fetchRequest)
//                for result in results as! [NSManagedObject] {
//                    print("name - \(result.valueForKey("name")!)")
//            }
//
//           //withLang lang: String
//           func getAllArticles(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
//           {
//                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
//                    do {
//                        let results = try self.managedObjectContext.executeFetchRequest(fetchRequest)
//                        for result in results as! [NSManagedObject] {
//                            print("name - \(result.valueForKey("name")!)")
//                        }
//                } catch {
//                    print(error)
//                }
//
//                return true
//                }
//            }
//
//
//            //lang: String
//            func getArticles (application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
//            {
//                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Customer")
//                do {
//                    let results = try self.managedObjectContext.executeFetchRequest(fetchRequest)
//                    for result in results as! [NSManagedObject] {
//                        print("name - \(result.valueForKey("name")!)")
//                    }
//                } catch {
//                    print(error)
//                }
//
//                //return true
//                }
//            }
//
//
//            func removeArticle(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
//            {
//
//            }
//
//
//    //function to save my data
//            func saveContext(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
//            {
//                if managedObjectContext.hasChanges {
//                    do {
//                        try managedObjectContext.save()
//                    } catch {
//                        let nserror = error as NSError
//                        NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
//                        abort()
//                    }
//                }
//            }
//
//}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
public class ArticleManager
{
    public var managedObjectContext: NSManagedObjectContext
    
//    var bundle: Bundle;
    var mom :NSManagedObjectModel
    
    public init()
    {
       // bundle = Bundle(for: Person.self)
        guard let urll = Bundle.main.url(forResource: "CoreDataProject", withExtension: "momd") else {
            fatalError("Error loading model from bundle")
        }
        mom = NSManagedObjectModel(contentsOf: urll)!
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
        managedObjectContext = NSManagedObjectContext(concurrencyType:.mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = psc
        
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docURL = urls[urls.endIndex-1]
        let storeURL = docURL.appendingPathComponent("CoreDataProject.xcdatamodeld")
        do {
            try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
        } catch {
            print("Error migrating store: \(error)")
        }
    }
    
    public func newArticle(_ name:String, _ age:Decimal) -> Person
    {
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: managedObjectContext)
        let person = NSManagedObject(entity: entity!,insertInto: managedObjectContext)
        //let art = Article()
        
        
        person.setValue(name, forKey: "name")
        person.setValue(age, forKey: "age")

        return person as! Person
    }
    
    public func getAllArticles() -> [Person]
    {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "Person", in: self.managedObjectContext)
        
        // Configure Fetch Request
        fetchRequest.entity = entityDescription
        
        do {
            let result = try self.managedObjectContext.fetch(fetchRequest)
            return (result as? [Person])!
            
        } catch {
            return []
        }
    }
    
    public func getArticles(withLang lang : String) -> [Person]
    {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        
        let predicate = NSPredicate(format: "%K == %@", "lang", lang)
        fetchRequest.predicate = predicate
        
        // Execute Fetch Request
        do {
            let result = try self.managedObjectContext.fetch(fetchRequest)
            return (result as? [Person])!
            
        } catch {
            _ = error as NSError
            return []
        }
    }
    
    public func getArticles(containString str : String) -> [Person]
    {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        
        // Create Predicate
        let predicate = NSPredicate(format: "content CONTAINS %@ OR title CONTAINS %@", str)
        fetchRequest.predicate = predicate
        
        // Execute Fetch Request
        do {
            let result = try self.managedObjectContext.fetch(fetchRequest)
            return (result as? [Person])!
            
        } catch {
            _ = error as NSError
            return []
        }
        
    }
    
    public func removeArticle(article : Person)
    {
        managedObjectContext.delete(article)
    }
    
    public func save()
    {
        do {
            try managedObjectContext.save()
        }
        catch {
            print("Error save()")
        }
    }
    
}

//import Foundation
//import CoreData
//
//public class ArticleManager: NSObject {
//    public var managedObjectContext: NSManagedObjectContext
//    
//    public override init() {
//        guard let modelURL = Bundle(forClass: Person.self).url(forResource: "CoreDataProject", withExtension:"momd") else {
//            fatalError("Error loading model from bundle")
//        }
//        guard let mom = NSManagedObjectModel(contentsOfURL: modelURL) else {
//            fatalError("Error initializing mom from: \(modelURL)")
//        }
//        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
//        managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
//        managedObjectContext.persistentStoreCoordinator = psc
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
//            let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
//            let docURL = urls[urls.endIndex-1]
//            let storeURL = docURL.URLByAppendingPathComponent("luccasim2016.sqlite")
//            do {
//                try psc.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: nil)
//                print("Ok")
//            } catch {
//                fatalError("Error migrating store: \(error)")
//            }
//        }
//        
//    }
//    
//    public func newArticle()-> Article
//    {
//        return NSEntityDescription.insertNewObjectForEntityForName("Article", inManagedObjectContext: self.managedObjectContext) as! Article
//    }
//    
//    public func getAllArticle() -> [Article]
//    {
//        let request = NSFetchRequest(entityName: "Article")
//        
//        do {
//            let result = try managedObjectContext.executeFetchRequest(request) as! [Article]
//            return result
//        }catch{
//            //            fatalError("Failed to fetch artcle")
//            return []
//        }
//    }
//    
//    public func getArticles(WithLang lang:String) -> [Article]{
//        let request = NSFetchRequest(entityName: "Article")
//        request.predicate = NSPredicate(format: "lang == %@", lang)
//        
//        do {
//            let result = try managedObjectContext.executeFetchRequest(request) as! [Article]
//            return result
//        }catch{
//            return []
//            //            fatalError("Failed to fetch lang")
//        }
//    }
//    
//    public func getArticles(containString str:String) -> [Article]
//    {
//        let request = NSFetchRequest(entityName: "Article")
//        request.predicate = NSPredicate(format: "title CONTAINS %@ || content CONTAINS %@", str,str)
//        
//        do{
//            let result = try managedObjectContext.executeFetchRequest(request) as! [Article]
//            return result
//        }catch{
//            return []
//            //            fatalError("Failed to fetch \(str)")
//        }
//    }
//    
//    public func removeArticle(article:Article)
//    {
//        managedObjectContext.deleteObject(article)
//    }
//    
//    public func save()
//    {
//        if managedObjectContext.hasChanges {
//            do {
//                try managedObjectContext.save()
//            }
//            catch{
//                fatalError("Failure to save content \(error)");
//            }
//        }
//    }
//}
