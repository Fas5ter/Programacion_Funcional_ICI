# Unidad III: Programación Funcional
## Problemas resueltos en clase con Elixir
### Ejercicio 1.1. Crear una calculadora con excepciones
### 1.1 Descripcion del ejercicio
  Se necesita crear una calculadora que al darle un argumento vacio u 0, no provoque fallas en la ejecucion.
#### 1.2 Código
```elixir
defmodule Calculadora do
  def div(_,0) do
    {:error, "No se puede dividir por 0"}
  end
  def div(n1,n2) do
    {:ok, "El resultado es: #{n1/n2}"}
  end
end
```
 #### 1.3 Implementación
 ```elixir
IO.inspect(Calculadora.div(5,0))
IO.inspect(Calculadora.div(5,3))
 ```
#### 1.4 Salida
```
>elixir main.ex
{:error, "No se puede dividir por 0"}
{:ok, "El resultado es: 1.6666666666666667"}
```


### Ejercicio 1.2. Crear un selector de sexo al mandar un atom como argumento
### 1.1 Descripcion del ejercicio
  Se necesita crear un selector de sexo que al mandar el atom :m como argumento retorne "Masculino" y cuando se mande el atom :f como argumento retorne "Femenino" de no ser asi retorne "Sexo desconocido".
#### 1.2 Código
```elixir
defmodule Persona5 do
  def sexo(sex) when sex == :m, do: "Masculino"
  def sexo(sex) when sex == :f, do: "Femenino"
  def sexo(_sex), do: "Sexo desconocido"
end
```
#### 1.3 Implementación
```
iex> c("main.ex")
iex> Persona5.sexo(:m)
iex> Persona5.sexo(:f)
iex> Persona5.sexo(:x)
```
#### 1.4 Salida
```
[Persona5]
"Masculino"
"Femenino"
"sexo desconocido"
```

### Ejercicio 1.3. Crear una calculadora usando switch case
### 1.1 Descripcion del ejercicio
  Se necesita crear una calculadora usando la sentencia switch case.
#### 1.2 Código
```elixir
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
```
#### 1.3 Implementación
```elixir
IO.inspect Matematicas.calculadora("+",{5,4})
IO.inspect Matematicas.calculadora("-",{5,4})
IO.inspect Matematicas.calculadora("/",{5,4})
IO.inspect Matematicas.calculadora("/",{5,0})
IO.inspect Matematicas.calculadora("*",{5,4})
```
#### 1.4 Salida
```
>elixir main.exs
9
1
1.25
"No se puede dividir por 0"
20
9
```


### Ejercicio 1.4. Crear un selector de dia utilizando cond
### 1.1 Descripcion del ejercicio
  Se necesita crear un selector de dia usando la sentencia cond.
#### 1.2 Código
```elixir
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
```
#### 1.3 Implementación
```elixir
IO.puts DiaSemana.dia(1)
IO.puts DiaSemana.dia(2)
IO.puts DiaSemana.dia(3)
IO.puts DiaSemana.dia(4)
IO.puts DiaSemana.dia(5)
IO.puts DiaSemana.dia(6)
IO.puts DiaSemana.dia(7)
IO.puts DiaSemana.dia(8)
```
#### 1.4 Salida
```
>elixir main.ex
Lunes
Martes
Miercoles
Jueves
Viernes
Sabado
Domingo
El dia no es valido
```

### Ejercicio 1.5. Crear un programa que indique si la edad es menor de edad usando unless.
### 1.1 Descripcion del ejercicio
  Se necesita crear un programa que indique si es menor de edad usando la sentencia unless.
#### 1.2 Código
```elixir
defmodule MayorDeEdad do
  def mayor1(edad) do
    unless edad >= 18 do
      "Es menor de edad"
    end
  end
end
```
#### 1.3 Implementación
```
iex> c("main.ex")
iex> MayorDeEdad.mayor1(16)
iex> MayorDeEdad.mayor2(16)
iex(61)> MayorDeEdad.mayor1(18)
iex(62)> MayorDeEdad.mayor2(18)
```
#### 1.4 Salida
```
[MayorDeEdad]
"Es menor de edad"
"Es menor de edad"
nil
nil
```

### Ejercicio 1.6. Crear una calculadora usando funciones anonimas
### 1.1 Descripcion del ejercicio
  Se necesita crear una calculadora usando funciones anonimas.
#### 1.2 Código
```elixir
defmodule Calculadora do
  def suma(n1,n2), do: n1+n2
end
suma_anonima = fn(n1,n2) -> n1 + n2 end
```
#### 1.3 Implementación
```elixir
IO.puts(Calculadora.suma(5,4))
IO.puts(Suma_anonima(5,5))
```
#### 1.4 Salida
```
>elixir main.ex
9
10
```

### Ejercicio 1.7. Dada una lista con n numeros, se desea obtener el cuadrado de la suma de los elementos de la cola.
### 1.1 Descripcion del ejercicio
  Si la lista es [1,2,3,4,5], el resultado es (2+3+4+5)^2 ### csc = cuadrado(suma(2,3,4,5))
#### 1.2 Código
```elixir
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
```
#### 1.3 Implementación
```elixir
IO.puts("El resultado es: #{sum*sum}")
```
#### 1.4 Salida
```
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
```

### Ejercicio 1.8. Escribir un programa recursivo que sume todos los elementos de una serie de números en una lista
### 1.1 Descripcion del ejercicio
  Se necesita crear un programa que sume todos los elementos de una serie de numeros en una lista a traves de dos funciones en un modulo
#### 1.2 Código
```elixir
defmodule Matematicas do
  def sum_list([], suma), do: suma
  def sum_list([head | tail], suma) do
    sum_list(tail, suma + head)
  end
end
```
#### 1.3 Implementación
```elixir
IO.puts(Matematicas.sum_list([1,2,3,4,5,6,7,8,9,10], 0))
IO.puts(Matematicas.sum_list([1,3,5,7,9,10,15], 0))
```
#### 1.4 Salida
```
>elixir main.exs
55
50
```
