
public protocol DataStore {
    typealias ContentType
    func save(data: ContentType) -> Bool
}

public class InMemoryDataStore<T>: DataStore {
    typealias ContentType = T
    public init() {}
    public func save(data: ContentType) -> Bool {
        println("Saving data: \(data)")
        return true;
    }
}

public class Manager<DS: DataStore> {
    let dataStore: DS

    public init(dataStore: DS) {
        self.dataStore = dataStore
    }

    public func storeData(data: DS.ContentType) {
        dataStore.save(data)
    }

}
let dataStore = InMemoryDataStore<String>()
let manager = Manager(dataStore: dataStore)
manager.storeData("text")

let dataStoreInt = InMemoryDataStore<Int>()
let managerInt = Manager(dataStore: dataStoreInt)
managerInt.storeData(123456)
