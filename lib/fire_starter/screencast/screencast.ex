# Encapsulate logic pertaining to querying and persisting any data abstractions
#  related to videos.
defmodule FireStarter.Screencast do

  alias FireStarter.{Repo, Video}

  def list_videos do
    Repo.all(Video)
  end

  # Load an empty changeset into a Video Struct.
  # @see Video.changeset/2
  def change_video() do
    Video.changeset(%Video{}, %{})
  end

  # Persist a new Video record by applying changed attributes and values to
  #  an empty Video Struct.
  def create_video(params) do
    changeset = Video.changeset(%Video{}, params)

    Repo.insert(changeset)
  end

  # Delete a Video record.
  def delete_video(id) do
    # Note the idiomatic way of piping values into subsequent functions.
    Video
      |> Repo.get(id)
      |> Repo.delete
  end

end
