# Управление памятью: ARC / ORC и деструкторы
type
  MyResource = object
    id: int

# Хук уничтожения (вызывается автоматически)
proc `=destroy`(x: MyResource) =
  echo "Уничтожен ресурс с id=", x.id

proc run*() =
  echo "01. Управление памятью"
  echo "В этом проекте используется ORC: подсчёт ссылок и сборка циклов."
  
  block:
    var res = MyResource(id: 42)
    echo "Создан ресурс с id=", res.id
    # В конце блока res автоматически уничтожится
  
  echo "Блок завершен, ресурс уничтожен."
  
  # Демонстрация ref object (сборка мусора через подсчёт ссылок)
  type RefResource = ref object
    name: string
  
  block:
    let r = RefResource(name: "RefObj")
    echo "Создан ", r.name
  echo "Блок с ref завершен."
