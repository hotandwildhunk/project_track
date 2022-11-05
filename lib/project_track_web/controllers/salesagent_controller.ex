defmodule ProjectTrackWeb.SalesagentController do
  use ProjectTrackWeb, :controller

  alias ProjectTrack.Salesagents
  alias ProjectTrack.Salesagents.Salesagent

  def index(conn, _params) do
    salesagents = Salesagents.list_salesagents()
    render(conn, "index.html", salesagents: salesagents)
  end

  def new(conn, _params) do
    changeset = Salesagents.change_salesagent(%Salesagent{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"salesagent" => salesagent_params}) do
    case Salesagents.create_salesagent(salesagent_params) do
      {:ok, salesagent} ->
        conn
        |> put_flash(:info, "Salesagent created successfully.")
        |> redirect(to: Routes.salesagent_path(conn, :show, salesagent))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    salesagent = Salesagents.get_salesagent!(id)
    render(conn, "show.html", salesagent: salesagent)
  end

  def edit(conn, %{"id" => id}) do
    salesagent = Salesagents.get_salesagent!(id)
    changeset = Salesagents.change_salesagent(salesagent)
    render(conn, "edit.html", salesagent: salesagent, changeset: changeset)
  end

  def update(conn, %{"id" => id, "salesagent" => salesagent_params}) do
    salesagent = Salesagents.get_salesagent!(id)

    case Salesagents.update_salesagent(salesagent, salesagent_params) do
      {:ok, salesagent} ->
        conn
        |> put_flash(:info, "Salesagent updated successfully.")
        |> redirect(to: Routes.salesagent_path(conn, :show, salesagent))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", salesagent: salesagent, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    salesagent = Salesagents.get_salesagent!(id)
    {:ok, _salesagent} = Salesagents.delete_salesagent(salesagent)

    conn
    |> put_flash(:info, "Salesagent deleted successfully.")
    |> redirect(to: Routes.salesagent_path(conn, :index))
  end
end
