defmodule FireStarterWeb.VideoController do
  use FireStarterWeb, :controller

  alias FireStarter.{Repo,Video}

  def index(conn, _) do
    videos = Repo.all(Video)

    render(conn, "index.html", videos: videos)
  end

  def new(conn, _) do
    render(conn, "new.html")
  end

end
