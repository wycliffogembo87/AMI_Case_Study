defmodule ExAssignment.KeyValueStore do
  use Agent

  @doc """
  Starts a new key_value_store.
  """
  def start_link(_opts) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  @doc """
  Gets a value from the `key_value_store` by `key`.
  """
  def get(key) do
    Agent.get(__MODULE__, &Map.get(&1, key))
  end

  @doc """
  Puts the `value` for the given `key` in the `key_value_store`.
  """
  def put(key, value) do
    Agent.update(__MODULE__, &Map.put(&1, key, value))
  end

  @doc """
  Deletes the `value` for the given `key` from the `key_value_store`.
  """
  def delete(key) do
    Agent.update(__MODULE__, &Map.delete(&1, key))
  end
end
