## 墓のアナウンス

# 霊能者(dummy含む)
#スキル未所持
$execute unless items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["skill","0"]}] run title @s actionbar [{"selector":"@a[scores={ID=$(reserve_0)}]"},{"text":"の墓"}]

#スキル所持
$execute if items entity @s weapon.mainhand *[minecraft:custom_data~{Tags:["skill","0"]}] run title @s actionbar [{"selector":"@a[scores={ID=$(reserve_0)}]"},{"text":"の墓 (右クリックで能力を使う)"}]