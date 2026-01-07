## SignShops Stage 2 - Redirection
# Context: Self at Projected Position
# Calls:
#   - ss:operations/registration/sign/initiate/specific/ebook
#   - ss:operations/registration/sign/initiate/specific/spawner
#   - ss:operations/registration/sign/initiate/generic_item
# Called by:
#   - ss:operations/interact/start
# Returns:
#   0 - Initiation failed.
#   1 - Function completed, no issueus.
# Description:
#   <> Directs stage 2 of initiation to the correct itme category for individual processing.

## Commands

execute if predicate ss:possible_items/enchanted_book run return run function ss:operations/registration/sign/initiate/specific/ebook
execute if predicate ss:possible_items/spawner run return run function ss:operations/registration/sign/initiate/specific/spawner
return run function ss:operations/registration/sign/initiate/generic_item