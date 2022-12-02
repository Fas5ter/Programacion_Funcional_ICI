# Apuntes Elixir
# Cristian Armando Larios Bravo
# Módulos y Funciones

# • Inmutabilidad
# – Los datos en Elixir son inmutables: su contenido no puede cambiarse.
# – Las variables pueden ser refijadas (rebound) a un diferente valor
"""
iex()> dia_semana = 5 <se establece el valor inicial>
5
iex()> dia_semana <verificación>
5 <>
iex()> dia_semana = 7 <se refija el valor inicial>
7 <>
iex()> dia_semana <se verifica el efecto de la refijación>
7 <>
"""

# Variables
# • Elixir es un lenguaje de programación dinámico
# – NO es necesario declarar de manera explícita una variable o su tipo de
# dato
# – El tipo de dato se determina de acuerdo al valor contenido
# – La asignación se conoce como fijación (binding)
# – Cuando se inicializa una variable con un valor, la variable se fija con ese
# valor.
"""
iex()> dia_semana = 7 <fija (binds) el valor>
7 <resultado de la última expresión>
iex()> dia_semana <expresion que retorna el valor de la variable>
7 <valor de la variable>
iex()> dia_semana * 2
14
"""
# • Características de las variables
# – El nombre de una variable siempre inicia con un caracter alfabético en
# minúscula o caracter de subrayado (_)
# – Después puede llevar cualquier combinación de estos caracteres
# – La convención es usar solo letras, dígitos y subrayados
# – Pueden terminar con los carateres ? o !
# variable_valida
# esta_variable_tambien_es_valida
# esta_tambien_1
# estaEsValidaPeroNoRecomendada
# No_es_valida
# nombre_valido?
# claro_que_si!

# Módulos
# • Un módulo consta de varias funciones
# • Cada función debe estar definida dentro de un módulo
# • El módulo IO permite varias operaciones de E/S (I/O), la función puts permite
# imprimir un mensaje en pantalla
"""
iex()> IO.puts("Hola Mundo")
Hola Mundo
:ok
"""

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

"""
Salida
iex()> HolaMundo.mensaje
Hola Mundo
:ok
"""

# • Función con argumentos
defmodule Calculadora do
  def suma(n1,n2) do
    n1 + n2
  end
end

"""
Salida
C:\>iex modulo01.ex
Interactive Elixir (1.10.4) - press Ctrl+C to exit (type h() ENTER for he
lp)
iex(1)> Calculadora.suma(4,5)
9
"""

# • Un módulo puede estar dentro de un archivo. Un archivo puede contener varios
# módulos.

defmodule Areas do
  def area_cuadrado(1) do
    1*1
  end
end

"""
Salida
iex()> c("modulo01.ex")
warning: redefining module Calculadora (current version defined in memory
)
modulo01.ex:1
[Areas, Calculadora]
iex()> Areas.area_cuadrado(4)
16
iex()> Calculadora.suma(5,5)
10
"""

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

"""
Salida
iex()> c("modulo01.ex")
[Geometria.Cuadrado, Geometria.Rectangulo]
iex()> Geometria.Cuadrado.perimetro(4)
16
iex()> Geometria.Rectangulo.perimetro(4,2)
12
"""

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

"""
Salida
iex(7)> c("modulo01.ex")
warning: redefining module Geometria.Cuadrado (current version defined in
memory)
 modulo01.ex:2
warning: redefining module Geometria.Rectangulo (current version defined
in memory)
 modulo01.ex:7
[Geometria, Geometria.Cuadrado, Geometria.Rectangulo]
iex(8)> Geometria.Cuadrado.perimetro(4)
16
iex(9)> Geometria.Rectangulo.perimetro(4,2)
12
"""

# • Las funciones pueden expresarse de manera condensada
defmodule Geometria do
  def perimetro_cuadrado(l), do: 4*l
  def perimetro_rectangulo(l1,l2), do: 2*l1 + 2*l2
end

"""
Salida
iex()> c("modulo01.ex")
[Geometria]
iex()> Geometria.perimetro_cuadrado(4)
16
iex()> Geometria.perimetro_rectangulo(4,3)
14
"""

# • Los paréntesis en los argumentos son opcionales
"""
Salida
iex()> Geometria.perimetro_cuadrado 4
16
iex()> Geometria.perimetro_rectangulo 4,3
14
"""

# • Los paréntesis en los argumentos son opcionales
# Invocaciones internas de una función no requieren del prefijo del nombre del
# módulo.

defmodule Geometria do
  def perimetro1(l), do: cuadrado(l)
  def perimetro2(l), do: Geometria.cuadrado(l)
  def cuadrado(l), do: 4*l
end

"""
Salida
iex()> c("modulo01.ex")
[Geometria]
iex()> Geometria.perimetro1(4)
16
iex()> Geometria.perimetro2(4)
16
iex()> Geometria.cuadrado(4)
16
"""

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

"""
Salida
iex> c("modulo01.ex")
este es un mensaje publico
este es un mensaje privado
[TestPublicoPrivado]
"""

# • Módulo Geometría
defmodule Geometria do
  def perimetro1(l), do: cuadrado(l)
  def perimetro2(l), do: Geometria.cuadrado(l)
  defp cuadrado(l), do: 4*l
end

"""
Salida
iex()> c("modulo01.ex")
[Geometria]
iex()> Geometria.perimetro1(4)
16
iex()> Geometria.perimetro2(4)
** (UndefinedFunctionError) function Geometria.cuadrado/1 is undefined or
private
 Geometria.cuadrado(4)
iex()> Geometria.cuadrado(4)
** (UndefinedFunctionError) function Geometria.cuadrado/1 is undefined or
private
 Geometria.cuadrado(4)
"""

# • Operador pipeline
"""
iex()> 4 |> Geometria.perimetro1
16
"""

# • Dado el siguiente programa: Código fuente
# defmodule Operaciones do
#  def suma(n1,n2), do: n1 + n2
#  def cuadrado(n), do: n * n
# end
# • Obtener el cuadrado de la suma de 2 números (4 y 5)
defmodule Operaciones do
  def suma(n1, n2), do: n1 + n2
  def cuadrado(n), do: n * n
end

# • Invocando las funciones
"""
iex()> Operaciones.cuadrado(Operaciones.suma(4,5))
81
"""

# • Utilizando pipelines
"""
iex()> 4 |> Operaciones.suma(5) |> Operaciones.cuadrado
  81
  iex()> Operaciones.suma(4,5) |> Operaciones.cuadrado
  81
"""

# • Mediante un módulo test que realice las pruebas se podría realizar de la siguiente
# forma:
defmodule Operaciones do
  def suma(m1,n1), do: n1 + n2
  def cuadrado(n), do: n * n
end

defmodule Test do
  def start do
    4 |> Operaciones.suma(5) |>Operaciones.cuadrado
  end
end

"""
Salida
iex()> c("modulo01.ex")
[Operaciones, Test]
iex()> Test.start
81
"""

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

"""
Salida
iex()> c("modulo01.ex")
[Rectangulo]
iex()> Rectangulo.area(4)
16
iex()> Rectangulo.area(4,5)
20
"""

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

"""
Salida:
iex()> c("modulo01.ex")
[Calculadora]
iex()> Calculadora.suma(4)
4
iex()> Calculadora.suma(4,5)
9
"""

# Argumentos por defecto
# • Se pueden especificar argumentos por defecto mediante el operador
defmodule Calculadora do
  def suma(n1,n2 \\ 0) do
    n1 + n2
  end
end
# • Este módulo genera dos funciones como en el caso anterior
"""
Salida
iex()> c("modulo01.ex")
[Calculadora]
iex()> Calculadora.suma(7)
7
iex()> Calculadora.suma(7,10)
17
"""
# • Se puede utilizar cualquier combinación de argumentos por defecto:
defmodule Calculadora do
  def funcion(n1,n2 \\ 0, n3 \\ 1, n4, n5 \\ 2) do
    n1 + n2 + n3 + n4 + n5
  end
end

"""
Salida
iex()> c("modulo01.ex")
[Calculadora]
iex()> Calculadora.funcion(4)
** (UndefinedFunctionError) function Calculadora.funcion/1 is undefined o
r private. Did you mean one of:
 * funcion/2
 * funcion/3
 * funcion/4
 * funcion/5
 Calculadora.funcion(4)
iex()> Calculadora.funcion(4,5)
12
iex()> Calculadora.funcion(4,5,6)
18
iex()> Calculadora.funcion(4,5,6,7)
24
iex()> Calculadora.funcion(4,5,6,7,8)
30
iex()> Calculadora.funcion(4,5,6,7,8,9)
** (UndefinedFunctionError) function Calculadora.funcion/6 is undefined o
r private. Did you mean one of:
* funcion/2
* funcion/3
* funcion/4
* funcion/5
Calculadora.funcion(4, 5, 6, 7, 8, 9)
iex()>
"""

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

"""
Salida
iex> c("main.ex")
[Geometria]
iex> alias Geometria, as: G
Geometria
iex> G.area(4)
50.265472
iex> G.circunferencia(4)
25.132736
"""

# Cristian L
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

# • Para comprobar su uso, compilamos en la terminal el código fuente:
# – C:>elixirc main.ex
# • Esto va a generar el archivo:
# – Elixir.Geometria.beam
# • abrimos iex y verificamos la documentación:
"""
iex> Code.fetch_docs(Geometria)
{:docs_v1, 2, :elixir, "text/markdown",
 %{"en" => "Calcula el area y el perimetro de un circulo"}, %{},
 [
 {{:function, :area, 1}, 6, ["area(r)"],
 %{"en" => "calcula el area del circulo"}, %{}},
 {{:function, :circunferencia, 1}, 9, ["circunferencia(r)"],
 %{"en" => "calcula el perimetro de un circulo"}, %{}}
 ]}
iex> h Geometria
* Geometria
Calcula el area y el perimetro de un circulo
iex> h Geometria.area
* def area(r)
calcula el area del circulo
iex> h Geometria.circunferencia
* def circunferencia(r)
calcula el perimetro de un circulo
iex(6)>
"""

# Tipos de datos
# • Elixir utiliza el mismo sistema de tipos de Erlang
# Numeros
# • Los números (numbers) pueden ser enteros o flotantes
"""
iex> 3
3
iex> is_number(3)
true
iex> 3.5
3.5
iex> is_number(3.5)
true
"""

# Integer
"""
iex> is_integer(3)
true
iex> is_float(3)
false
iex> i 34 #inspect
Term
 34
Data type
 Integer
 Reference modules
 Integer
Implemented protocols
 IEx.Info, Inspect, List.Chars, String.Chars
"""

# Float
"""
iex> is_integer(3.5)
false
iex> is_float(3.5)
true
iex> i(3.5)
Term
 3.5
Data type
 Float
Reference modules
 Float
Implemented protocols
 IEx.Info, Inspect, List.Chars, String.Chars
"""

# Notación científica
"""
iex> 3.25555e-3
0.00325555
iex> 3.25555e3
3255.55
iex>i 3.25555e3
Term
 3255.55
Data type
 Float
Reference modules
 Float
Implemented protocols
 IEx.Info, Inspect, List.Chars, String.Chars
"""

# Operaciones aritméticas
"""
iex> 5 * 4 / 3 + 2 - 5
3.666666666666668
iex> 5/4
1.25
iex> 5/5
1.0
iex> div(5,5)
1
iex> rem(5,5)
0
"""

# • Piso de un número flotante
"""
iex> trunc(5/2)
2
iex> floor(5/2)
2
"""

# • Techo (cielo) de un número flotante
"""
iex> round(5/2)
3
iex> ceil(5/2)
3
"""

# • Números binarios
"""
iex> 0b10101001111
1359
# • Números octales
iex> 0o74754
31212
"""

# • Números hexadecimales
"""
iex> 0xFFFF
65535
"""

# • Azucar Sintáctica para los números
"""
iex> 1_000_000
1000000
iex> 1_000_000.123
1000000.123
"""

# Atoms
# • Constantes literales nombradas
# • es una constante cuyo nombre es su propio valor
# • inician con : (dos puntos)
# • seguidos de caracteres alfanuméricos y/o subrayados
# • se pueden usar espacios en blanco si se ponen entre comillas
"""
iex> :atom
:atom
iex> is_atom(:atom)
true
iex> is_atom(:es_un_atom)
true
iex> is_atom(:"es un atom")
true
iex> i :ok
Term
 :ok
Data type
Atom
Reference modules
 Atom
Implemented protocols
 IEx.Info, Inspect, List.Chars, String.Chars
"""

# • Un atom consta de dos partes:
# – texto: el que se pone después de los dos puntos
# – valor: es la referencia a la tabla de atoms.
"""
iex> var_atom = :atom
:atom
iex> var_atom
:atom
iex> :atom = var_atom
:atom
"""

# • Un atom se puede nombrar con mayúscula inicial
"""
iex> is_atom(Un_atom)
true
iex> Un_atom = Elixir.Un_atom
"""

# Un_atom
# • Atomos como booleanos
# • Los valores booleanos son atoms
"""
iex> is_atom(true)
true
iex> is_boolean(true)
true
iex> is_boolean(:true)
true
iex> is_boolean(:atom)
false
iex> :true == true
true
iex> :false == false
true
"""

# Atoms and, or y not
"""
iex> true and true
true
iex> true and false
false
iex> true or true
true
iex> true or false
true
iex> not false
true
iex> not true
false
iex> not not true
"""

# Nil
# • similar al null de otros lenguajes
"""
iex> is_atom(nil)
true
iex> is_atom(:nil)
true
iex> nil == :nil
true
"""

# • Los átomos nil y false son tratados como valores falsos, mientras que todo lo
# demás es tratado como un valor de verdad.
# • Esta propiedad es útil con los operadores de cortocircuito:
# – || -> retorna la primera expresión verdadera
# – && -> retorna la segunda siempre y cuando la primera lo sea también
# – ! -> retorna la negación de la expresión sin importar el tipo de dato
# • || -> retorna la primera expresión verdadera
"""
iex> false || nil || 5 || true
5
iex> false || nil || 5 || false || true
5
iex> false || nil || false || false || true || 5
true
"""

# • && -> retorna la segunda siempre y cuando la primera lo sea también
"""
iex> false && 5
false
iex> nil && 5
nil
iex> true && 5
5
iex> true && true
true
iex> 5 && true
true
iex> true && 5 && 4
4
iex> false && 5 && 4
false
iex> true && false && 4
false
iex> true && 4 && false
false
"""

# • ! ! -> retorna la negación de la expresión sin importar el tipo de dato
"""
iex> !true
false
iex> !false
true
iex> !5
false
iex> !nil
true
iex> not !4
true
iex> !(5+4)
false
iex> not(5+4)
** (ArgumentError) argument error
 :erlang.not(9)
"""

# Tuplas
# • son como estructuras o registros
# • permiten agrupar elementos fijos
"""
iex>persona = {"Alex", 49}
{"Alex", 49}
iex> i {"Alex", 49}
Term
 {"Alex", 49}
Data type
 Tuple
Reference modules
 Tuple
Implemented protocols
 IEx.Info, Inspect
"""

# • Para extraer elementos se usa la función elem
"""
iex> nombre = elem(persona, 0)
"Alex"
iex> nombre
"Alex"
iex> edad = elem(persona,1)
49
iex> edad
49
"""

# • Para modificar un elemento se usa la función put_elem
# Cristian Armando Larios Bravo
"""
iex> put_elem(persona,0,"Alexander")
{"Alexander", 49}
"""


# • Las tuplas son inmutables, por lo que no se modifica
iex> persona
"""{"Alex", 49}"""

# • Si se necesita cambiar, hay que almacenar el cambio en otra variable, o en la
# misma si ya no se desea conservar los valores
"""
iex> persona = put_elem(persona,0,"Alexander")
{"Alexander", 49}
iex> persona
{"Alexander", 49}
"""

# Listas
# • Manejo dinámico de datos
# • Funcionan como listas enlazadas simples
"""
iex> numeros_pares = [2,4,6,8,10]
[2, 4, 6, 8, 10]
iex> i [2, 4, 6, 8, 10]
Term
 [2, 4, 6, 8, 10]
Data type
 List
Reference modules
 List
Implemented protocols
 Collectable, Enumerable, IEx.Info, Inspect, List.Chars, String.Chars
iex> length(numeros_pares)
5
"""


# • Obtener un elemento de la lista mediante la función Enum.at/2
"""
iex> Enum.at(numeros_pares,4)
10
iex> Enum.at(numeros_pares,5)
nil
"""

# • Se puede saber si x elemento pertenece a una lista con operador in
"""
iex> 2 in numeros_pares
true
iex> 12 in numeros_pares
false
"""

# • Módulo List
# – Modificar o reemplazar un elemento de la lista
"""
iex> List.replace_at(numeros_pares,4,12)
[2, 4, 6, 8, 12]
iex> numeros_pares
[2, 4, 6, 8, 10]
iex> nuevos_pares = List.replace_at(numeros_pares,4,12)
[2, 4, 6, 8, 12]
iex> numeros_pares = List.replace_at(numeros_pares,4,12)
[2, 4, 6, 8, 12]
"""

# • Insertar un elemento
"""
iex> numeros_pares
[2, 4, 6, 8, 12]
iex> numeros_pares = List.insert_at(numeros_pares,4,10)
[2, 4, 6, 8, 10, 12]
iex> numeros_pares = List.insert_at(numeros_pares,-1,14)
[2, 4, 6, 8, 10, 12, 14]
"""

# • Concatenar dos listas
"""
iex> numeros_naturales = [1,2,3,4] ++ [5,6,7,8]
[1, 2, 3, 4, 5, 6, 7, 8]
iex> numeros_naturales
[1, 2, 3, 4, 5, 6, 7, 8]
"""

# • Recursion sobre listas
# – El formato de una lista es [head | tail]
# – head puede ser de cualquier tipo
# – tail siempre es una lista
# – si tail es una lista vacía [], indica que es el final de la lista.
"""
iex> []
[]
iex> [1|[]]
[1]
iex> [1|[2|[]]]
[1, 2]
iex> [1|[2|[3|[]]]]
[1, 2, 3]
iex> [1|[2|[3|[4|[]]]]]
[1, 2, 3, 4]
iex> [1|[2,3,4]]
[1, 2, 3, 4]
"""

# • Funciones hd y tl
"""
iex> numeros = [1,2,3,4,5]
[1, 2, 3, 4, 5]
iex> hd(numeros)
1
iex> tl(numeros)
[2, 3, 4, 5]
iex> [head | tail] = numeros
[1, 2, 3, 4, 5]
iex> head
1
iex> tail
[2, 3, 4, 5]
"""

# • Agregar elementos a una lista
"""
iex> numeros = [0 | numeros]
[0, 1, 2, 3, 4, 5]
iex> numeros
[0, 1, 2, 3, 4, 5]
"""

# Mapas
# • par llave-valor
# • pueden ser cualquier término
"""
iex> persona = %{:nombre => "Cristian", :edad => 18, :trabajo =>"programador"}
%{edad: 18, nombre: "Cristian", trabajo: "programador"}
iex> persona
%{edad: 18, nombre: "Cristian", trabajo: "programador"}
iex> consonantes = %{:z => "zeta", :m => "eme", :x => "equis", :b => "be"
}
%{b: "be", m: "eme", x: "equis", z: "zeta"}
iex> consonantes = %{:z => "zeta", :m => "eme", :x => "equis", :b => "be"
, :n => "ene"}
%{b: "be", m: "eme", n: "ene", x: "equis", z: "zeta"}
iex> consonantes = %{:z => "zeta", :m => "eme", :x => "equis", :b => "be"
, :n => "ene", :a => "aaaa"}
%{a: "aaaa", b: "be", m: "eme", n: "ene", x: "equis", z: "zeta"}
"""

# Cristian Armando Larios Bravo
# • Otra forma de representar los mapas:
"""
iex> %{nombre: "Cristian", paterno: "Larios", edad: 18}
%{edad: 18, nombre: "Cristian", paterno: "Larios"}
"""


# • Acceder a un elementro a través de su llave
"""
iex> persona = %{:nombre => "Cristian", :edad => 18, :trabajo =>"programador"}
%{edad: 18, nombre: "Cristian", trabajo: "programador"}
iex> persona[:nombre]
"Cristian"
iex> persona[:edad]
18
iex> persona[:apellido]
nil
"""

# • Ventajas de usar atoms como llave

"""
iex> persona.nombre
"Cristian"
iex> persona.edad
18
iex> persona.apellido
** (KeyError) key :apellido not found in: %{edad: 18, nombre: "Cristian", tra
bajo: "programador"}
• Insertar un nuevo llave-par
iex> Map.put(persona, :apellido, "Larios")
%{apellido: "Larios", edad: 18, nombre: "Cristian", trabajo: "programador"}
iex> persona
%{edad: 18, nombre: "Cristian", trabajo: "programador"}
"""

# • Insertar un nuevo llave-par

"""
iex> Map.put(persona, :apellido, "Larios")
%{apellido: "Larios", edad: 18, nombre: "Cristian", trabajo: "Programador"}
iex> persona
%{edad: 18, nombre: "Cristian", trabajo: "Programador"}
"""

# • Obtener el valor de una llave con Map

"""
iex> Map.get(persona, :nombre)
"Cristian"
iex> persona.nombre
"Cristian"
iex> persona[:nombre]
"Cristian"
"""

# Binaries
# • Un binary es un grupo de bytes
# • cada numero representa un valor que corresponde a un byte
# • cualquier valor mayor a 255 se trunca al valor en byte

"""
iex(14)> <<1,2,3,4,5>>
<<1, 2, 3, 4, 5>>
iex> <<255>>
<<255>>
iex> <<256>>
<<0>>
iex> <<257>>
<<1>>
iex> <<512>>
<<0>>
"""

# Strings (Binary Strings)
# • No existe un tipo String dedicado
# • Los Strings se representan como binary o list
# • Lo más sencillo es usar dobles comillas

"""
iex> "Esto es un String"
"Esto es un String"
"""

# • Se pueden insertar expresiones en las cadenas (interpolación de cadenas)
# mediante #{}
"""
iex> "El cuadrado de 2 es #{2*2}"
"El cuadrado de 2 es 4"
"""

# • Secuencias de escape:
# – "
# – \"
# – \t
IO.puts("1. Este es un mensaje")
IO.puts("2. Este es un  \n mensaje")
IO.puts("3. Este es un \"mensaje\"")
IO.puts("4. Este es un \\mensaje\\")
IO.puts("5. Este \t es \tun \t mensaje")
IO.puts("4. Este
es un
mensaje")

"""
Salida
>elixir main.ex
1. Este es un mensaje
2. Este es un
 mensaje
3. Este es un "mensaje"
4. Este es un \mensaje\
5. Este es un mensaje
4. Este
 es un
 mensaje

"""


# • sigils
IO.puts(~s("este es un ejemplo de sigil" apuntes de Elixir))
IO.puts("Este \t es \tun \t mensaje")
IO.puts(~S("Este \t es \tun \t mensaje"))

"""
Salida
"este es un ejemplo de sigil" apuntes de Elixir
Este es un mensaje
"Este \t es \tun \t mensaje"
"""

# • Concatenación de Cadenas
defmodule Cadena do
  def concatenar(cad1, cad2, separador \\ " ") do
    cad1 <> separador <> cad2
  end
end

IO.puts(Cadena.concatenar("Hola", "Mundo"))
IO.puts(Cadena.concatenar("Hola", "Mundo", "<->"))

"""
Salida
>elixir main.ex
Hola Mundo
Hola<->Mundo
"""

# Pattern Matching
# • Operador pin: ^
# • Evita la refijación (rebind)
"""
iex> x = 3
3
iex> 3 = x
3
iex> 5 = x
** (MatchError) no match of right hand side value: 3
iex> x = 5
5
iex> x
5
iex> ^x = 5
5
iex> ^x = 10
** (MatchError) no match of right hand side value: 10
iex> 10 = x
** (MatchError) no match of right hand side value: 5
• Tuplas
iex> leer_archivo_ok = {:ok, "texto del archivo"}
{:ok, "texto del archivo"}
iex> leer_archivo_error = {:error, "No se pudo leer el archivo"}
{:error, "No se pudo leer el archivo"}
iex(8)> {:ok, respuesta} = leer_archivo_ok
{:ok, "texto del archivo"}
iex(9)> respuesta
"texto del archivo"
iex(10)> {:error, respuesta} = leer_archivo_error
{:error, "No se pudo leer el archivo"}
iex(11)> respuesta
"No se pudo leer el archivo"
"""
# • Ejemplo:
"""
iex> respuesta = {:ok, "texto del archivo"}
{:ok, "texto del archivo"}
iex> case respuesta do
...> {:ok, res} -> "Operacion exitosa: Contenido #{res}"
...> {:error, res} -> "Operacion fallida: #{res}"
...> _ -> "Valor por default"
...> end
"Operacion exitosa: Contenido texto del archivo"
iex> respuesta = {:error, "No se pudo leer el archivo"}
{:error, "No se pudo leer el archivo"}
iex> case respuesta do
...> {:ok, res} -> "Operacion exitosa: Contenido #{res}"
...> {:error, res} -> "Operacion fallida: #{res}"
...> _ -> "Valor por default"
...> end
"Operacion fallida: No se pudo leer el archivo"
"""

# • Listas
"""
iex> [head | tail] = [1,2,3,4]
[1, 2, 3, 4]
iex> head
1
iex> tail
[2, 3, 4]
iex> [head | _] = [1,2,3,4]
[1, 2, 3, 4]
iex> head
1
iex> [_ | tail] = [1,2,3,4]
[1, 2, 3, 4]
iex> tail
[2, 3, 4]
iex> mi_lista = [1,2,3,4]
[1, 2, 3, 4]
iex> [1,2,x,4] = mi_lista
[1, 2, 3, 4]
iex> x
3
"""

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

"""
Salida
>elixir main.ex
{:error, "No se puede dividir por 0"}
{:ok, "El resultado es: 1.6666666666666667"}
"""

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

"""
Salida
>elixir main.ex
warning: this clause for div/2 cannot match because a previous clause at
line 2 always matches
 main.ex:5
** (ArithmeticError) bad argument in arithmetic expression
 main.ex:3: Calculadora.div/2
 main.ex:10: (file)
 (elixir 1.10.4) lib/code.ex:926: Code.require_file/2
"""

# Guardas
defmodule Numero do
  def cero?(0), do: true
  def cero?(n) when is_integer(n), do: false
  def cero?(_), do: "No es entero"
end

IO.puts(Numero.cero?(0))
IO.puts(Numero.cero?(2))
IO.puts(Numero.cero?("3"))

"""
Salida
>elixir main.ex
true
false
No es entero

"""

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

"""
Salida
iex> c("main.ex")
[Persona1]
iex> Persona1.sexo(:m)
"Masculino"
iex> Persona1.sexo(:f)
"Femenino"
iex> Persona1.sexo(:x)
"Femenino"
"""

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

"""
Salida
iex> c("main.ex")
[Persona2]
iex> Persona2.sexo(:m)
"Masculino"
iex> Persona2.sexo(:f)
"Femenino"
iex> Persona2.sexo(:x)
"Sexo desconocido"
"""

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

"""
Salida
iex> c("main.ex")
[Persona3]
iex> Persona3.sexo(:m)
"Masculino"
iex> Persona3.sexo(:f)
"Femenino"
iex> Persona3.sexo(:x)
"Sexo desconocido"
"""

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

"""
Salida
iex> c("main.ex")
[Persona4]
iex> Persona4.sexo(:m)
"Masculino"
iex> Persona4.sexo(:f)
"Femenino"
iex> Persona4.sexo(:x)
"sexo desconocido"
"""

# Match con funciones
# • Ejemplo 2
defmodule Persona5 do
  def sexo(sex) when sex == :m, do: "Masculino"
  def sexo(sex) when sex == :f, do: "Femenino"
  def sexo(_sex), do: "Sexo desconocido"
end

"""
Salida
iex> c("main.ex")
[Persona5]
iex> Persona5.sexo(:m)
"Masculino"
iex> Persona5.sexo(:f)
"Femenino"
iex> Persona5.sexo(:x)
"sexo desconocido"

"""

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

"""
Salida
iex> c("main.ex")
[Persona6]
iex> Persona6.sexo(:m)
"Masculino"
iex> Persona6.sexo(:f)
"Femenino"
iex> Persona6.sexo(:x)
"Sexo desconocido"
"""

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

"""
Salida
>elixir main.exs
9
1
1.25
"No se puede dividir por 0"
20
9
"""

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

"""
Salida
>elixir main.ex
Lunes
Martes
Miercoles
Jueves
Viernes
Sabado
Domingo
El dia no es valido
"""

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

"""
Salida
>elixir main.ex
Lunes
Martes
Miercoles
Jueves
Viernes
Sabado
Domingo
Lunes
Martes
Miercoles
Jueves
Viernes
Sabado
Domingo
El dia no es valido
El dia no es valido
"""

# CALB
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

"""
Salida
>elixir main.ex
Lunes
Martes
Miercoles
Jueves
Viernes
Sabado
Domingo
Lunes
Martes
Miercoles
Jueves
Viernes
Sabado
Domingo
Martes
Martes
"""

# unless
# • Ejemplo 1
defmodule MayorDeEdad do
  def mayor1(edad) do
    unless edad >= 18 do
      "Es menor de edad"
    end
  end
end

"""
Salida
> c("main.ex")
[MayorDeEdad]
iex> MayorDeEdad.mayor(16)
"Es menor de edad"
iex> MayorDeEdad.mayor1(18)
nil
"""

# unless
# • Ejemplo 2
defmodule MayorDeEdad do
  def mayor1(edad) do
    unless edad >= 18 do
      "Es menor de edad"
    end
  end
end

"""
Salida
iex> c("main.ex")
[MayorDeEdad]
iex> MayorDeEdad.mayor1(16)
"Es menor de edad"
iex> MayorDeEdad.mayor2(16)
"Es menor de edad"
iex(61)> MayorDeEdad.mayor1(18)
nil
iex(62)> MayorDeEdad.mayor2(18)
nil
"""

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

"""
Salida
>elixir main.ex
9
10

"""

# CALB
# Ejemplos de funciones anónimas
# • Ejemplo 2
mayor? = fn(n1,n2) -> if n1 > n2 do true else false end end

IO.inspect(mayor?.(4,5))
IO.inspect(mayor?.(5,4))
IO.inspect(mayor?.(5,5))

"""
• Salida
>elixir main.exs
false
true
false

"""

# • Ejemplo de función anónima
# • Si se desea personalizar la salida
mayor? = fn(n1,n2) -> if n1 > n2 do :si else :no end end

IO.inspect(mayor?.(4,5))
IO.inspect(mayor?.(5,4))

"""
Salida
>elixir main.exs
:no
:si

"""

# Ejemplos de funciones anónimas
# • Ejemplo 3
mayor? = fn(n1,n2) -> if n1 > n2 do: si else :no end end
res = mayor?.(4,5)
IO.puts res
res = mayor?.(5,4)
IO.puts res

"""
Salida
>elixir main.exs
no
si
"""

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

"""
Salida
>elixir main.exs
{:error, "4 <= 5"}
{:ok, "5 > 4"}
{:error, "5 <= 5"}
"""

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

"""
Salida
>elixir main.exs
error
4 <= 5
ok
5 > 4
"""

# Cristian Larios
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

"""
Salida
>elixir main.ex
[2, 3, 4, 5]
2
[3, 4, 5]
2
3
[4, 5]
5
4
[5]
9
5
[]
14
EL resultado es: 196
"""

# • Solución 1
defmodule PipeTest do
  def cuadrado(n), do: n*n

  def suma(lista) do
    Enum.sum(lista)
  end
end

IO.puts("#{PipeTest.cuadrado(PipeTest.suma(tl([,1.2.3.4.5])))}")

"""
>elixir main.ex
196
"""

# • Solución 2
defmodule PipeTest do
  def cuadrado(n), do: n*n

  def suma(lista) do
    Enum.sum(lista)
  end

  def csc(lista) do
    lista
    |> tl
    |> suma
    |> cuadrado
  end
end

IO.puts("#{PipeTest.csc([1,2,3,4,5])}")

"""
Salida
>elixir main.ex
196
"""

# • Herramienta de depuración (debugging)
defmodule PipeTest do
  def cuadrado(n), do: n*n

  def suma(lista) do
    Enum.sum(lista)
  end

  def csc(lista) do
    lista
    |> tl
    |> IO.inspect
    |> suma
    |> IO.inspect
    |> cuadrado
  end
end

IO.puts("#{PipeTest.csc([1,2,3,4,5])}")

"""
Salida
>elixir main.ex
[2, 3, 4, 5]
14
196
"""

# Cristian Larios
# Loops y recursión
# Rangos (range)
# • Representan una secuencia de números
# • Se definen con un límite inferior y un límite superior
# • Son inclusivos
# • Se separan con dos puntos (..)
# • Son equivalentes a una lista:
# – 1..10 -> [1,2,3,4,5,6,7,8,9,10]
# • Es más eficiente que una lista de números secuenciales, puesto que solo se
# almacenan dos enteros, el del inicio y el del final
# • Son enumerables, cada número se genera conforme se itere sobre el rango
# • La función Enum puede usarse con rangos
# • Ejemplo:
"""
iex> 1..01
1..1
iex> 1..10
1..10
iex> li..ls = 1..10
1..10
iex> li
1
iex> ls
10
iex> li = 10
10
iex> ls = 20
20
iex> li..ls
10..20
iex> ls..li
20..10
"""
# • Se puede generar una lista a partir de un rango
"""
iex> Enum.to_list(10..1)
[10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
"""
# • Contar cuantos elementos hay en el rango
"""
iex> rango = 10..25
10..25
iex> Enum.count(rango)
16
"""
# • Determinar si un elemento x se encuentra dentro del rango
"""
iex> rango = 10..25
10..25
iex> Enum.member?(rango,9)
false
iex> Enum.member?(rango,20)
true
"""
# • otra forma de saberlo es con el operador in
"""
iex> 9 in rango
false
iex> 20 in rango
true
"""


# • Funciones de Enum
# EmptyError OutOfBoundsError all?/1
# all?/2 any?/1 any?/2
# at/2 at/3 chunk_by/2
# chunk_every/2 chunk_every/3 chunk_every/4
# chunk_while/4 concat/1 concat/2
# count/1 count/2 dedup/1
# dedup_by/2 drop/2 drop_every/2
# drop_while/2 each/2 empty?/1
# fetch!/2 fetch/2 filter/2
# find/2 find/3 find_index/2
# find_value/2 find_value/3 flat_map/2
# flat_map_reduce/3 frequencies/1 frequencies_by/2
# group_by/2 group_by/3 intersperse/2
# into/2 into/3 join/1
# join/2 map/2 map_every/3
# map_intersperse/3 map_join/2 map_join/3
# map_reduce/3 max/1 max/3
# max_by/2 max_by/4 member?/2
# min/1 min/3 min_by/2
# min_by/4 min_max/1 min_max/2
# min_max_by/2 min_max_by/3 random/1
# reduce/2 reduce/3 reduce_while/3
# reject/2 reverse/1 reverse/2
# reverse_slice/3 scan/2 scan/3
# shuffle/1 slice/2 slice/3
# sort/1 sort/2 sort_by/2
# sort_by/3 split/2 split_while/2
# split_with/2 sum/1 take/2
# take_every/2 take_random/2 take_while/2
# to_list/1 uniq/1 uniq_by/2
# unzip/1 with_index/1 with_index/2
# zip/1 zip/2

# Cristian Larios
# for
# • Ejemplo 1
# • Contar del 1 al 10
for x <- 1..10 do
  IO.puts(x)
end

"""
Salida
>elixir main.exs
1
2
3
4
5
6
7
8
9
10
"""

# • Ejemplo 2
# • Sumar todos los números entre 1 y 10
sum = 0
for x <- 1..10 do
  sum = sum + x
end
IO.inspect(sum)

"""
Salida
>elixir main.exs
warning: variable "sum" is unused (if the variable is not meant to be use
d, prefix it with an underscore)
 main.exs:4
warning: the result of the expression is ignored (suppress the warning by
assigning the expression to the _ variable)
 main.exs:4
0
"""

# • Quitando sum para evitar los warnings
for x <- 1..10 do
  sum = sum + x
end
IO.inspect(sum)

"""
Salida
>elixir main.exs
warning: variable "sum" does not exist and is being expanded to "sum()",
please use parentheses to remove the ambiguity or change the variable nam
e
 main.exs:2
** (CompileError) main.exs:2: undefined function sum/0
 (stdlib 3.13) lists.erl:1354: :lists.mapfoldl/3

"""

# • Asignando el for a la variable sum
# • Eliminando el acumulador dentro del for

sum = for x <- 1..10 do
  x
end
IO.inspect(sum)

"""
Salida
>elixir main.exs
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
"""

# • Al saber que lo que genera es una lista, se puede utilizar la función sum del
# módulo Enum
sum = for x <- 1..10 do
  x
end
IO.puts Enum.sum(sum)

"""
Salida
>elixir main.exs
55
"""

# • Se puede expresar en una sola línea de código:
IO.puts Enum.sum(1..10)

"""
Salida
>elixir main.exs
55
"""

# Hacer un programa recursivo que imprima n veces un mensaje
defmodule Repetir do
  def imprimir(msg, n) when n <= 1 do
    IO.puts("#{n}: #{msg}")
  end

  def imprimir(msg, n) do
    IO.puts("#{n}: #{msg}")
    imprimir(msg, n-1)
  end
end

Repetir.imprimir("Hola", 10)

"""
Salida
>elixir main.exs
10: Hola
9: Hola
8: Hola
7: Hola
6: Hola
5: Hola
4: Hola
3: Hola
2: Hola
1: Hola
"""

# Invertir el orden de los números
defmodule Repetir do
  def imprimir(msg, n ls) when n >= ls do
    IO.puts("#{n}: #{msg}")
  end

  def imprimir(msg, n, ls) do
    IO.puts("#{n}: #{msg}")
    imprimir(msg, n+1, ls)
  end
end

Repetir.imprimir("Hola", 1, 10)

"""
Salida
>elixir main.exs
1: Hola
2: Hola
3: Hola
4: Hola
5: Hola
6: Hola
7: Hola
8: Hola
9: Hola
10: Hola
"""

# Escribir un programa recursivo que sume todos los elementos de una serie
# de números en una lista

defmodule Matematicas do
  def sum_list([], suma), do: suma
  def sum_list([head | tail], suma) do
    sum_list(tail, suma + head)
  end
end

IO.puts(Matematicas.sum_list([1,2,3,4,5,6,7,8,9,10], 0))
IO.puts(Matematicas.sum_list([1,3,5,7,9,10,15], 0))

"""
Salida
>elixir main.exs
55
50
"""



# Obtener el promedio de 10 calificaciones entre 0 y 10 almacenadas en una
# lista

defmodule Matematicas do
  def sum_list([], suma), do: suma
  def sum_list([head | tail], suma) do
    sum_list(tail, suma + head)
  end
end

IO.puts(Matematicas.sum_list([10,5,9,9,8,5,7,9,6,5],0) / 10)

""""
Salida
>elixir main.exs
7.3
"""

# Calcular el promedio de n calificaciones entre 0 y 10 en una lista
defmodule Matematicas do
  def sum_list([], suma), do: suma
  def sum_list([head | tail], suma) do
    sum_list(tail, suma + head)
  end
  def promedio(calificaciones) do
    sum_list(calificaciones, 0) / Enum.count(calificaciones)
  end
end

IO.puts(Matematicas.promedio([10,5,9,9,8,7,9,6,5]))

""""
Salida
>elixir main.exs
7.3
"""

# La forma más sencilla es mediante el módulo Enum
calificaciones = [10,5,9,9,8,7,9,6,5]
IO.puts Enum.sum(calificaciones) / Enum.count(calificaciones)

"""
Salida
>elixir main.exs
7.3
"""

# Generar n calificaciones aleatorias entre 0 y 10 y obtener su promedio
max = 50
calificaciones = for _x <- 1..max do
  Enum.random(0..10)
end
IO.inspect(calificaciones)
IO.puts Enum.count(calificaciones)
IO.puts Enum.sum(calificaciones) / Enum.count(calificaciones)

"""
Salida
>elixir main.exs
[9, 0, 9, 5, 4, 2, 8, 0, 3, 6, 6, 1, 7, 6, 9, 3, 10, 10, 2, 6, 2, 4, 8, 5
, 2, 6,
 7, 6, 5, 0, 8, 10, 7, 7, 10, 4, 0, 6, 0, 9, 4, 6, 10, 0, 8, 2, 6, 10, 8,
0]
50
5.32
"""

# Escriba el problema anterior con un módulo y una función, recibiendo como
# argumentos la cantidad de calificaciones a generar, así como el rango de
# calificaciones.
defmodule Estadistica do
  def promedio(max_cal, _li, _ls) when max_cal <= 1 do
    :error
  end
  def promedio(max_cal, li, ls) when max_cal > 1 do
    calificaciones = for _x <- 1..max_cal do
      Enum.random(li..ls)
    end
    Enum.sum(calificaciones) / Enum.count(calificaciones)
  end
end

IO.puts Estadistica.promedio(50, 1, 15)
IO.puts Estadistica.promedio(-5, 1, 15)

"""
Salida
>elixir main.exs
8.6
error
"""

# Hacer un programa recursivo que cuente de manera creciente de li (límite
# inferior) a ls (límite superior) para li>=ls inclusive
defmodule For_range do
  def for_to(n, ls) when n > ls do
    IO.puts "error"
  end
  def for_to(n, ls) when n >= ls do
    IO.puts n
  end
  def for_to(n, ls) do
    IO.puts n
    for_to(n + 1, ls)
  end
end
IO.puts("Contar de 1 a 10")
For_range.for_to(1, 10)

IO.puts("Contar de 12 a 5")
For_range.for_to(12, 5)

"""
Salida
>elixir main.exs
Contar de 1 a 10
1
2
3
4
5
6
7
8
9
10
Contar de 12 a 5
error
"""

# Programa que sume los valores de los números consecutivos entre li y ls
# inclusive
defmodule For_range do
  def for_to(n, ls) when n >= ls do
    n
  end

  def for_to(m, ls) do
    n + for_to(n + 1, ls)
  end
end
IO.puts("Suma de los numeros de 1 a 10")
IO.puts For_range.for_to(1,10)

IO.puts("Suma de los numeros 5 a 12")
IO.puts For_range.for_to(5,12)

"""
Salida
>elixir main.exs
suma de los numeros de 1 a 10
55
suma de los numeros 5 a 12
68
"""
