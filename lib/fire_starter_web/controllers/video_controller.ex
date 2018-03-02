defmodule FireStarterWeb.VideoController do
  use FireStarterWeb, :controller

  alias FireStarter.Screencast

  def index(conn, _) do
    videos = Screencast.list_videos()

    render(conn, "index.html", videos: videos)
  end

  def new(conn, _) do
    # Since this is a new record, the changeset consists of an empty Struct,
    #  with an empty Map applied to it (as opposed to a key-val of some sort
    #  with attributes and values).
    # @see Screencast.change_video/0
    changeset = Screencast.change_video()

    # Pass this empty changeset to the template.
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"video" => video_params}) do
    # Create the record.
    # Since this is the POST-ed data matching the request after `new/2` above,
    #  the `changeset` is now an empty, or _new_ Struct. The key-val (a Map,
    #  created from pattern matching against the request params passed to
    #  `create/2`) argument now contains attributes and designated values.
    # On success, return a standard Elixir tuple containing the record. Display
    #  a flash message to the user.
    # On fail, load the changeset into the template for `new/2` and re-render.
    #  Display a failure message to the user.
    # @see Screencast.create_video/1
    case Screencast.create_video(video_params) do
      # On success, the Video record would be returned, but it isn't needed, so
      #  it is replaced with the `_` char to denote it is being ignored. Then,
      #  an anonymous function is called which handles setting the flash msg
      #  and redirecting back to the index page, within the context of the
      #  current connection.
      # On fail, the Video record's requested data is relevant, so the tuple
      #  contains a pattern-matched Map of attrs and vals. Just like above, an
      #  anon func is created, and the current connection's flash and rendering
      #  are handled.
      {:ok, _} ->
        conn
          |> put_flash(:info, "Video created successfully!")
          |> redirect(to: video_path(conn, :index))
      {:error, changeset} ->
        conn
          |> put_flash(:error, "Please check the form for errors.")
          |> render("new.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => video_id}) do
    Screencast.delete_video(video_id)

    conn
      |> put_flash(:info, "Video deleted successfully")
      |> redirect(to: video_path(conn, :index))
  end

end
