
//list of packets we need to encode on the way out:
E(OP_SendCharInfo)
E(OP_SendAATable)
E(OP_LeadershipExpUpdate)
E(OP_PlayerProfile)
E(OP_NewSpawn)
E(OP_ZoneSpawns)
E(OP_ZoneEntry)
E(OP_NewZone)
E(OP_CharInventory)
E(OP_ItemLinkResponse)
E(OP_ItemPacket)
E(OP_GuildMemberList)
E(OP_ZoneServerInfo)
E(OP_SpawnDoor)
E(OP_GroundSpawn)
E(OP_Illusion)
E(OP_ManaChange)
E(OP_WearChange)
E(OP_ClientUpdate)
E(OP_SendZonepoints)
//OP_AdventureData
//OP_RaidUpdate

//list of packets we need to decode on the way in:
D(OP_SetServerFilter)
D(OP_CharacterCreate)
D(OP_ItemLinkClick)
D(OP_ConsiderCorpse)
D(OP_Consider)
D(OP_WearChange)
D(OP_ClientUpdate)

#undef E
#undef D
