$data modify block ~ ~ ~ front_text.messages[1] set value ["",{text:"$(name) $(extra)"}]
data modify entity @e[type=marker,tag=ss.marker,distance=0..0.25,limit=1] data.ss.ready set value true