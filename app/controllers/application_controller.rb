class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  APP_KEY = 'AIzaSyDdefF4QdK4Zapi-LE01BwVHGS8hJMSltE'

  def pushToDevice(device,title="尊大なるタイトル", message = "崇高なるメッセージ", ticker = "傲慢なるティッカー")
    uri = URI.parse('https://android.googleapis.com/gcm/send')
    header = {'Content-Type' => 'application/json', 'Authorization' => "key=#{APP_KEY}"}
    req = Net::HTTP::Post.new(uri.request_uri, header)
    req.body = {registration_ids: [device.registration_id], data: {message: message, title: title, ticker: ticker}}.to_json
    http = Net::HTTP::new(uri.host, uri.port)
    http.use_ssl = true
    http.start do |h|
      res = h.request(req)
      puts res.body
    end
  end

end
