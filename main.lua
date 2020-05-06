
-- General Purpose shop plugin
-- Uses BankAPI - 


function Initialize(Plugin)
	Plugin:SetName("Shopify")
	Plugin:SetVersion(3)



	cPluginManager:AddHook(cPluginManager.HOOK_PLUGINS_LOADED, PluginsLoaded);



	cPluginManager.BindCommand("/shop", "", ShopHandler, " ~ Opens the shop");
	cPluginManager.BindCommand("/buy", "", BuyHandler, " ~ Used to buy items");
	cPluginManager.BindCommand("/sell", "", SellHandler, " ~ Used to sell items");
	cPluginManager.BindCommand("/bal", "", BalHandler, " - Returns Player's Balance");



	LOG("Initialized " .. Plugin:GetName() .. " v." .. Plugin:GetVersion())
	return true
end

function PluginsLoaded()
	dofile(cPluginManager:CallPlugin("BankAPI", "GetExternalAPIPath"))
end



function BalHandler(_, Player)
	local PlayersUUID = cMojangAPI:GetUUIDFromPlayerName(Player:GetName(), false)
	local PlayersBalance = BankGetPlayerBalance(PlayersUUID)
	Player:SendMessageInfo("Balance: " .. PlayersBalance)
	return true
end

function ShopHandler(Split, Player)
	-- Shop Syntax:
	-- /Shop <Category>
	if #Split == 1 then
		OpenShop(Player)
	else
		OpenShop(Player, Split[2])
	end
	return true
end





function BuyHandler(Split, Player)
	local PlayersUUID = cMojangAPI:GetUUIDFromPlayerName(Player:GetName(), false)
	local PlayersBalance = BankGetPlayerBalance(PlayersUUID)
	local List = CategoryList()
	local Cost
	for K = 1,#List do
		for T = 1,#List[K] do
			if List[K][T][1] == Split[2] then
				Cost = (List[K][T][2] / List[K][T][3])
			end
		end
	end
	if not(Cost == nil) and (PlayersBalance >= (Cost * Split[3])) then
		local PlayersNewBalance = BankChangePlayerBalance(PlayersUUID, -1 * (Cost * Split[3]))
		Player:GetInventory():AddItem(cItem(Split[2], Split[3]))
	elseif (Cost == nil) then
		Player:SendMessageFailure("Invalid Item")
	else
		Player:SendMessageFailure("Not Enough Funds")
	end
	return true
end





function SellHandler(Split, Player)
	local PlayersUUID = cMojangAPI:GetUUIDFromPlayerName(Player:GetName(), false)
	local PlayersBalance = BankGetPlayerBalance(PlayersUUID)
	local List = CategoryList()
	local Inventory = Player:GetInventory()
	local Value
	
	
	
	if Inventory:HowManyItems(cItem(Split[2], 1)) >= Split[3] then
	
		for K = 1,#List do
			for T = 1,#List[K] do
				if List[K][T][1] == Split[2] then
					Value = (List[K][T][2] / List[K][T][3]) * 0.8
				end
			end
		end
	
		local PlayersNewBalance = BankChangePlayerBalance(PlayersUUID, (Value * Split[3]))
		
		Inventory:RemoveItem(cItem(Split[2], Split[3]))
		
	end
	
	return true
end





local OnClicked = function(Window, Player, SlotNum, ClickAction, ClickedItem)
	local List = CategoryList()
	local Split = {}
	local Temp = 0


	if SlotNum < 8.5 then
		FormatWindow(Window, Player, (SlotNum + 1))
	elseif ((SlotNum > 17.5) and (SlotNum < 44.5)) then
		for K = 1,#List do
			for T = 1,#List[K] do
				if List[K][T][1] == ClickedItem.m_ItemType then
					Temp = K
					Split[2] = ClickedItem.m_ItemType
					if tonumber(ClickAction) == 2 then
						Split[3] = 64
					else
						Split[3] = List[K][T][3]
					end 
					if ClickAction == 0 then
						Split[1] = "/buy"
						BuyHandler(Split, Player)
					elseif ClickAction == 1 then
						Split[1] = "/sell"
						SellHandler(Split, Player)
					end
				end
			end
		end
		if not(Temp == 0) then
		FormatWindow(Window, Player, Temp)
		end
	end
	
	if (SlotNum > 44.5) and not(ClickAction == caShiftLeftClick) then
		return false
	else
		return true
	end
end


function OnClosing(_, Player)
	local PlayersUUID = cMojangAPI:GetUUIDFromPlayerName(Player:GetName(), false)
	local PlayersBalance = BankGetPlayerBalance(PlayersUUID)
	Player:GetClientHandle():SendSetTitle(cCompositeChat():AddTextPart("Your New Balance Is"))
	Player:GetClientHandle():SendSetSubTitle(cCompositeChat():AddTextPart(PlayersBalance))
	Player:GetClientHandle():SendTitleTimes(3, 20, 3)
end


function OpenShop(Player, Category)
	local List = CategoryList()
	local Window = cLuaWindow(0, 9, 5, "Shop")
	local Temp = 0
	
	Window:SetOnClicked(OnClicked)
	Window:SetOnClosing(OnClosing)
	
	Player:OpenWindow(Window)
	
	
	
	
	for K = 1,#List do
		Window:SetSlot(Player, Temp, cItem(List[K][1][2], 1, 0, nil, List[K][1][1]))
		Temp = Temp + 1
	end
	
	
	if not(Category == nil) then
		FormatWindow(Window, Player, tonumber(Category))
	end
	
	
	for S = 9,17 do
		Window:SetSlot(Player, S, cItem(E_BLOCK_STAINED_GLASS_PANE, 1, 0, nil, " "))
	end
	
end

function FormatWindow(Window, Player, Category)
	local List = CategoryList()
	local Temp = 0
	local Window = Player:GetWindow()
	
	for S = 18, 44 do
		Window:SetSlot(Player, S, cItem(0, 1))
	end
	
	
	if not((Category == nil) or (Category > #List) or (Category < 0.5))  then
			
		for S = 9,17 do
			Window:SetSlot(Player, S, cItem(E_BLOCK_STAINED_GLASS_PANE, 1, 0, nil, " "))
		end
		local PlayersUUID = cMojangAPI:GetUUIDFromPlayerName(Player:GetName(), false)
		local PlayersBalance = BankGetPlayerBalance(PlayersUUID)

		for T = 1,#List[Category] do
			if List[Category][T][3] == nil then
				List[Category][T][3] = 1
			end
			if not(T == 1) then
			Temp = Temp + 1
			local Cost = List[Category][T][2]
			local Item = cItem(List[Category][T][1], List[Category][T][3], 0, nil)
			
			Item.m_LoreTable = {"Cost: " .. Cost, "-- Buying --", PlayersBalance .. " - " .. Cost, "= " .. PlayersBalance - Cost, "-- Selling --", PlayersBalance .. " + " .. (Cost * 0.8), "= " .. PlayersBalance + (Cost * 0.8)}
			
			Window:SetSlot(Player, Temp + 17, Item)
			end
		end
		Window:SetSlot(Player, Category + 8, cItem(E_BLOCK_GLASS_PANE, 1, 0, nil, " "))
	end
end

