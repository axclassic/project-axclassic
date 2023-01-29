# a_greenblood_piranha (48438)

sub EVENT_SLAY {
    $client->Message(5,"$mname just killed you! Better luck next time.");
    quest::delglobal("CazicEpic");
    quest::depop(48435);
    quest::depop(48434);
    quest::depop(48437);
    quest::depop(48433);
    quest::depopall(48438);
}
