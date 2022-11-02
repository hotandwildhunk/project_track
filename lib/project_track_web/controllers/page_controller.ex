defmodule ProjectTrackWeb.PageController do
  use ProjectTrackWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
