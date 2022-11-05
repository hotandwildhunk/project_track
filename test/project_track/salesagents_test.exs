defmodule ProjectTrack.SalesagentsTest do
  use ProjectTrack.DataCase

  alias ProjectTrack.Salesagents

  describe "salesagents" do
    alias ProjectTrack.Salesagents.Salesagent

    import ProjectTrack.SalesagentsFixtures

    @invalid_attrs %{email: nil, first_name: nil, last_name: nil}

    test "list_salesagents/0 returns all salesagents" do
      salesagent = salesagent_fixture()
      assert Salesagents.list_salesagents() == [salesagent]
    end

    test "get_salesagent!/1 returns the salesagent with given id" do
      salesagent = salesagent_fixture()
      assert Salesagents.get_salesagent!(salesagent.id) == salesagent
    end

    test "create_salesagent/1 with valid data creates a salesagent" do
      valid_attrs = %{email: "some email", first_name: "some first_name", last_name: "some last_name"}

      assert {:ok, %Salesagent{} = salesagent} = Salesagents.create_salesagent(valid_attrs)
      assert salesagent.email == "some email"
      assert salesagent.first_name == "some first_name"
      assert salesagent.last_name == "some last_name"
    end

    test "create_salesagent/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Salesagents.create_salesagent(@invalid_attrs)
    end

    test "update_salesagent/2 with valid data updates the salesagent" do
      salesagent = salesagent_fixture()
      update_attrs = %{email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name"}

      assert {:ok, %Salesagent{} = salesagent} = Salesagents.update_salesagent(salesagent, update_attrs)
      assert salesagent.email == "some updated email"
      assert salesagent.first_name == "some updated first_name"
      assert salesagent.last_name == "some updated last_name"
    end

    test "update_salesagent/2 with invalid data returns error changeset" do
      salesagent = salesagent_fixture()
      assert {:error, %Ecto.Changeset{}} = Salesagents.update_salesagent(salesagent, @invalid_attrs)
      assert salesagent == Salesagents.get_salesagent!(salesagent.id)
    end

    test "delete_salesagent/1 deletes the salesagent" do
      salesagent = salesagent_fixture()
      assert {:ok, %Salesagent{}} = Salesagents.delete_salesagent(salesagent)
      assert_raise Ecto.NoResultsError, fn -> Salesagents.get_salesagent!(salesagent.id) end
    end

    test "change_salesagent/1 returns a salesagent changeset" do
      salesagent = salesagent_fixture()
      assert %Ecto.Changeset{} = Salesagents.change_salesagent(salesagent)
    end
  end
end
