# Apuntes Elixir
# Cristian Armando Larios Bravo
# Módulos y Funciones

# Módulos
# • Un módulo consta de varias funciones
# • Cada función debe estar definida dentro de un módulo
# • El módulo IO permite varias operaciones de E/S (I/O), la función puts permite
# imprimir un mensaje en pantalla

# La sintaxis general es:
# – NombreModulo.nombre_funcion(args)
# • Se utiliza el constructor defmodule para la creación de los módulos
# • Dentro del módulo con el constructor def se crean las funciones.


# Funciones
# • Una función siempre debe estar dentro de un módulo
# • Los nombres de funciones son igual que las variables:
# – El nombre de una variable siempre inicia con un caracter alfabético en
# minúscula o caracter de subrayado (_)
# – Después puede llevar cualquier combinación de estos caracteres
# – La convención es usar solo letras, dígitos y subrayados
# – Pueden terminar con los carateres ? o !.
# – Por convención el ? se utiliza cuando la función retorna true o false
# – El ! se utiliza generalmente en funciones que podrían provocar algún error
# en tiempo de ejecución
# – Tanto defmodule como def NO son palabras reservadas del lenguaje, son
# macros

# • Función sin argumentos (procedimiento)
defmodule HolaMundo do
  def mensaje do
    IO.puts("Hola Mundo")
  end
end
# • Función con argumentos
defmodule Calculadora do
  def suma(n1,n2) do
    n1 + n2
  end
end
# • Un módulo puede estar dentro de un archivo. Un archivo puede contener varios
# módulos.

defmodule Areas do
  def area_cuadrado(1) do
    1*1
  end
end

# Reglas de los módulos
# – Inicia con una letra mayúscula
# – Se escribe con el estilo CamelCase
# – Puede consistir en caracteres alfanuméricos, subrayados y puntos (.).
# Regularmente se usa para la organización jerárquica de los módulos.

defmodule Geometria.Cuadrado do
  def perimetro(l) do
    4*l
  end
end

defmodule Geometria.Rectangulo do
  def perimetro(l1,l2) do
    2*l1 + 2*l2
  end
end

# • También se pueden anidar de la siguiente forma:
defmodule Geometria do
  defmodule Cuadrado do
    def perimetro(l) do
      4*l
    end
  end

  defmodule Rectangulo do
    def perimetro(l1,l2) do
      2*l1 + 2*l2
    end
  end
end

# • Las funciones pueden expresarse de manera condensada
defmodule Geometria do
  def perimetro_cuadrado(l), do: 4*l
  def perimetro_rectangulo(l1,l2), do: 2*l1 + 2*l2
end

# • Los paréntesis en los argumentos son opcionales
# Invocaciones internas de una función no requieren del prefijo del nombre del
# módulo.

defmodule Geometria do
  def perimetro1(l), do: cuadrado(l)
  def perimetro2(l), do: Geometria.cuadrado(l)
  def cuadrado(l), do: 4*l
end

# Visibilidad de funciones
# • Se pueden utilizar funciones privadas con el constructor defp
# • Función Publica y privada

defmodule TestPublicoPrivado do
  def funcion_publica(msg) do
    IO.puts("#{msg} publico")
    funcion_privada(msg)
  end

  defp funcion_privada(msg) do
    IO.puts("#{msg} privado")
  end
end

TestPublicoPrivado.funcion_publica("Este es un mensaje")

# • Módulo Geometría
defmodule Geometria do
  def perimetro1(l), do: cuadrado(l)
  def perimetro2(l), do: Geometria.cuadrado(l)
  defp cuadrado(l), do: 4*l
end

# • Utilizando pipelines
defmodule Operaciones do
  def suma(m1,n1), do: n1 + n2
  def cuadrado(n), do: n * n
end


defmodule Test do
  def start do
    4 |> Operaciones.suma(5) |>Operaciones.cuadrado
  end
end

# Aridad (Arity) de funciones
# • Es el nombre para el número de argumentos que una función recibe
# • Una función se identifica por:
# 1. el módulo donde se encuentra,
# 2. su nombre y
# 3. su aridad (arity)


# Polimorfismo (sobrecarga)
# • Dos funciones con el mismo nombre pero con diferente aridad son dos diferentes
# funciones.
# Cristian Armando Larios Bravo

defmodule Rectangulo do
  def area(1) do
    1 *1
  end
  def area(l1,l2) do
    l1 * l2
  end
end

# • Haciendo que una función dependa de otra de diferente aridad, se podría realizar
# lo siguiente:
defmodule Calculadora do
  def suma(n) do
    suma(n, 0)
  end
  def suma(n1,n2) do
    n1 + n2
  end
end

# Argumentos por defecto
# • Se pueden especificar argumentos por defecto mediante el operador
defmodule Calculadora do
  def suma(n1,n2 \\ 0) do
    n1 + n2
  end
end
# • Este módulo genera dos funciones como en el caso anterior
# • Se puede utilizar cualquier combinación de argumentos por defecto:
defmodule Calculadora do
  def funcion(n1,n2 \\ 0, n3 \\ 1, n4, n5 \\ 2) do
    n1 + n2 + n3 + n4 + n5
  end
end

# Atributos de módulo
# • Existen los atributos en tiempo de compilación (Mientras están cargados)
defmodule Geometria do
  @pi 3.141592
  def area(r) do
    r*r*@pi
  end
  def circunferencia(r) do
    2 * r * @pi
  end
end

# • Elixir permite el registro de atributos, que se almacenarán en el archivo binario.
# – @moduledoc
# – @doc
# • Sirven para documentar módulos y funciones

defmodule Geometria do
  @moduledoc  "Calcula el area y el perimetro de un circulo"

  @pi 3.141692

  @doc  "Calcula el area del circulo"
  def area(r), do: r*r*@pi

  @doc  "Calcula el perimetro de un circulo"
  def circunferencia(r), do: 2 * r * @pi
end

# • Concatenación de Cadenas
defmodule Cadena do
  def concatenar(cad1, cad2, separador \\ " ") do
    cad1 <> separador <> cad2
  end
end

IO.puts(Cadena.concatenar("Hola", "Mundo"))
IO.puts(Cadena.concatenar("Hola", "Mundo", "<->"))

# Pattern Matching
# • Funciones
defmodule Calculadora do
  def div(_,0) do
    {:error, "No se puede dividir por 0"}
  end
  def div(n1,n2) do
    {:ok, "El resultado es: #{n1/n2}"}
  end
end

IO.inspect(Calculadora.div(5,0))
IO.inspect(Calculadora.div(5,3))

# • Si invertimos el orden de las funciones, es decir:
defmodule Calculadora do
  def div(n1, n2) do
    {:ok, "El resultado es: #{n1,n2}"}
  end
  def div(_,0) do
    {:error, "No se puede dividir por 0"}
  end
end

IO.inspect(Calculadora.div(5,0))
IO.inspect(Calculadora.div(5,3))

# Guardas
defmodule Numero do
  def cero?(0), do: true
  def cero?(n) when is_integer(n), do: false
  def cero?(_), do: "No es entero"
end

IO.puts(Numero.cero?(0))
IO.puts(Numero.cero?(2))
IO.puts(Numero.cero?("3"))

# Condicionales
# if
# • if, ejemplo 1
# Cristian Armando Larios Bravo

defmodule Persona1 do
  def sexo(sex) do
    if sex == :m do
      "Masculino"
    else
      "Femenino"
    end
  end
end

# • if, ejemplo 2
defmodule Persona2 do
  def sexo(sex) do
    if sex == :m do
      "Masculino"
      else if sex == :f do
        femenino
      else
        "Sexo desconocido"
      end
    end
  end
end

# case
# • case, ejemplo 1

defmodule Persona3 do
  def sexo(sex) do
    case sex do
      :m -> "Masculino"
      :f -> "Femenino"
      _ -> "Sexo desconocido"
    end
  end
end

# • Match con funciones, ejemplo 1
defmodule Persona4 do
  def sexo(sex) when sex == :m do
    "Masculino"
  end
  def sexo(sex) when sex == :f do
    "Femenino"
  end
  def sexo(_sex) do
    "Sexo desconocido"
  end
end


# Match con funciones
# • Ejemplo 2
defmodule Persona5 do
  def sexo(sex) when sex == :m, do: "Masculino"
  def sexo(sex) when sex == :f, do: "Femenino"
  def sexo(_sex), do: "Sexo desconocido"
end

# cond
# • cond, ejemplo 1
defmodule Persona6 do
  def sexo(sex) do
    cond do
      sex == :m -> "Masculino"
      sex == :f -> "Femenino"
      true -> "Sexo desconocido"
    end
  end
end

# Doctest
# • Se realiza a partir de la documentación de las funciones

@doc """"
Hello World

### Examples

    iex> Calculadora.hello()
    :world


"""
# Cristian Armando Larios Bravo
def hello do
  :world
end

# Test
# • Se realiza a partir del script del test
defmodule CalcualdoraTest do
  use ExUnit.Case
  doctest Calculadora

  test "Greets the world" do
    assert Calculadora.hello() == :world
  end
end

# case
# • Ejemplo 1
defmodule Matematicas do
  def calculadora(opcion, {n1,n2}) do
    case opcion do
      "+" -> n1+n2
      "-" -> n1-n2
      "/" -> when n2 != 0 -> n1/n2
      "/" -> when n2 == 0 -> "No se puede dividir por 0"
      "*" -> n1*n2
      _ -> :error
    end
  end
end

IO.inspect Matematicas.calculadora("+",{5,4})
IO.inspect Matematicas.calculadora("-",{5,4})
IO.inspect Matematicas.calculadora("/",{5,4})
IO.inspect Matematicas.calculadora("/",{5,0})
IO.inspect Matematicas.calculadora("*",{5,4})

# cond
# • Ejemplo 1
defmodule DiaSemana do
  def dia(d) do
    cond do
      d == 1 -> "Lunes"
    d == 2 -> "Martes"
    d == 3 -> "Miercoles"
    d == 4 -> "Jueves"
    d == 5 -> "Viernes"
    d == 6 -> "Sabado"
    d == 7 -> "Domingo"
    true -> "Dia no valido"
    end
  end
end

IO.puts DiaSemana.dia(1)
IO.puts DiaSemana.dia(2)
IO.puts DiaSemana.dia(3)
IO.puts DiaSemana.dia(4)
IO.puts DiaSemana.dia(5)
IO.puts DiaSemana.dia(6)
IO.puts DiaSemana.dia(7)
IO.puts DiaSemana.dia(8)

# cond
# • Ejemplo 2

defmodule DiaSemana do
  def dia(d) do
    cond do
      d == "l" or d == "L" -> "Lunes"
      d == "ma" or d == "MA" -> "Martes"
      d == "mi" or d == "MI" -> "Miercoles"
      d == "j" or d == "J" -> "Jueves"
      d == "v" or d == "V" -> "Viernes"
      d == "s" or d == "S" -> "Sabado"
      d == "d" or d == "D" -> "Domingo"
      true -> "Dia no valido"
    end
  end
end

IO.puts DiaSemana.dia("l")
IO.puts DiaSemana.dia("ma")
IO.puts DiaSemana.dia("mi")
IO.puts DiaSemana.dia("j")
IO.puts DiaSemana.dia("v")
IO.puts DiaSemana.dia("s")
IO.puts DiaSemana.dia("d")

IO.puts DiaSemana.dia("L")
IO.puts DiaSemana.dia("MA")
IO.puts DiaSemana.dia("MI")
IO.puts DiaSemana.dia("J")
IO.puts DiaSemana.dia("V")
IO.puts DiaSemana.dia("S")
IO.puts DiaSemana.dia("D")

IO.puts DiaSemana.dia("Ma")
IO.puts DiaSemana.dia("mA")

# cond
# • Ejemplo 3
defmodule DiaSemana do
  def dia(d) do
    d = String.upcase(d)
    cond do
      d == "L" -> "Lunes"
      d == "MA" -> "Martes"
      d == "MI" -> "Miercoles"
      d == "J" -> "Jueves"
      d == "V" -> "Viernes"
      d == "S" -> "Sabado"
      d == "D" -> "Domingo"
      true -> "Dia no valido"
    end
  end
end

IO.puts DiaSemana.dia("l")
IO.puts DiaSemana.dia("ma")
IO.puts DiaSemana.dia("mi")
IO.puts DiaSemana.dia("j")
IO.puts DiaSemana.dia("v")
IO.puts DiaSemana.dia("s")
IO.puts DiaSemana.dia("d")

IO.puts DiaSemana.dia("L")
IO.puts DiaSemana.dia("MA")
IO.puts DiaSemana.dia("MI")
IO.puts DiaSemana.dia("J")
IO.puts DiaSemana.dia("V")
IO.puts DiaSemana.dia("S")
IO.puts DiaSemana.dia("D")

IO.puts DiaSemana.dia("Ma")
IO.puts DiaSemana.dia("mA")

# unless
# • Ejemplo 1
defmodule MayorDeEdad do
  def mayor1(edad) do
    unless edad >= 18 do
      "Es menor de edad"
    end
  end
end

# unless
# • Ejemplo 2
defmodule MayorDeEdad do
  def mayor1(edad) do
    unless edad >= 18 do
      "Es menor de edad"
    end
  end
end

# Funciones anónimas
# • No tienen nombre
# • Se pueden fijar a variables


# Ejemplos de funciones anónimas
# • Ejemplo 1
defmodule Calculadora do
  def suma(n1,n2), do: n1+n2
end
suma_anonima = fn(n1,n2) -> n1 + n2 end

IO.puts(Calculadora.suma(5,4))
IO.puts(Suma_anonima(5,5))

# Ejemplos de funciones anónimas
# • Ejemplo 2
mayor? = fn(n1,n2) -> if n1 > n2 do true else false end end

IO.inspect(mayor?.(4,5))
IO.inspect(mayor?.(5,4))
IO.inspect(mayor?.(5,5))

# • Ejemplo de función anónima
# • Si se desea personalizar la salida
mayor? = fn(n1,n2) -> if n1 > n2 do :si else :no end end

IO.inspect(mayor?.(4,5))
IO.inspect(mayor?.(5,4))

# Ejemplos de funciones anónimas
# • Ejemplo 3
mayor? = fn(n1,n2) -> if n1 > n2 do: si else :no end end
res = mayor?.(4,5)
IO.puts res
res = mayor?.(5,4)
IO.puts res

# Ejemplos de funciones anónimas
# • Ejemplo 4
# Cristian Armando Larios Bravo
mayor = fn(n1,n2) ->
  if n1 > n2 do
    {:ok, "#{n1} > #{n2}"}
  else
    {:error, "#{n1} <= #{n2}"}
  end
end

IO.inspect(mayor?.(4,5))
IO.inspect(mayor?.(5,4))
IO.inspect(mayor?.(5,5))

# Ejemplos de funciones anónimas
# • Ejemplo 5
mayor = fn(n1,n2) ->
  if n1 > n2 do
    {:ok, "#{n1} > #{n2}"}
  else
    {:error, "#{n1} <= #{n2}"}
  end
end

{status, res} = mayor.(4,5)
IO.puts status
IO.puts res
{status, res} = mayor.(5,4)
IO.puts status
IO.puts res

# Operador Pipe
# • Dada una lista con n numeros, se desea obtener el cuadrado de la suma de los
# elementos de la cola. Si la lista es [1,2,3,4,5], el resultado es (2+3+4+5)^2
# • csc = cuadrado(suma(2,3,4,5))

sum = 0
lista = [1,2,3,4,5]
lista = tl(lista)
IO.inspect(lista)
[num|lista] = lista
# Para sacar el 2
IO.inspect(num)
IO.inspect(lista)
sum = sum + num
IO.inspect(num)
# Para sacar el 3
[num|lista] = lista
IO.inspect(num)
IO.inspect(lista)
sum = sum + num
IO.inspect(sum)
# Para sacar el 4
[num|lista] = lista
IO.inspect(num)
IO.inspect(lista)
sum = sum + num
IO.inspect(sum)
# Para sacar el 5
[num|lista] = lista
IO.inspect(num)
IO.inspect(lista)
sum = sum + num
IO.inspect(sum)
IO.puts("El resultado es: #{sum*sum}")

# • Solución 1
defmodule PipeTest do
  def cuadrado(n), do: n*n

  def suma(lista) do
    Enum.sum(lista)
  end
end

IO.puts("#{PipeTest.cuadrado(PipeTest.suma(tl([,1.2.3.4.5])))}")

# • Solución 2
defmodule PipeTest do
  def cuadrado(n), do: n*n

  def suma(lista) do
    Enum.sum(lista)
  end

  def csc(lista) do
    lista
    |>tl
    |>suma
    |>cuadrado
  end
end

IO.puts("#{PipeTest.csc([1,2,3,4,5])}")

# • Herramienta de depuración (debugging)
