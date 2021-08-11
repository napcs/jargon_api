defmodule JargonApi.Jargon do
  @moduledoc """
  This module holds the jargon terms and definitions.
  """

  @data %{
      "OKR" => "Objectives and Key Results",
      "API" => "Application Programming Interface",
      "DDoS" => "Distributed Denial of Service"
    }

  def get_definition(word) do
    case @data[word] do
      nil -> %{word: word, definition: "No definition found."}
      result -> %{word: word, definition: result}
    end
  end


end
