defmodule ProjectTrack.Repo do
  use Ecto.Repo,
    otp_app: :project_track,
    adapter: Ecto.Adapters.Postgres

  use Scrivener, page_size: 3
end
