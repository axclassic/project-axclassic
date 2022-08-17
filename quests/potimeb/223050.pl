# 223050.pl npcid - Dersool_Fal`Giersnaol

sub EVENT_DEATH {
    quest::signalwith(223154,11060,4000);
    quest::emote(" stares at his hands, a look of disbelief and horror on his countenance. 'Innoruuk, I have failed you!'");
}
