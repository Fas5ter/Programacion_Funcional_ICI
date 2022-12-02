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

### Ejercicio 1.4. Crear una calculadora usando switch case
### 1.1 Descripcion del ejercicio
  Se necesita crear una calculadora usando la sentencia switch case.
#### 1.2 Código
#### 1.3 Implementación
#### 1.4 Salida


### Ejercicio 1.4. Crear una calculadora usando switch case
### 1.1 Descripcion del ejercicio
  Se necesita crear una calculadora usando la sentencia switch case.
#### 1.2 Código
#### 1.3 Implementación
#### 1.4 Salida


### Ejercicio 1.4. Crear una calculadora usando switch case
### 1.1 Descripcion del ejercicio
  Se necesita crear una calculadora usando la sentencia switch case.
#### 1.2 Código
#### 1.3 Implementación
#### 1.4 Salida


### Ejercicio 1.4. Crear una calculadora usando switch case
### 1.1 Descripcion del ejercicio
  Se necesita crear una calculadora usando la sentencia switch case.
#### 1.2 Código
#### 1.3 Implementación
#### 1.4 Salida
