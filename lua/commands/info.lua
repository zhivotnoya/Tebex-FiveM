print( "// Command tebex info        //" )

Tebex.commands["info"] = function(ply, args)
    apiclient = TebexApiClient:init(config:get("baseUrl"), config:get("secret"))
    apiclient:get("/information", function(response)
        TebexInformation.id = response["account"]["id"]
        TebexInformation.domain = response["account"]["domain"]
        TebexInformation.gameType = response["account"]["game_type"]
        TebexInformation.name = response["account"]["name"]
        TebexInformation.currency = response["account"]["currency"]["iso_4217"]
        TebexInformation.currencySymbol = response["account"]["currency"]["symbol"]
        TebexInformation.serverId = response["server"]["id"]
        TebexInformation.serverName = response["server"]["name"]

        Tebex.ok("Server Information");
        Tebex.ok("=================");
        Tebex.ok("Server " .. TebexInformation.serverName .. " for webstore " .. TebexInformation.name);
        Tebex.ok("Server prices are in " .. TebexInformation.currency);
        Tebex.ok("Webstore domain: " .. TebexInformation.domain);
    end, function(body)
        Tebex.err (body["error_message"])
    end)

    apiclient = nil
end
