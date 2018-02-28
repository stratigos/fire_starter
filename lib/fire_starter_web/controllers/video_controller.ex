defmodule FireStarterWeb.VideoController do
  use FireStarterWeb, :controller

  def index(conn, _) do
    render(conn, "index.html")
  end
end
