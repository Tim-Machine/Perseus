defmodule Perseus.Base do
    use HTTPoison.Base
     @base_url "https://api.twitch.tv/kraken"

     def request(url, oAuth_token \\ nil, headers \\ []) do
         HTTPoison.get(build_url(url),build_headers(headers))
     end

     defp build_url(url) do
         IO.puts url
        Enum.join([@base_url, url],"/")
     end

     defp build_headers(headers) do
        required  = %{ 
            "Accept" => "application/vnd.twitchtv.v3+json",
            "Client-ID" => get_api_token()
        }
        
     end

     defp get_api_token do
         System.get_env("TWITCH_TV_CLIENT_ID")
     end
end