## SignShops Stage 1 - Validation (Price) Appearance Preparation
# Context: Self at Projected Position
# Calls:
#   - ss:operations/registration/sign/validate/price_final
# Called by:
#   - ss:operations/registration/sign/validate/price_stage
# Returns:
#   0 - Failed to parse number
#   1 - Function completed, no issueus.
# Description:
#   <> Adjusts context ss:temp assign for price_finale

$data modify storage ss:temp assign.price set string storage ss:temp sign.front_text.messages[3] 1 $(len)

return run function ss:operations/registration/sign/validate/price_final with storage ss:temp assign