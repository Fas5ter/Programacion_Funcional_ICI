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
 ```dart
IO.inspect(Calculadora.div(5,0))
IO.inspect(Calculadora.div(5,3))
 ```
#### 1.4 Salida
```
>elixir main.ex
{:error, "No se puede dividir por 0"}
{:ok, "El resultado es: 1.6666666666666667"}
```
### Ejercicio 1.1. Crear una calculadora con excepciones
### 1.1 Descripcion del ejercicio
  Se necesita crear una calculadora que al darle un argumento vacio u 0, no provoque fallas en la ejecucion.
#### 1.2 Código
```

```
#### 1.3 Implementación
```

```
#### 1.4 Salida
```

```








