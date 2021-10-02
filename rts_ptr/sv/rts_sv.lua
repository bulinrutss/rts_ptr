-- NÃO RETIRE OS CRÉDITOS / NÃO RETIRE OS CRÉDITOS / NÃO RETIRE OS CRÉDITOS / NÃO RETIRE OS CRÉDITOS / NÃO RETIRE OS CRÉDITOS / NÃO RETIRE OS CRÉDITOS
-- TODOS OS DIREITOS AO CRIADOR  'Rutss.Dev'
-- Url 'https://discord.gg/AbjS8gZ'
-- Versão 'vRPEX'
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- PTR
-----------------------------------------------------------------------------------------------------------------------------------------
local webhook = rts.webhook
RegisterCommand('ptr', function(source,args,rawCommand)
     local user_id = vRP.getUserId(source)
     local player = vRP.getUserSource(user_id)
     local oficiais = vRP.getUsersByPermission("policia.permissao")
     local paramedico = vRP.getUsersByPermission("paramedico.permissao")
     local mecanico = vRP.getUsersByPermission("mecanico.permissao")
     local policia = 0
     local paramedicos = 0
     local mecanicos = 0
     local oficiais_nomes = ""
     local oficiais_nomesweb = ""
     local paramedico_nomes = ""
     local paramedico_nomesweb = ""
     local mecanico_nomes = ""
     local mecanico_nomesweb = ""
	 local  ptr = true
     if  ptr then
         for k,v in ipairs(oficiais) do
             local identity = vRP.getUserIdentity(parseInt(v))
             oficiais_nomes = oficiais_nomes .. "<b>" .. v .. "</b>: " .. identity.firstname .. " " .. identity.name .. "<br>"
             oficiais_nomesweb = oficiais_nomesweb .. " ID [  " .. v .. "  ]   Nome: [  " .. identity.firstname .. " " .. identity.name .. "  ]"
             policia = policia + 1
         end
		 for k,v in ipairs(paramedico) do
             local identity = vRP.getUserIdentity(parseInt(v))
             paramedico_nomes = paramedico_nomes .. "<b>" .. v .. "</b>: " .. identity.firstname .. " " .. identity.name .. "<br>"
             paramedico_nomesweb = paramedico_nomesweb .. " ID [  " .. v .. "  ]   Nome: [  " .. identity.firstname .. " " .. identity.name .. "  ]"
             paramedicos = paramedicos + 1
         end
		 for k,v in ipairs(mecanico) do
             local identity = vRP.getUserIdentity(parseInt(v))
             mecanico_nomes = mecanico_nomes .. "<b>" .. v .. "</b>: " .. identity.firstname .. " " .. identity.name .. "<br>"
             mecanico_nomesweb = mecanico_nomesweb .. " ID [  " .. v .. "  ]   Nome: [  " .. identity.firstname .. " " .. identity.name .. "  ]"
             mecanicos = mecanicos + 1
         end
         TriggerClientEvent("Notify",source,"importante", "Atualmente <b>"..policia.." Policiais // "..paramedicos.." Médicos // "..mecanicos.." Mecânicos</b> em serviço.")
         if parseInt(policia) > 0 then
             TriggerClientEvent("Notify",source,"importante", "Policiais em Serviço "..oficiais_nomes.."")
         end
		 if parseInt(paramedicos) > 0 then
             TriggerClientEvent("Notify",source,"negado", "Médicos em Serviço "..paramedico_nomes.."")
         end
		 if parseInt(mecanicos) > 0 then
             TriggerClientEvent("Notify",source,"sucesso", "Mecânicos em Serviço "..mecanico_nomes.."")
         end
     end
	local identity = vRP.getUserIdentity(user_id)
	PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({
	embeds = {{ 
		     	title = "REGISTRO DE PTR",
			    thumbnail = {
				url = "https://cdn.discordapp.com/attachments/765217647062286356/819374020053958666/rtsw_comunitty.png"}, 
			fields = {{ 
				name = "**PLAYER USOU O COMANDO PTR:**", 
				value = "Player: "..identity.firstname.." "..identity.name.." \nID: ["..user_id.."]\n\nNo momento do uso foi registrado\n \n"..policia.." Policiais \n"..paramedicos.." Médicos \n"..mecanicos.." Mecânicos \n\nEstão em serviço os players: \n\nPoliciais em Serviço \n\n"..oficiais_nomesweb.."\n\nMédicos em Serviço \n\n"..paramedico_nomesweb.."\n\nMecânicos em Serviço \n\n"..mecanico_nomesweb.."\n\n"}}, 
			footer = { 
				text = os.date("\n\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S \nRTS-Comunitty \ndiscord.gg/Ra5yB4CrCG"), 
				icon_url = "https://cdn.discordapp.com/attachments/765217647062286356/819374020053958666/rtsw_comunitty.png"},
			color = 15914080 
		}}
	}), { ['Content-Type'] = 'application/json' })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
print('^2RTS_PTR ^7Criado por ^1Rutss [Dev] ^7| ^4Marcos .Rutss#5346 ')
--[[
NÃO RETIRE OS CRÉDITOS / NÃO RETIRE OS CRÉDITOS / NÃO RETIRE OS CRÉDITOS / NÃO RETIRE OS CRÉDITOS / NÃO RETIRE OS CRÉDITOS / NÃO RETIRE OS CRÉDITOS

TODOS OS DIREITOS AO CRIADOR  'Rutss.Dev'
url 'https://discord.gg/AbjS8gZ'
versão 'VRPEX'

NÃO RETIRE OS CRÉDITOS / NÃO RETIRE OS CRÉDITOS / NÃO RETIRE OS CRÉDITOS / NÃO RETIRE OS CRÉDITOS / NÃO RETIRE OS CRÉDITOS / NÃO RETIRE OS CRÉDITOS
]]