# Treasure Sets

Treasure Sets are templates (located in `Templates/Treasure`) that are used to define NPC weapon loadouts, NPC plunder/pickpocket/trade inventories, and the contents of chests.
Up to five treasure sets can be assigned to an NPC via the `TreasureSet1` to `TreasureSet5` properties of its `gCInventory_PS` property set.

## Plunder Inventory

### gETreasureDistribution_Plunder
```text
TransferStacks = Random selection from the interval [MinTransferStacks, MaxTransferStacks]

If TransferStacks < 1:
    TransferStacks = 1

Repeat TransferStacks times:
    Stack = Select a random stack from the TreasureSet

    If Stack.Amount > 1:
        Amount = Random selection from the interval [Stack.Amount / 2, Stack.Amount]
    Otherwise:
        Amount = Stack.Amount

    Inventory.Add(Stack.Template, Amount, GetCombinedQuality(Stack), gEStackType_Treasure)
```

### gETreasureDistribution_Unique
```text
Stack = Stack with the lowest gold value among all stacks of the TreasureSet that are not yet marked as already generated

If all stacks are already marked as generated:
    Stack = Random stack from the TreasureSet

If Stack.Amount > 1:
    Amount = Random selection from the interval [Stack.Amount / 2, Stack.Amount]
Otherwise:
    Amount = Stack.Amount

Inventory.Add(Stack.Template, Amount, GetCombinedQuality(Stack), gEStackType_Treasure)

Mark Stack as generated
```

### gETreasureDistribution_Trophy
```text
Repeat for each stack:
    If Stack.UseType == gEUseType_TrophyTeeth and the player has NOT learned Perk_TrophyTeeth:
        Skip stack

    If Stack.UseType == gEUseType_TrophyFur and the player has NOT learned Perk_TrophyFur:
        Skip stack

    If Stack.UseType == gEUseType_TrophySkin and the player has NOT learned Perk_TrophySkin:
        Skip stack

    Inventory.Add(Stack.Template, Stack.Amount, GetCombinedQuality(Stack), gEStackType_Treasure)
```

### gETreasureDistribution_Mining
```text
Repeat for each stack:
    If the player has learned Perk_Mining:
        Amount = 2 * Stack.Amount
    Otherwise:
        Amount = Stack.Amount

    Inventory.Add(Stack.Template, Amount, Stack.Quality, gEStackType_Treasure)
```

## Trade Inventory

### gETreasureDistribution_Trade_Generate
```text
TransferStacks = Random selection from the interval [MinTransferStacks, MaxTransferStacks]

Repeat TransferStacks times:
    Stack = Select a random stack from the TreasureSet

    If Stack.Amount > 1:
        Amount = Random selection from the interval [Stack.Amount / 2, Stack.Amount]
    Otherwise:
        Amount = Stack.Amount

    Inventory.Add(Stack.Template, Amount, GetCombinedQuality(Stack), gEStackType_Merchandise)
```

### gETreasureDistribution_Trade_Refresh
```text
Repeat for each stack:
    If Stack.Amount > 1:
        Amount = Random selection from the interval [Stack.Amount / 2, Stack.Amount]
    Otherwise:
        Amount = Stack.Amount

    Inventory.Add(Stack.Template, Amount, GetCombinedQuality(Stack), gEStackType_Merchandise)
```

### gETreasureDistribution_Trade_NotRandom
Each stack is generated into the trade inventory in exactly the specified amount. (see also Modder Handbook 1.7.6)
```text
Repeat for each stack:
    Inventory.Add(Stack.Template, Stack.Amount, Stack.Quality, gEStackType_Merchandise)
```
## Pickpocket Inventory

### gETreasureDistribution_Pickpocket
```text
Stack = Select a random stack

Inventory.AddAndEquip(Stack.Template, Stack.Amount, Stack.Quality, gEStackType_Normal)
```

## Weaponry

### gETreasureDistribution_Weaponry
```text
Repeat for each stack:
    Quality = Stack.Quality
    if ( Stack.UseType != gEUseType_Arrow and Stack.UseType != gEUseType_Bolt )
            Quality |= gEItemQuality_Worn;
    Inventory.AddAndEquip(Stack.Template, Stack.Amount, Quality, gEStackType_Normal)
```

Min/MaxTransferStacks do not matter for Weaponry treasure sets. The engine simply processes the full list of stacks contained in the TreasureSet. Also note, that only the first Weaponry treasure set is considered.

If alternative balancing is enabled, once an NPC has been defeated by the hero (`PSNpc::DefeatedByPlayer == true`), that NPC's weaponry is no longer derived from its TreasureSets, but instead the NPC receives a standard weapon that depends on its species (Orc or Human) and political alignment.


