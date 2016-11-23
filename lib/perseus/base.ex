defmodule Perseus.Base do
    use HTTPoison.Base
     @base_url "https://api.twitch.tv/kraken"

     def request(url, oAuth_token \\ nil, headers \\ %{}) do
        HTTPoison.get!(build_url(url),build_headers(headers, oAuth_token)).body
        |> Poison.decode!
        |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
     end

     defp build_url(url) do
        Enum.join([@base_url, url],"/")
     end

     defp build_headers(headers, oAuth_token) do
        required  = %{ 
            "Accept" => "application/vnd.twitchtv.v3+json",
            "Client-ID" => get_api_token()
        }

        if oAuth_token do
            auth = %{"Authorization" => "OAuth #{oAuth_token}"}
           required =  Map.merge(required, auth)
        end

        Map.merge(required, headers)
     end

     defp get_api_token do
         System.get_env("TWITCH_TV_CLIENT_ID")
     end
end