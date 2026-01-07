tellraw @s ["",{text:"\u0020 \u0020 \u0020 \u0020 \u0020 \u0020 \u0020 \u0020 \u0020",color:"blue",strikethrough:true},{text:" [Sign Shops] ",color:"green"},{text:"\u0020 \u0020 \u0020 \u0020 \u0020 \u0020 \u0020 \u0020 \u0020",color:"blue",strikethrough:true}]

function ss:operations/help/balance/get_self
tellraw @s ["",{text:"Your UID: ",color:"gold"},{score:{name:"@s",objective:"se.uid"}},{text:" "},{text:"Balance: ",color:"gold"},{text:"$"},{score:{name:"#balance",objective:"ss.stock"}}]

tellraw @s ["\n",{text:"Hover over a command or prompt to learn more"}]


tellraw @s ["- ",{text:"/trigger ss.help",color:"gold",hover_event:{action:"show_text",value:["",{text:"/trigger ss.help",color:"green"},{text:"\nThe help menu for Sign Shops",}]},click_event:{action:"suggest_command",command:"/trigger ss.help"}}]
tellraw @s ["- ",{text:"/trigger ss.balance set #",color:"gold",hover_event:{action:"show_text",value:["",{text:"/trigger ss.balance set #",color:"green"},{text:"\nView the balance of the target."},{text:"\n\nPositive Values",color:"gold"},{text:" - View the balance of player #"},{text:"\n\nExample:",color:"gold"},{text:"\n/trigger ss.balance set 1",color:"gray"},{text:" - See player with UID 1's balance"}]},click_event:{action:"suggest_command",command:"/trigger ss.balance set "}}]
tellraw @s ["- ",{text:"/trigger ss.transfer set #",color:"gold",hover_event:{action:"show_text",value:["",{text:"/trigger ss.transfer set #",color:"green"},{text:"\nTransfer balance to the target."},{text:"\n\nPositive Values",color:"gold"},{text:" - Begin a balance transfer to player #"},{text:"\n\nEnter the player's "},{text:"UID",color:"gold"},{text:" first.\nThen, enter the "},{text:"amount to send",color:"gold"},{text:"."},{text:"\n\nExample:",color:"gold"},{text:"\n/trigger ss.transfer set 3",color:"gray"},{text:" - Transfer balance to player with UID 3."}]},click_event:{action:"suggest_command",command:"/trigger ss.balance set "}}]


tellraw @s ["\n",{text:"[Making a Shop]",color:"green",hover_event:{action:"show_text",value:["",\
            {text:"Making a Shop",color:"green"},\
            {text:"\nPlace a sign on the side of a block."},\
            {text:"\n\nLine 1",color:"gold"},{text:" - Will your customers "},{text:"[Buy]",color:"blue"},{text:" or "},{text:"[Sell]",color:"blue"},{text:" items?"},\
            {text:"\n\u0020\u0020\u0020\u0020The first line is the answer to that question.",color:"gray"},\
            {text:"\nSkip Line 2",color:"gold"},\
            {text:"\n\u0020\u0020\u0020\u0020This will be automatically filled in later.",color:"gray"},\
            {text:"\nLine 3",color:"gold"},{text:" - Put the number of items to "},{text:"[Buy]",color:"blue"},{text:" or "},{text:"[Sell]",color:"blue"},{text:"."},\
            {text:"\n\u0020\u0020\u0020\u0020Sign Shops will fix most issues as needed.",color:"gray"},\
            {text:"\nLine 4",color:"gold"},{text:" - The cost to "},{text:"[Buy]",color:"blue"},{text:" or "},{text:"[Sell]",color:"blue"},{text:" in whole USD."},\
            {text:"\n\u0020\u0020\u0020\u0020Example: $500",color:"gray"},\
            {text:"\n\nIf the first line turns "},{text:"gold",color:"gold"},{text:", simply right click the sign with a item to create a shop for it."},{text:"\n\nIf it instead becomes [Failed], read the error message and replace the sign.",color:"#ffb3b3"}\
            ]}}]



tellraw @s ["",{text:"[Using a Shop]"}]
tellraw @s ["",{text:"[Checking Stock]"}]