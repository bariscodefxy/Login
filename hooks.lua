-- Author STR_Warrior --

function OnExecuteCommand(Player, CommandSplit)
	if (Player == nil) then
		return false;
	end
	if (Auth[Player:GetName()] == true) then
		return false;
	end
		AuthDir[Player:GetName()] = io.open(PluginDir .. "Players/" .. Player:GetName(), "r" )
	if 	AuthDir[Player:GetName()] then
		AuthDir[Player:GetName()]:close()
		if (CommandSplit[1] ~= "/login") then 
			return true
		end
	else		
		if (CommandSplit[1] ~= "/register") then
			return true
		end
	end
end

function OnPlayerTossingItem(Player)
	if Auth[Player:GetName()] == false then
		Player:SendMessage(cChatColor.Rose .. TossingItem)
		return true
	end
end

function OnLogin(Client, ProtocolVersion, Username)
	local loopPlayers = function( NewPlayer )
		if (NewPlayer:GetName() == Username) then
			NewPlayer:SendMessage( "Somebody just tried to login in under your name." )
			Client:Kick( "Server Reloaded" )
		end
    end
    local loopWorlds = function ( World )
        World:ForEachPlayer( loopPlayers )
    end
end

function OnDisconnect(Player)
	if Auth[Player:GetName()] == false then
		LOGWARN("Player " .. Player:GetName() .. " Logged out without logging in")
	end
end

function OnChat(Player)
	if Auth[Player:GetName()] == false then
		Player:SendMessage(cChatColor.Rose .. OnPlayerChat)
		return true
	end
end

function OnPlayerMoving(Player)
	World = Player:GetWorld()
	if Auth[Player:GetName()] == false then
		PlayerMSG[Player:GetName()] = PlayerMSG[Player:GetName()] + 1
		if PlayerMSG[Player:GetName()] == 60 then
			if AuthDir[Player:GetName()] then
				Player:SendMessage(cChatColor.Rose .. NotLoggedIn)
				PlayerMSG[Player:GetName()] = 1
			else
				Player:SendMessage(cChatColor.Rose .. NotRegistered)
				PlayerMSG[Player:GetName()] = 1
			end
		end
		Player:TeleportTo( World:GetSpawnX(), World:GetSpawnY(), World:GetSpawnZ() )
	end
end

function OnPlayerLeftClick(Player)
	if Auth[Player:GetName()] == false then
		Player:SendMessage(cChatColor.Rose .. OnBreaking)
		return true
	end
end

function OnPlayerRightClick(Player)
	if Auth[Player:GetName()] == false then
		Player:SendMessage(cChatColor.Rose .. OnPlacing)
		return true
	end
end

function OnPlayerJoined(Player)
	PlayerMSG[Player:GetName()] = 1
	Count[Player:GetName()] = Tries
	X[Player:GetName()] = Player:GetPosX()
	Y[Player:GetName()] = Player:GetPosY()
	Z[Player:GetName()] = Player:GetPosZ()
	Auth[Player:GetName()] = false
	AuthDir[Player:GetName()] = io.open(PluginDir .. "Players/" .. Player:GetName(), "r" )
	if AuthDir[Player:GetName()] then
		AuthDir[Player:GetName()]:close()
		Player:SendMessage(cChatColor.Rose .. NotLoggedIn)
	else		
		Player:SendMessage(cChatColor.LightGreen .. NotRegistered)
	end
end