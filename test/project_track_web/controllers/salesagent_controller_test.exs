defmodule ProjectTrackWeb.SalesagentControllerTest do
  use ProjectTrackWeb.ConnCase

  import ProjectTrack.SalesagentsFixtures

  @create_attrs %{email: "some email", first_name: "some first_name", last_name: "some last_name"}
  @update_attrs %{email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name"}
  @invalid_attrs %{email: nil, first_name: nil, last_name: nil}

  describe "index" do
    test "lists all salesagents", %{conn: conn} do
      conn = get(conn, Routes.salesagent_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Salesagents"
    end
  end

  describe "new salesagent" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.salesagent_path(conn, :new))
      assert html_response(conn, 200) =~ "New Salesagent"
    end
  end

  describe "create salesagent" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.salesagent_path(conn, :create), salesagent: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.salesagent_path(conn, :show, id)

      conn = get(conn, Routes.salesagent_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Salesagent"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.salesagent_path(conn, :create), salesagent: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Salesagent"
    end
  end

  describe "edit salesagent" do
    setup [:create_salesagent]

    test "renders form for editing chosen salesagent", %{conn: conn, salesagent: salesagent} do
      conn = get(conn, Routes.salesagent_path(conn, :edit, salesagent))
      assert html_response(conn, 200) =~ "Edit Salesagent"
    end
  end

  describe "update salesagent" do
    setup [:create_salesagent]

    test "redirects when data is valid", %{conn: conn, salesagent: salesagent} do
      conn = put(conn, Routes.salesagent_path(conn, :update, salesagent), salesagent: @update_attrs)
      assert redirected_to(conn) == Routes.salesagent_path(conn, :show, salesagent)

      conn = get(conn, Routes.salesagent_path(conn, :show, salesagent))
      assert html_response(conn, 200) =~ "some updated email"
    end

    test "renders errors when data is invalid", %{conn: conn, salesagent: salesagent} do
      conn = put(conn, Routes.salesagent_path(conn, :update, salesagent), salesagent: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Salesagent"
    end
  end

  describe "delete salesagent" do
    setup [:create_salesagent]

    test "deletes chosen salesagent", %{conn: conn, salesagent: salesagent} do
      conn = delete(conn, Routes.salesagent_path(conn, :delete, salesagent))
      assert redirected_to(conn) == Routes.salesagent_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.salesagent_path(conn, :show, salesagent))
      end
    end
  end

  defp create_salesagent(_) do
    salesagent = salesagent_fixture()
    %{salesagent: salesagent}
  end
end
