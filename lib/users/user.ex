defmodule Flightex.Users.User do
  @keys [:name, :email, :cpf, :id]
  @enforce_keys @keys
  defstruct @keys

  def build(_, _, _, cpf) when not is_bitstring(cpf), do: {:error, "Cpf must be a String"}

  def build(id, name, email, cpf) do
    {:ok,
     %__MODULE__{
       id: id,
       name: name,
       email: email,
       cpf: cpf
     }}
  end

  def build(_, _, cpf) when not is_bitstring(cpf), do: {:error, "Cpf must be a String"}

  def build(name, email, cpf) do
    {:ok,
     %__MODULE__{
       id: UUID.uuid4(),
       name: name,
       email: email,
       cpf: cpf
     }}
  end
end
