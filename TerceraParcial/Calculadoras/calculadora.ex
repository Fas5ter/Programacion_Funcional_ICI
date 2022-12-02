defmodule Calculadora1 do
  def suma(n1,n2) do
    n1 + n2
  end
  def resta(n1,n2) do
    n1 - n2
  end
  def multiplicacion(n1,n2) do
    n1 * n2
  end
  def division(n1,n2) do
    n1 / n2
  end
end

defmodule Calculadora2 do
  def suma(n1,n2), do: n1+n2
  def resta(n1,n2), do: n1-n2
  def multiplicacion(n1,n2), do: n1*n2
  def division(n1,n2), do: n1/n2
end

defmodule DistCalculator do
  def suma(n1,n2) do
    IO.puts(n1+n2)
  end
end


# Pagina 36 de shell erlang ejercicios
# Pagina 50 de shell de elixir 
