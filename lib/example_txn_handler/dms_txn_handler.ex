defmodule DMS.TxnHandler do
  use UA.TxnHandler

  @impl UA.TxnHandler
  def handle_txn(tpdu, "0200", proc_code, msg_body) do

    IO.inspect "this is a simple implementation"
    IO.inspect(msg_body)

    rmsg_body = %{
      3 => proc_code,
      4 => "000000002000",
      37 => "123456789012",
      39 => "00",
      41 => "50160262",
      42 => "501100329500002",
      62 => "000001",
      64 => <<85, 20, 132, 43, 88, 100, 168, 54>>
    }

    {:ok, tpdu, "0210", proc_code, rmsg_body}
  end

end
