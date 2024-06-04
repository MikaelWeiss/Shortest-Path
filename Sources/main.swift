// The Swift Programming Language
// https://docs.swift.org/swift-book

let graph = Graph.exampleGraph

print("This is a program that helps you find the shortest path between states in the US")
print("Please enter the starting state initial\nExampel: \"CA\"")
let from = readLine()
print("Please enter the ending state with the same format")
let to = readLine()

let path = graph.shortestPath(from: from!, to: to!)
print(path.map { $0 })
