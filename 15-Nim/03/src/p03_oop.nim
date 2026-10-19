# Объектно-ориентированное программирование
type
  Animal = ref object of RootObj
    name: string
  
  Dog = ref object of Animal
  Cat = ref object of Animal

# Базовый метод
method speak(a: Animal): string {.base.} =
  "..."

# Переопределение для Dog
method speak(d: Dog): string =
  "Woof!"

# Переопределение для Cat
method speak(c: Cat): string =
  "Meow!"

proc run*() =
  echo "03. ООП"
  let animals: seq[Animal] = @[
    Dog(name: "Rex"),
    Cat(name: "Tom"),
    Animal(name: "Generic")
  ]
  
  for a in animals:
    echo a.name, " говорит: ", a.speak()