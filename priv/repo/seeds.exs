###############################################################################
# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     FireStarter.Repo.insert!(%FireStarter.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
###############################################################################

alias FireStarter.{Repo,Video}

### Videos ###

# Delete all prior records before seeding data.
Repo.delete_all(Video)

# Add two records.
elixir = %Video{title: "Elixir 101", duration: 120}
javascript = %Video{title: "Advanced Javascript", duration: 300}

# The basic way to add the above records is via a `Repo.insert/1` call:
#  - `Repo.insert(elixir)`
#  - `Repo.insert(javascript)`
#
# The following use of `Enum` is more Elixir idiomatic:
#  - Use of the `Enum` module for handling procedural iterations
#  - Use of the anonymous function for the insertion (via `Enum.each/2`)
#
Enum.each([elixir, javascript], &( Repo.insert(&1) ))
