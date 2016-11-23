defmodule Perseus.Blocks do
    alias Perseus.Base
    @max_limit 100

    def get(username, token, limit \\ 25, offset \\ 0) do
        path = "/users/#{username}/blocks?limit=#{limit}&offset=#{offset}"
        cond do
            limit > @max_limit ->
                {:error, "max limit on request is 100"}
            true ->
                Base.request(path, token)
        end
    end

end