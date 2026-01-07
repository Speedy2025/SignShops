# SignShops v2
Sign Shops in Vanilla Minecraft!


# Quick Notes
## Intended Usage
SignShops v2 is not intended for general usage, though I've designed it to *usually* be okay with it. It is first designed for the needs of my server before anything else. You __will__ find artifacts of code for server-only usage. If you are using all of the datapacks together and you experience unusual behavior, know there are dragons lurking about.

## Compatibility
This pack relies on Speedy's Essentials being installed. You can disable its features, but it needs the structure created by it.

# Usage
The datapack is simple in idea but complex in it's scope. 

## Making & Managing Shop Signs
I've done a reasonable job trying to update this. The function is very similar to before.

### Placing the Sign
1. Put `[Buy]` or `[Sell]` as the first line. If you don't know which one to use, ask yourself, "What will the customer do? Will they buy from the sign or will they sell their stuff to the sign". The answer to the question is what the sign should be titled as.
2. Ignore the 2nd line or put anything. It doesn't matter.
3. Put a quantity, in whole numbers, on the third line. If you put more than a stack for selling, it will automatically adjust to the highest value the item can hold.
4. Put a price, in whole dollars, on the last line. The values may range from $1 to $99999999 and cannot include anything except numbers and the dollar sign, no commas or decimals.

### Initializing the Sign
If you put the title right, you should see that it turns orange and the middle two lines fill. If it doesn't, replace the sign and try again. Take your item and use it on the sign. Should it fit the criteria, the sign will change color:
* Light Red - Shop is ready to be stocked and everything went smoothly
* Dark Red - You didn't follow the instructions, replace the sign and try again.

### Stocking the Shop
Provided you didn't make it an admin shop (see later on), you'll need to maintain the shop's stock. For `[Buy]` signs, right click them with the item you are selling. It can be in any quantity. For `[Sell]` signs, right click the sign if you have enough money to stock it. In this case, it will only stock one set.

### Collecting Profits & Stonks
Ready to collect your hard earned items? Simply type `/trigger ss.retrieve set #`. Money is retrieved automatically.

## Using a Shop

### Buying Items
Found a really good deal on a `[Buy]` sign and want in on it? Provided you have enough money, simply right click the sign. You must not be the owner of the sign to do this.

### Selling Items
Like stocking a shop, hold the items in your main hand. If you have enough to sell, right click the sign. You'll be automatically rewarded the money from the transaction and the items sold will be removed. If there's any left over items, you keep them.

### Checking a Shop's Stock
Don't know what's being sold or you want to know how much stock a shop has? All you have to do is crouch and right click the sign with empty hands. Minecraft requires you to empty both.

## Sending Money
You can easily send money to people. All you have to do is type `/trigger ss.transfer set #`, replacing # with their UID. You'll then be prompted to type `/trigger ss.transfer set #`. Like before, replace the # with how much you want to send. For example, to send $50 to steve, who has a UID of 5, type `/trigger ss.transfer set 5` and then `/trigger ss.transfer set 50`.

## Admin Shops
Sometimes you need a special type of shop where nobody owns it. This is handy for making a shopping area on a server where players can sell their stuff to gain money for use elsewhere. Admin Shops are just that- they are owned by nobody and have unlimited stock. They have **NO VISUAL DIFFERENCE** and are intended to be able to blend in to normal shops. If you check their stock, they will report infinite stock and their ownership by the server. You can sell/buy without restrictions.

You should NEVER give players the ability to create admin shops. This WILL break the economy and make signshops pointless. Instead, only give the tag (see Admin Tags below) to yourself sparingly.

When you have the tag, you'll automatically create admin shops. You can tell if you've made an adminshop if it skips over the restocking stage and instantly turns blue instead of light red. You can also tell if it is an admin shop by checking stock.

## Admin Tags
Like Speedy's Essentials, I've included a small suite of tags for making your life easier (or harder) with controlling permissions. They are as follows...
* ss.adminshop - Create AdminShops
* ss.disable.all - Disable ALL functionality of SignShops
* ss.disable.create - Disable creation of signs
* ss.disable.signs - Disable useage of signs
* ss.disable.balance - Disable the ability to check balance
* ss.disable.retrieve - Disables retrieval of items from collection

# On Bugs...
While I make a reasonable effort to test on my local world and server before release, I cannot promise this will be bug-free. If you do know bugs, please mesage me on discord **@Speedy2025** or ping me on one of the servers I can be found on.