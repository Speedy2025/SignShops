# SignShops
Sign Shops in Vanilla Minecraft!


# Quick Notes

## Compatibility
This pack relies on `PlayerDB`, created by rx#1284 on Discord. In addition, it requires Suso's string parsing library. They can be found at these links:

PlayerDB <link>https://github.com/rx-modules/PlayerDB</link>

String Parser <link>https://github.com/5uso/String-Parser</link>

Note that you MUST ENABLE COMMAND BLOCKS before adding the string parser. If you don't, the datapack misbehaves until you manage to fix it. I can't/won't support your issues if the string parser breaks. You can tell if it does if your sign does NOT change color once it turns orange, even if you interact with it correctly/incorrectly.

# Usage
The datapack is simple in idea but complex in it's scope. 

## Making & Managing Shop Signs

### Placing the Sign
1. Put `[Buy]` or `[Sell]` as the first line. If you don't know which one to use, ask yourself, "What will the customer do? Will they buy from the sign or will they sell their stuff to the sign". The answer to the question is what the sign should be titled as.
2. Ignore the 2nd and 3rd line or put anything. It doesn't matter.
3. Put a price, in whole dollars, on the last line. The values may range from $1 to $99999999 and cannot include anything except numbers and the dollar sign, no commas or decimals.

### Initializing the Sign
If you put the title right, you should see that it turns orange and the middle two lines fill. If it doesn't, replace the sign and try again. Take what you want to sell or buy in EXACT QUANTITY and right click the sign with it in your mainhand. Should it fit the criteria, the sign will change color:
* Light Red - Shop is ready to be stocked and everything went smoothly
* Dark Red - You didn't follow step 3, replace the sign and try again.

### Stocking the Shop
Provided you didn't make it an admin shop (see later on), you'll need to maintain the shop's stock. For `[Buy]` signs, right click them with the item you are selling. It can be in any quantity provided it follows the No-NBT rule. For `[Sell]` signs, right click the sign if you have enough money to stock it. In this case, it will only stock one set.

You can also unstock the shop. Simply check the stock (see below) and click on (Remove Set) or (Remove All) to remove the respective amounts. If you remove a set but there isn't a full set, it'll drain the shop.

### Collecting Profits & Stonks
Ready to collect your hard earned cash/items? Simply type `/trigger ss.retrieve set #` with # being the number of sets you wish to retrieve at max. If you try to take too many, the system will cut off when needed. For example, if you run `/trigger ss.retrieve set 10000`, it will not attempt to collect 10,000 items as you do not have enough inventory slots to possibly hold it. No matter how many sets you retrieve, it'll automatically add any money in the collections to your balance, indicated by a message.

## Using a Shop

### Buying Items
Found a really good deal on a `[Buy]` sign and want in on it? Provided you have enough money, simply right click the sign. You must not be the owner of the sign to do this.

### Selling Items
Like stocking a shop, hold the items in your main hand. If you have enough to sell, right click the sign. You'll be automatically rewarded the money from the transaction and the items sold will be removed. If there's any left over items, you keep them.

### Checking a Shop's Stock
Don't know what's being sold or you want to know how much stock a shop has? All you have to do is crouch and right click the sign.

## Admin Tags
Like Speedy's Essentials, I've included a small suite of tags for making your life easier (or harder) with controlling permissions. They are as follows...
* ss.adminshop - Create AdminShops
* ss.disable.all - Disable ALL functionality of SignShops
* ss.disable.create - Disable creation of signs
* ss.disable.signs - Disable useage of signs
* ss.disable.balance - Disable the ability to check balance
* ss.disable.retrieve - Disables retrieval of items from collection

# On Bugs...
While I make a reasonable effort to test on my local world and server before release, I cannot promise this will be bug-free. If you do know bugs, please mesage me on discord **@Speedy2025#2025** or ping me on one of the servers I can be found on.

a