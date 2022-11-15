# ProjectTrack

This is a simple app using Elixir + Phoenix to demostrate relational database, CRUD (Create, Retrieve, Update and Delete), Search form and pagination. Also implementing user's authentication to validate the user's access to create, update and delete. 

## Version

Elixir Version 1.12
Phonix Version 1.6.12

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`
  
To populate tables such as Sales Agent, Team and Status with dummy data:
	
  * Populate with `mix run priv/repo/seeds.exs`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Screenshot

![Relationship Diagram](Project_track_relationship_diagram.png)
Tables Relationship Diagram

![Front Page](front_page.png)
Front Page