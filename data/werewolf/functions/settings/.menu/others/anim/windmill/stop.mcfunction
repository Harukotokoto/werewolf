execute as @e[type=#animated_java:root,tag=aj.windmill.root] run function animated_java:windmill/animations/rotation/stop
data modify storage werewolf: settings.anim.windmill set value false

##表示更新
function werewolf:settings/.menu/others/