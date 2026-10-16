Remove PContent
===============

PContent ("parameterized content") is the loot system of Dungeon Siege. The system handles available equipment (armor, weapons etc.) and enchantments ("of the Badger" etc.), and generates loot to drop from enemies and containers as well as to appear in shops.
This mod lets you remove all the original loot, or parts of it.

Enchantments
------------

Choose only one - these files are not combinable, as they override each other. That's why I provide all three combinations:
- Remove LoA enchantments: This removes LoA enchantments and leaves all the Vanilla enchantments in place. Use this for a more Vanilla experience even when playing with the DSLOA engine.
- Remove Vanilla enchantments: This removes all the Vanilla enchantments and leaves the LoA enchantments in place. Not sure what the use case could be. LoA only added a few enchantments like chance to cast Zap on taking damage.
- Remove ALL enchantments: No more blue items for you. Warning: towards the endgame, the PContent system almost always needs enchantments to generate loot, and will fail to do so if you remove them all. Shops towards the end of the campaigns will be almost empty.

Equipments
----------

These files you can combine any way you want.
The names should be more or less descriptive.
- All the Hassat/Zaurask themed armor and Dexterity/Intelligence requiring armor from LoA are contained in the "LoA armor" file.
- The "Vanilla misc" file contains rings, amulets & spellbooks.
- Shields are contained in the "armor" files.

Notes
-----

- What happens when you remove ALL enchantments?
  As said above, shops towards the end will be almost empty, but basically the engine handles it just fine and doesn't crash.
  When you use the +faertehbadgar cheat, you'll simply get plain items without the "of the Badger" enchantment.
- What happens when you remove ALL equipments?
  Shops will be even emptier - they'll only contain the hard-coded stuff, like certain important spells, plain spellbooks, backpacks, and all the potions.
  The same goes for loot drops from enemies & containers - nothing much will drop apart from gold and the few hard-coded drops that exist.
- What happens when you remove enchantments / equipments and then load a savegame?
  Removing equipment from the loot pool is no problem at all, the items that your characters already possess won't change. Removing enchantments: untested, maybe crashes.
- This mod only removes original equipments - if you add mods like Summons Collection or NPC Clothes, those won't be affected.
  (And the engine will generate NPC clothes with high-level enchantments in sheer desperation to try and generate higher-level loot.)
- If you want to try a certain playthrough - let's say Kingdom of Ehb but with LoA equipments only - but want to have a rough idea what you're getting yourself into, I recommend having a look at the "Original Shops" map available on NexusMods.
