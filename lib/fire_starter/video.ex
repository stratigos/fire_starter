defmodule FireStarter.Video do
  use Ecto.Schema
  import Ecto.Changeset
  alias FireStarter.Video


  schema "videos" do
    field :duration, :integer
    field :title, :string

    timestamps()
  end

  # Using Ecto, create a record in the data store by first casting its
  #  attributes (which are most likely Strings) according to the column types
  #  as defined in `schema/1` above, run validations on attribute values as
  #  needed, then return the Video struct.
  # This boilerplate updating routine is created via Ecto migration CLI.
  @doc false
  def changeset(%Video{} = video, attrs) do
    video
    |> cast(attrs, [:title, :duration])
    |> validate_required([:title, :duration])
  end
end
