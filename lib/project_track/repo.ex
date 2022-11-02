defmodule ProjectTrack.Repo do
  use Ecto.Repo,
    otp_app: :project_track,
    adapter: Ecto.Adapters.Postgres
end
