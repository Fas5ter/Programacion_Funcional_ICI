# Cristian Armando Larios Bravo
# Imports
# • Creamos un archivo fuente main.ex
# • Escribimos el siguiente código:
import ModuloImportado

defmodule ModuloMain do
  def main do
    IO.puts("Funcion main")
    funcion_importada("Esta funcion es importada")
  end
end

# • Creamos el Módulo a importar modsec.ex
# • Escribimos el siguiente código:
defmodule ModuloImportado do
  def funcion_importada(msg) do
    IO.puts(msg)
  end
end

# • Compilamos en iex la función a importar
"""
iex> c("modsec.ex")
[ModuloImportado]
"""

# • Compilamos en iex la función que va a importar
"""
iex> c("main.ex")
[ModuloMain]
"""

# • Ejecutamos la función main
"""
iex> ModuloMain.main()
Funcion main
Esta funcion es importada
:ok
"""

# Si no se quiere importar el módulo, se puede utilizar de manera directa indicando
#   el módulo y la función esto es:

defmodule ModuloMain do
  def main do
    IO.puts("Funcion main")
    ModuloImportado funcion_importada("Esta funcion es importada")
  end
end

# • Es necesario volver a compilar la función main
"""
iex(7)> c("main.ex")
warning: redefining module ModuloMain (current version defined in memory)
 main.ex:3
[ModuloMain]
iex(8)> ModuloMain.main()
Funcion main
Esta funcion es importada
:ok
"""

# Alias
# • Se puede utilizar alias como alternativa a import, permite hacer una referencia a
# un módulo con otro nombre

defmodule ModuloMain do
  alias ModuloImportado, as MI

  def main do
    IO.puts("Funcion main")
    MI.funcion_importada("Esta funcion es importada con alias")
  end
end

# • bash
"""
iex(10)> c("main.ex")
warning: redefining module ModuloMain (current version defined in memory)
 main.ex:1
[ModuloMain]
iex(11)> ModuloMain.main()
Funcion main
Esta funcion es importada con alias
:ok
"""
