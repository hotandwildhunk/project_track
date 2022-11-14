# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ProjectTrack.Repo.insert!(%ProjectTrack.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias ProjectTrack.Salesagents
alias ProjectTrack.Teams
alias ProjectTrack.Statuses

sales_agent_data = [
  %{
    first_name: "John",
    last_name: "Doe",
    email: "john.doe@example.com"
  },
  %{
    first_name: "Joe",
    last_name: "Biden",
    email: "joe.biden@example.com"
  }
]

Enum.each(sales_agent_data, fn(data) ->
  Salesagents.create_salesagent(data)
end)

teams_data = [
  %{
    name: "Oxford Working Team",
    description: "A hard working team"
  },
  %{
    name: "Skyrider Team",
    description: "Flying loving team"
  }
]

Enum.each(teams_data, fn(data) ->
  Teams.create_team(data)
end)

status_data = [
  %{
    name: "On Planning"
  },
  %{
    name: "On Development"
  },
  %{
    name: "On Hold"
  },
  %{
    name: "Completed"
  }
]

Enum.each(status_data, fn(data) ->
  Statuses.create_status(data)
end)
