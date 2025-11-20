execute as @e[type=#animated_java:root,tag=aj.crystal.root] run function animated_java:crystal/animations/animation/stop
data modify storage werewolf: settings.anim.crystal set value false

##表示更新
function werewolf:settings/.menu/others/