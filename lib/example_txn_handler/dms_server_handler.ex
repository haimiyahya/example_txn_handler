defmodule DMS.ServerHandler do
  use UA.ServerHandler

  @impl UA.ServerHandler
  def disassemble_msg(msg) do

    tpdu = binary_part(msg, 0, 5) |> Base.encode16
    mti = binary_part(msg, 5, 2) |> Base.encode16
    bmp_and_msg = binary_part(msg, 7, byte_size(msg) - 7)

    fields_formats = Application.fetch_env!(:example_txn_handler, :iso_hex_field_format)
    header_config = Application.fetch_env!(:example_txn_handler, :template_of_hex_message_header_and_bitmap_config)

    extracted_iso = Ex_Iso8583.extract_iso_msg(bmp_and_msg, header_config, fields_formats)

    IO.inspect(tpdu)
    IO.inspect(mti)
    IO.inspect extracted_iso

    %{
      3 => proc_code
    } = extracted_iso

    IO.inspect(proc_code)

    {:ok, tpdu, mti, proc_code, extracted_iso}
  end

  @impl UA.ServerHandler
  def assemble_msg(tpdu, mti, _proc_code, rbody) do

    fields_formats = Application.fetch_env!(:example_txn_handler, :iso_hex_field_format)
    header_config = Application.fetch_env!(:example_txn_handler, :template_of_hex_message_header_and_bitmap_config)

    txn_bytes = Ex_Iso8583.form_iso_msg(rbody, header_config, fields_formats)

    msg = Base.decode16!(tpdu) <> Base.decode16!(mti) <> txn_bytes

    {:ok, msg}
  end

end
