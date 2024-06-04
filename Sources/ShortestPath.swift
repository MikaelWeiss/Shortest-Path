// Write an algorithm to determine the shortest path between two nodes in a graph.
// Each node has a two letter name, and then a list of other nodes it is connected to with the distance between the two nodes.
// The graph is undirected and has no cycles.

struct Node: Hashable {
    let name: String
    /// (neighbor, distance)
    var neighbors: [(String, Int)]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        for neighbor in neighbors {
            hasher.combine(neighbor.0)
            hasher.combine(neighbor.1)
        }
    }
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        lhs.name == rhs.name
    }
}

struct Graph {
    var nodes: [Node]
    
    func shortestPath(from start: String, to end: String) -> [String] {
        var distances = [String: Int]()
        var previous = [String: String]()
        var queue = [String]()
        
        distances[start] = 0
        queue.append(start)
        
        while !queue.isEmpty {
            let current = queue.removeFirst()
            
            for neighbor in nodes.first(where: { $0.name == current })!.neighbors {
                let distance = distances[current]! + neighbor.1
                
                if distances[neighbor.0] == nil || distance < distances[neighbor.0]! {
                    distances[neighbor.0] = distance
                    previous[neighbor.0] = current
                    queue.append(neighbor.0)
                }
            }
        }
        
        var path = [String]()
        var current = end
        
        while current != start {
            path.insert(current, at: 0)
            current = previous[current]!
        }
        
        path.insert(start, at: 0)
        
        return path
    }
}
