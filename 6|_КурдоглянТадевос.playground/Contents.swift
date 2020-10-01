

class Queue<T> {
    var array: [T] = []
    func push (a :T) {
        array.append(a)
    }
    
    func pop () -> T {
       return array.removeFirst()
    }
    
    func filter (fn: (T)->Bool) -> Queue<T> {
        let newQueue = Queue<T>()
        
        for el in array {
            if fn(el) == true {
                newQueue.push(a: el)
            }
        }
        return newQueue
    }
    
    func map (fn: (T)->T) -> Queue<T> {
        let newQueue = Queue<T>()
        
        for el in array {
            let newEl = fn(el)
            newQueue.push(a: newEl)
        }
        return newQueue
    }
    
    subscript(index: Int) -> T? {
        if index < array.count && index >= 0 {
            return array[index]
        }
        return nil
    }

}

var sdsd = Queue<Int>()

sdsd.push(a: 133)
sdsd.push(a: 10)
sdsd[0]
sdsd[10]
sdsd[-1]
sdsd.pop()

sdsd.filter(fn: {(el: Int) -> Bool in
    return el % 2 == 0
})

sdsd.map(fn: {(el: Int) -> Int in return el + 2})
