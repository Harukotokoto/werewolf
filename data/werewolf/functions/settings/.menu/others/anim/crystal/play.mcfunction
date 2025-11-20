execute as @e[type=#animated_java:root,tag=aj.crystal.root] run function animated_java:crystal/animations/animation/play
data modify storage werewolf: settings.anim.crystal set value true

##表示更新
function werewolf:settings/.menu/others/