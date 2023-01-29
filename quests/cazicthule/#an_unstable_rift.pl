# RoF Event

my $avatar_of_fear_spell_id = 2128;
my $avatar_of_fear_id = 48418;

# npcId = 48126
sub EVENT_SPAWN {
    # spawn Avatar of Fear
    quest::emote("glows, and then dissipates");
    quest::spawn2($avatar_of_fear_id, 90, 0, 587, 1090, -94, 360);
    quest::ze(1, "You struggle with the desire to flee in terror!");
    quest::ze(1, "A piercing, disembodied scream echos from deep within the temple. Your body begins to tremble uncontrollably with fear.");
    $npc->CastSpell($avatar_of_fear_spell_id, 48126);
    quest::depop();
}

