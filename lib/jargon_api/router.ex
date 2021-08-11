defmodule JargonApi.Router do
  @moduledoc """
  The router handles incoming HTTP requests and is the front-facing part of the API.
  """

  use Plug.Router

  plug(Plug.Logger)

  plug :match

  plug Plug.Parsers,
    parsers: [:json],
    json_decoder: Poison

  plug :dispatch

  # --- API starts here

  get "/lookup" do
    body =
      conn.query_params["word"]
      |> JargonApi.Jargon.get_definition
      |> Poison.encode!

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, body)
  end

  # Catch anything else
  match _ do
    send_resp(conn, 404, "not found")
  end
end
