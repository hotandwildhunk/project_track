defmodule ProjectTrackWeb.ClientController do
  use ProjectTrackWeb, :controller

  alias ProjectTrack.Clients
  alias ProjectTrack.Clients.Client

  def index(conn, _params) do
    clients = Clients.list_clients()
    salesagents = Clients.list_salesagents()
    conn
    |> assign(:clients, clients)
    |> assign(:salesagents, salesagents)
    |> render("index.html")
  end

  def new(conn, _params) do
    changeset = Clients.change_client(%Client{})
    salesagents = Clients.list_salesagents()
    conn
    |> assign(:changeset, changeset)
    |> assign(:salesagents, salesagents)
    |> render("new.html")

  end

  def create(conn, %{"client" => client_params}) do
    case Clients.create_client(client_params) do
      {:ok, client} ->
        conn
        |> put_flash(:info, "Client created successfully.")
        |> redirect(to: Routes.client_path(conn, :show, client))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    client = Clients.get_client!(id)
    render(conn, "show.html", client: client)
  end

  def edit(conn, %{"id" => id}) do
    client = Clients.get_client!(id)
    salesagents = Clients.list_salesagents()
    changeset = Clients.change_client(client)
    conn
    |> assign(:client, client)
    |> assign(:salesagents, salesagents)
    |> assign(:changeset, changeset)
    |> render("edit.html")
  end

  def update(conn, %{"id" => id, "client" => client_params}) do
    client = Clients.get_client!(id)

    case Clients.update_client(client, client_params) do
      {:ok, client} ->
        conn
        |> put_flash(:info, "Client updated successfully.")
        |> redirect(to: Routes.client_path(conn, :show, client))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", client: client, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    client = Clients.get_client!(id)
    {:ok, _client} = Clients.delete_client(client)

    conn
    |> put_flash(:info, "Client deleted successfully.")
    |> redirect(to: Routes.client_path(conn, :index))
  end
end
