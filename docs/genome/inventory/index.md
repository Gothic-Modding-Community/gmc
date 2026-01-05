# Inventory

The `gCInventory_PS` property set manages the inventory of an entity (such as NPC, Hero or chest).
The inventory is a list of inventory stacks (`gCInventoryStack`).
Each inventory stack references a `Template` that is the blueprint for the item contained in the stack.
The `Quality` and `Amount` of the item is also stored as part of the stack.
When an item gets equipped to a slot, a physical object with a 3D mesh, physics, and location is spawned in the world and attached to the holding entity (see `Slot` and `Item`).
The inventory can contain multiple stacks referencing the same template, but with a different quality, equip status or stack type.

Both the category of an item (`gCItem.Category`) and the stack type with which the item gets inserted into the inventory (see also [Treasure Sets](treasure_sets.md)) control in which contexts an inventory stack is visible and usable:

- Regular inventory
- Trade inventory
- Plunder inventory
- Skills
- Spellbook
- ...

## Skills and Spells
The skills and spells that the hero can learn are represented by items in his inventory with the category `gEItemCategory_Spellbook` respectively `gEItemCategory_Skill`.

The `ActivationCount` of a stack is only relevant for stacks containing skills or spells. Its content is related to the `Learned` flag of the stack, because if `ActivationCount` has a value > 0, the skill or spell is activated for the hero.

The difference between the two is important:

- If `Learned` is set to `true`, the hero has permanently learned the skill or spell and can no longer unlearn it.
- The `ActivationCount`, on the other hand, is always increased by 1 when the hero equips an item that grants this skill or spell as a bonus. When the item is unequipped, the counter is decreased by 1 again. If all items are unequipped, the skills are no longer active for the hero.

Since the hero receives his skills, spells, etc. via code at the start of the game, setting the `ActivationCount` or `Learned` flag for a stack is of no practical use.
