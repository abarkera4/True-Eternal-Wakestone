local WriteInfoLogs = false -- Set to true to enable info logging

local function log_info(infoMessage)
    if WriteInfoLogs then
        log.info("[Mr. Boobie Buyer > True Eternal Wakestone]: " .. infoMessage)
    end
end

local function log_error(errorMessage)
    log.error("[Mr. Boobie Buyer > True Eternal Wakestone]: " .. errorMessage)
end

sdk.hook(sdk.find_type_definition("app.ItemManager"):get_method("deleteItem"),
    function(args)
        --log_info("deleteItem Method Called")
        local itemDeleted = sdk.to_int64(args[3])
        log_info("deleteItem called for ItemID: "..itemDeleted)
        if itemDeleted == 76 then
            log_info("ItemID: "..itemDeleted.." Deletion Prevented")
            return sdk.PreHookResult.SKIP_ORIGINAL
        end

    end)



