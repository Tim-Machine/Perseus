defmodule Perseus.Games do
    alias Perseus.Base
    @max 100

    def top(max \\ 10, offset \\ 0 ) do
        path = "games/top?limit=#{max}&offset=#{offset}"
        cond do
            max > @max ->
                {:error, "max limit on request is 100"}
            true ->
                Base.request path
        end

        
    end
end