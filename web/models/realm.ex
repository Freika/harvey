defmodule Harvey.Realm do
  use Harvey.Web, :model

  schema "realms" do
    field :name, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end

  def json_url(realm_name) do
    api_key = Application.get_env(:harvey, :bnet_api_key)
    # response = HTTPotion.get("https://eu.api.battle.net/wow/auction/data/#{realm_name}?locale=en_GB&apikey=#{api_key}")
    response = HTTPotion.get("https://eu.api.battle.net/wow/auction/data/#{realm_name}?locale=en_GB&apikey=#{api_key}")
    {status, body} = JSON.decode(response.body)
    List.first(body["files"])["url"]
  end

  def read_auction(url, realm_name) do
    response = HTTPotion.get(url, [timeout: :infinity])
    json = JSON.decode(response.body)
    {status, body} = json
    Enum.count(body["auctions"])
  end
end
