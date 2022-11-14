defmodule ProjectTrackWeb.MemberController do
  use ProjectTrackWeb, :controller

  alias ProjectTrack.Members
  alias ProjectTrack.Members.Member

  import ProjectTrackWeb.UserAuth, only: [require_authenticated_user: 2]

  plug :require_authenticated_user when action not in [:index, :show]

  def index(conn, _params) do
    members = Members.list_members()
    teams = Members.list_teams()
    conn
    |> assign(:members, members)
    |> assign(:teams, teams)
    |> render("index.html")
    #render(conn, "index.html", members: members)
  end

  def new(conn, _params) do
    changeset = Members.change_member(%Member{})
    teams = Members.list_teams()
    conn
    |> assign(:changeset, changeset)
    |> assign(:teams, teams)
    |> render("new.html")
    #render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"member" => member_params}) do
    case Members.create_member(member_params) do
      {:ok, member} ->
        conn
        |> put_flash(:info, "Member created successfully.")
        |> redirect(to: Routes.member_path(conn, :show, member))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    member = Members.get_member!(id)
    render(conn, "show.html", member: member)
  end

  def edit(conn, %{"id" => id}) do
    member = Members.get_member!(id)
    teams = Members.list_teams()
    changeset = Members.change_member(member)
    conn
    |> assign(:member, member)
    |> assign(:teams, teams)
    |> assign(:changeset, changeset)
    |> render("edit.html")
    #render(conn, "edit.html", member: member, changeset: changeset)
  end

  def update(conn, %{"id" => id, "member" => member_params}) do
    member = Members.get_member!(id)

    case Members.update_member(member, member_params) do
      {:ok, member} ->
        conn
        |> put_flash(:info, "Member updated successfully.")
        |> redirect(to: Routes.member_path(conn, :show, member))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", member: member, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    member = Members.get_member!(id)
    {:ok, _member} = Members.delete_member(member)

    conn
    |> put_flash(:info, "Member deleted successfully.")
    |> redirect(to: Routes.member_path(conn, :index))
  end
end
