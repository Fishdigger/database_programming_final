defmodule KnightHardware.Order do
  use KnightHardware.Web, :model

  @primary_key false
  schema "orders" do
    field :order_number, :integer, primary_key: true
    field :customer_number, :integer
    field :order_date, :date
  end

  def changeset(struct, params \\ %{}) do
    cast(struct, params, [:order_number, :customer_number, :order_date])
    |> validate_required([:customer_number, :order_date])
  end

  def get_last_order_number do
    KnightHardware.Repo.one(from o in KnightHardware.Order, select: max(o.order_number))
  end

  def get_by_customer(cust_num) when is_number(cust_num) do
    KnightHardware.Repo.get_by(KnightHardware.Order, customer_number: cust_num)
  end
end
