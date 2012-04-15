require "backend_server/base"
require "remote_printer"

class BackendServer::Settings < BackendServer::Base
  get "/" do
    @printer = RemotePrinter.find_by_ip(request.ip)
    @print_url = print_url(@printer) if @printer
    erb :my_printer
  end

  get "/:printer_id/test-page" do
    @printer = RemotePrinter.find(params[:printer_id])
    @print_url = print_url(@printer)
    erb :test_page, layout: :print_layout
  end
end