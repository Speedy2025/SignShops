## SignShops Stage 2 - Enchanted Book Initiation - Naming 2
# Context: Self at Projected Position
# Calls:
#   - ss:operations/registration/sign/initiate/specific/ebook_final
# Called by:
#   - ss:operations/registration/sign/initiate/specific/ebook
# Returns:
#   Status of final product.
# Description:
#   <> Extracts just the name of the enchantment.

## Commands

$data modify storage ss:temp assign.name set string storage ss:temp assign.name 0 $(len)
return run function ss:operations/registration/sign/initiate/specific/ebook_final with storage ss:temp assign