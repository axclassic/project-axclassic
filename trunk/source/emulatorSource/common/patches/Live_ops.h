
//list of packets we need to encode on the way out:
//E(OP_SendAATable)
E(OP_SendCharInfo)
E(OP_ZoneServerReady)
E(OP_GuildMemberLevelUpdate)
//E(OP_ExpansionInfo)

//list of packets we need to decode on the way in:
//D(OP_SetServerFilter)


#undef E
#undef D
