# Shaman Epic 1.0
# #Neh`Ashiir
# City of Mist
# True Spirit Faction - Warmly
# Have to save as NPCID Number  Neh`Ashiir
# Aramid September 2006

my $x;
my $y;
my $z;
my $h;
my $entid1;
my $mob1;
my $mob1attack;


sub EVENT_ITEM {
 if ($class eq "Shaman") {
  if (plugin::check_handin(\%itemcount, 1681 => 1)) {
   quest::say("Nothing is left to hide now. You shall have the truth. But truth is not won easily and if you cannot defeat me, you have not the ability to see that vengeance is served. Brace yourself!");
   $x = $npc->GetX();
   $y = $npc->GetY();
   $z = $npc->GetZ();
   $h = $npc->GetHeading();
   quest::depop();
   $entid1 = quest::spawn2(90181,0,0,$x,$y,$z,$h);
   $mob1 = $entity_list->GetMobID($entid1);
   $mob1attack = $mob1->CastToNPC();
   $mob1attack->AddToHateList($client, 1);
 }
  else {
    quest::emote("will not take this item.");
    plugin::return_items(\%itemcount);
    return;
   }
 }
  else {
    quest::emote("will not take this item.");
    plugin::return_items(\%itemcount);
    return;
   }
 }


# End of File - NPCID 90184 - #Neh`Ashiir
