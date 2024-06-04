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
    
    static var exampleGraph: Graph {
        // MARK: - Shortest Path Setup
        
        var CA = Node(name: "CA", neighbors: [])
        var OR = Node(name: "OR", neighbors: [])
        var WA = Node(name: "WA", neighbors: [])
        var NV = Node(name: "NV", neighbors: [])
        var ID = Node(name: "ID", neighbors: [])
        var UT = Node(name: "UT", neighbors: [])
        var AZ = Node(name: "AZ", neighbors: [])
        var MT = Node(name: "MT", neighbors: [])
        var WY = Node(name: "WY", neighbors: [])
        var CO = Node(name: "CO", neighbors: [])
        var NM = Node(name: "NM", neighbors: [])
        var ND = Node(name: "ND", neighbors: [])
        var SD = Node(name: "SD", neighbors: [])
        var NE = Node(name: "NE", neighbors: [])
        var KS = Node(name: "KS", neighbors: [])
        var OK = Node(name: "OK", neighbors: [])
        var TX = Node(name: "TX", neighbors: [])
        var MN = Node(name: "MN", neighbors: [])
        var IA = Node(name: "IA", neighbors: [])
        var MO = Node(name: "MO", neighbors: [])
        var AR = Node(name: "AR", neighbors: [])
        var LA = Node(name: "LA", neighbors: [])
        var WI = Node(name: "WI", neighbors: [])
        var IL = Node(name: "IL", neighbors: [])
        var MS = Node(name: "MS", neighbors: [])
        var MI = Node(name: "MI", neighbors: [])
        var IN = Node(name: "IN", neighbors: [])
        var KY = Node(name: "KY", neighbors: [])
        var TN = Node(name: "TN", neighbors: [])
        var AL = Node(name: "AL", neighbors: [])
        var OH = Node(name: "OH", neighbors: [])
        var WV = Node(name: "WV", neighbors: [])
        var VA = Node(name: "VA", neighbors: [])
        var NC = Node(name: "NC", neighbors: [])
        var SC = Node(name: "SC", neighbors: [])
        var GA = Node(name: "GA", neighbors: [])
        var FL = Node(name: "FL", neighbors: [])
        var PA = Node(name: "PA", neighbors: [])
        var NY = Node(name: "NY", neighbors: [])
        var VT = Node(name: "VT", neighbors: [])
        var NH = Node(name: "NH", neighbors: [])
        var ME = Node(name: "ME", neighbors: [])
        var MA = Node(name: "MA", neighbors: [])
        var RI = Node(name: "RI", neighbors: [])
        var CT = Node(name: "CT", neighbors: [])
        var NJ = Node(name: "NJ", neighbors: [])
        var DE = Node(name: "DE", neighbors: [])
        var MD = Node(name: "MD", neighbors: [])
        
        CA.neighbors = [("OR", 535), ("NV", 129), ("AZ", 755)]
        OR.neighbors = [("CA", 535), ("WA", 160), ("ID", 441), ("NV", 663)]
        WA.neighbors = [("OR", 160), ("ID", 619)]
        NV.neighbors = [("CA", 129), ("AZ", 713), ("UT", 534), ("ID", 541), ("OR", 663)]
        ID.neighbors = [("OR", 441), ("WA", 160), ("MT", 438), ("WY", 727), ("UT", 338), ("NV", 541)]
        UT.neighbors = [("NV", 534), ("ID", 338), ("WY", 435), ("CO", 478), ("AZ", 652)]
        AZ.neighbors = [("CA", 755), ("NV", 713), ("UT", 652), ("NM", 476)]
        MT.neighbors = [("ID", 438), ("WY", 675), ("ND", 624), ("SD", 742)]
        WY.neighbors = [("ID", 727), ("MT", 675), ("SD", 455), ("NE", 444), ("CO", 100), ("UT", 435)]
        CO.neighbors = [("WY", 100), ("NE", 486), ("KS", 536), ("OK", 336), ("NM", 355), ("UT", 478)]
        NM.neighbors = [("AZ", 476), ("CO", 355), ("OK", 585), ("TX", 697)]
        ND.neighbors = [("MT", 624), ("SD", 215), ("MN", 435)]
        SD.neighbors = [("MT", 742), ("ND", 215), ("MN", 404), ("IA", 165), ("NE", 392), ("WY", 455)]
        NE.neighbors = [("SD", 392), ("WY", 444), ("CO", 486), ("KS", 165), ("MO", 343), ("IA", 187)]
        KS.neighbors = [("NE", 165), ("CO", 536), ("OK", 293), ("MO", 204)]
        OK.neighbors = [("CO", 336), ("KS", 293), ("MO", 401), ("AR", 337), ("TX", 388), ("NM", 585)]
        TX.neighbors = [("NM", 697), ("OK", 388), ("AR", 504), ("LA", 430)]
        MN.neighbors = [("ND", 435), ("SD", 404), ("IA", 244), ("WI", 258)]
        IA.neighbors = [("MN", 244), ("SD", 165), ("NE", 187), ("MO", 255), ("IL", 291), ("WI", 279)]
        MO.neighbors = [("IA", 255), ("NE", 343), ("KS", 204), ("OK", 401), ("AR", 340), ("TN", 453), ("KY", 562), ("IL", 129)]
        AR.neighbors = [("MO", 340), ("OK", 337), ("TX", 504), ("LA", 416), ("MS", 253), ("TN", 344)]
        LA.neighbors = [("TX", 430), ("AR", 416), ("MS", 150)]
        WI.neighbors = [("MN", 258), ("IA", 279), ("IL", 249), ("MI", 193)]
        IL.neighbors = [("WI", 249), ("IA", 291), ("MO", 129), ("KY", 415), ("IN", 190)]
        MS.neighbors = [("AR", 253), ("LA", 150), ("TN", 392), ("AL", 242)]
        MI.neighbors = [("WI", 193), ("IN", 244), ("OH", 237)]
        IN.neighbors = [("MI", 244), ("IL", 190), ("KY", 145), ("OH", 175)]
        KY.neighbors = [("IN", 145), ("IL", 415), ("MO", 562), ("TN", 203), ("VA", 532), ("WV", 197), ("OH", 186)]
        TN.neighbors = [("KY", 203), ("MO", 453), ("AR", 344), ("MS", 392), ("AL", 282), ("GA", 255), ("NC", 530), ("VA", 597)]
        AL.neighbors = [("MS", 242), ("TN", 282), ("GA", 160), ("FL", 205)]
        OH.neighbors = [("MI", 237), ("IN", 175), ("KY", 186), ("WV", 160), ("PA", 425)]
        WV.neighbors = [("OH", 160), ("KY", 197), ("VA", 302), ("PA", 354), ("MD", 397)]
        VA.neighbors = [("KY", 532), ("TN", 597), ("NC", 156), ("WV", 302), ("MD", 129)]
        GA.neighbors = [("AL", 160), ("TN", 255), ("NC", 434), ("SC", 212), ("FL", 252)]
        FL.neighbors = [("AL", 205), ("GA", 252)]
        PA.neighbors = [("OH", 425), ("WV", 354), ("MD", 103), ("DE", 124), ("NJ", 127), ("NY", 268)]
        MD.neighbors = [("WV", 397), ("VA", 129), ("PA", 103), ("DE", 62)]
        NC.neighbors = [("VA", 156), ("TN", 530), ("GA", 434), ("SC", 200)]
        SC.neighbors = [("NC", 200), ("GA", 212)]
        VT.neighbors = [("NH", 106), ("NY", 153)]
        NY.neighbors = [("VT", 153), ("PA", 268), ("NJ", 193), ("CT", 111), ("MA", 165)]
        NJ.neighbors = [("PA", 127), ("NY", 193), ("DE", 108)]
        DE.neighbors = [("PA", 124), ("MD", 62), ("NJ", 108)]
        NH.neighbors = [("VT", 106), ("ME", 139), ("MA", 68)]
        MA.neighbors = [("NH", 68), ("VT", 236), ("NY", 165), ("CT", 101), ("RI", 45)]
        CT.neighbors = [("MA", 101), ("NY", 111), ("RI", 72)]
        ME.neighbors = [("NH", 139)]
        RI.neighbors = [("CT", 72), ("MA", 45)]
        
        let graph = Graph(nodes: [CA, OR, WA, NV, ID, UT, AZ, MT, WY, CO, NM, ND, SD, NE, KS, OK, TX, MN, IA, MO, AR, LA, WI, IL, MS, MI, IN, KY, TN, AL, OH, WV, VA, NC, SC, GA, FL, PA, NY, VT, NH, ME, MA, RI, CT, NJ, DE, MD])
        
        return graph
    }
}
