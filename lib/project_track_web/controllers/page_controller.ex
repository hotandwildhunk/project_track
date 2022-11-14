defmodule ProjectTrackWeb.PageController do
  use ProjectTrackWeb, :controller
  alias ProjectTrackWeb.Router.Helpers, as: Routes

  def index(conn, _params) do
    redirect(conn, to: Routes.project_path(conn, :index))
    #render(conn, "index.html")
  end
end
