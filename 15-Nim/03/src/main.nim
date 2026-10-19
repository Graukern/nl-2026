# main.nim — единая точка входа для третьей презентации.
# Конфигурация nim.cfg задаёт --mm:orc и --threads:on.
# Команда: nim c -r main.nim

import p01_memory
import p02_vm
import p03_oop
import p04_fp
import p05_protocol
import p06_macros
import p07_concurrency
import p08_parallelism

proc main() =
  p01_memory.run();      echo ""
  p02_vm.run();          echo ""
  p03_oop.run();         echo ""
  p04_fp.run();          echo ""
  p05_protocol.run();    echo ""
  p06_macros.run();      echo ""
  p07_concurrency.run(); echo ""
  p08_parallelism.run()

when isMainModule:
  main()
