defmodule ProjectTrackWeb.ProjectController do
  use ProjectTrackWeb, :controller

  alias ProjectTrack.Projects
  alias ProjectTrack.Projects.Project

  import ProjectTrackWeb.UserAuth, only: [require_authenticated_user: 2]

  plug :require_authenticated_user when action not in [:index, :show]

  def index(conn, params) do
    search = Projects.search(params)
    projects = Projects.list_projects(params)
    teams = Projects.list_teams()
    clients = Projects.list_clients()
    statuses = Projects.list_statuses()
    conn
    |> assign(:search, search)
    |> assign(:projects, projects)
    |> assign(:teams, teams)
    |> assign(:clients, clients)
    |> assign(:statuses, statuses)
    |> render("index.html")
  end

  def new(conn, _params) do
    changeset = Projects.change_project(%Project{})
    teams = Projects.list_teams()
    clients = Projects.list_clients()
    statuses = Projects.list_statuses()
    conn
    |> assign(:changeset, changeset)
    |> assign(:teams, teams)
    |> assign(:clients, clients)
    |> assign(:statuses, statuses)
    |> render("new.html")
  end

  def create(conn, %{"project" => project_params}) do
    case Projects.create_project(project_params) do
      {:ok, project} ->
        conn
        |> put_flash(:info, "Project created successfully.")
        |> redirect(to: Routes.project_path(conn, :show, project))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    project = Projects.get_project!(id)
    render(conn, "show.html", project: project)
  end

  def edit(conn, %{"id" => id}) do
    project = Projects.get_project!(id)
    teams = Projects.list_teams()
    clients = Projects.list_clients()
    statuses = Projects.list_statuses()
    changeset = Projects.change_project(project)
    conn
    |> assign(:project, project)
    |> assign(:teams, teams)
    |> assign(:clients, clients)
    |> assign(:statuses, statuses)
    |> assign(:changeset, changeset)
    |> render("edit.html")
  end

  def update(conn, %{"id" => id, "project" => project_params}) do
    project = Projects.get_project!(id)

    case Projects.update_project(project, project_params) do
      {:ok, project} ->
        conn
        |> put_flash(:info, "Project updated successfully.")
        |> redirect(to: Routes.project_path(conn, :show, project))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", project: project, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    project = Projects.get_project!(id)
    {:ok, _project} = Projects.delete_project(project)

    conn
    |> put_flash(:info, "Project deleted successfully.")
    |> redirect(to: Routes.project_path(conn, :index))
  end
end
