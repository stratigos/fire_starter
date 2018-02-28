defmodule FireStarterWeb.VideoController do
  use FireStarterWeb, :controller

  def index(conn, _) do
    text(conn, "This is the videos page!")
  end
end
