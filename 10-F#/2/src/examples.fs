open System
open System.IO

// ============================================================
// 1. Collections: List, Array, Seq, Set, Map
// ============================================================

let numbers = [ 1; 2; 3; 4; 5 ]

let oddSquares =
    numbers
    |> List.filter (fun x -> x % 2 = 1)
    |> List.map (fun x -> x * x)

printfn "Odd squares: %A" oddSquares

let array = [| 10; 20; 30 |]
array[1] <- 99
printfn "Array: %A" array

let lazySquares = seq { for x in 1 .. 10 -> x * x }
printfn "First 5 lazy squares: %A" (lazySquares |> Seq.take 5 |> Seq.toList)

let tags = Set.ofList [ "f#"; "dotnet"; "f#" ]
printfn "Tags: %A" tags

let ages = Map [ "Ann", 20; "Bob", 22 ]
printfn "Ann age: %A" (Map.tryFind "Ann" ages)

// ============================================================
// 2. Console and file I/O
// ============================================================

let path = "fsharp-demo.txt"
File.WriteAllText(path, "Hello from F#!")
let text = File.ReadAllText(path)
printfn "File contents: %s" text

let readFirstLine path =
    use reader = new StreamReader(path)
    reader.ReadLine()

let firstLine = readFirstLine path
printfn "First line: %s" firstLine

// ============================================================
// 3. Async / task / parallelism
// ============================================================

let countChars path =
    task {
        let! text = File.ReadAllTextAsync path
        return text.Length
    }

let charCount = countChars path |> fun t -> t.Result
printfn "Character count: %d" charCount

let work n =
    async {
        do! Async.Sleep 100
        return n * n
    }

let asyncResults =
    [ 1 .. 4 ]
    |> List.map work
    |> Async.Parallel
    |> Async.RunSynchronously

printfn "Async results: %A" asyncResults

let parallelSquares =
    [| 1 .. 20 |]
    |> Array.Parallel.map (fun x -> x * x)

printfn "Parallel array: %A" parallelSquares

// ============================================================
// 4. Functional style
// ============================================================

let normalizeName (s: string) =
    s.Trim().ToLowerInvariant()

let normalizedNames =
    [ "  Anna "; "BOB"; " anna" ]
    |> List.map normalizeName
    |> List.distinct
    |> List.sort

printfn "Normalized names: %A" normalizedNames

// ============================================================
// 5. OOP and interfaces
// ============================================================

type IPrintable =
    abstract member Print : unit -> unit

type User(name: string) =
    member _.Name = name

    interface IPrintable with
        member _.Print() =
            printfn "User: %s" name

let user = User("Anna")
(user :> IPrintable).Print()

// ============================================================
// 6. Records, discriminated unions, option, pattern matching
// ============================================================

type Point =
    { X: float
      Y: float }

let moveRight p = { p with X = p.X + 1.0 }

type Payment =
    | Cash
    | Card of last4: string
    | Transfer of iban: string

let describe payment =
    match payment with
    | Cash -> "cash"
    | Card last4 -> $"card ****{last4}"
    | Transfer iban -> $"transfer {iban}"

let safeHead = function
    | [] -> None
    | x :: _ -> Some x

printfn "%s" (describe (Card "1234"))
printfn "Head: %A" (safeHead [ 10; 20; 30 ])

// ============================================================
// 7. Active patterns
// ============================================================

let (|Even|Odd|) n =
    if n % 2 = 0 then Even else Odd

let describeNumber n =
    match n with
    | Even -> "even"
    | Odd -> "odd"

printfn "7 is %s" (describeNumber 7)

// ============================================================
// 8. Computation expressions
// ============================================================

let seqSquares =
    seq {
        for i in 1 .. 5 do
            yield i * i
    }

printfn "Sequence expression: %A" (seqSquares |> Seq.toList)

// ============================================================
// 9. Units of measure
// ============================================================

[<Measure>]
type m

[<Measure>]
type s

let distance = 120.0<m>
let time = 10.0<s>
let speed = distance / time

printfn "Speed: %A" speed
