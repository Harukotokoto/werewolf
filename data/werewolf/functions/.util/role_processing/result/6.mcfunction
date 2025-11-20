# text
data modify storage macro: util.role_processing.result set value '{"text":""}'
function werewolf:.util/role_processing/result/4 with storage macro: util.role_processing
data modify storage macro: util.role_processing.result set value 'help'

# title
function werewolf:.util/role_processing/result/5 with storage werewolf: game_result.output