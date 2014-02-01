# Shaman Epic 1.0
# #Lord Rak`Ashiir
# City of Mist
# True Spirit Faction - Warmly
# Have to save as NPCID Number
# Aramid September 2006

my $x;
my $y;
my $z;
my $h;
my $entid1;
my $mob1;
my $mob1attack;

sub EVENT_ITEM {
 if($faction < 3) {
  if (plugin::check_handin(\%itemcount, 1673 => 1)) {
   quest::emote("looks down at the tear in his hand and says 'A minion of my god came to me one night. I knew it was of Cazic-Thule as I was frozen in terror. My mind screamed for me to flee but my body would not respond. The being took my daughter and vanished to only he knew where. When I regained control of my body and thoughts, I felt nothing but betrayal. I don't care anymore about anything. If you want repentance then slay me, $name");
   quest::faction(342,10);
    quest::ding(); quest::exp(10000);
   $x = $npc->GetX();
   $y = $npc->GetY();
   $z = $npc->GetZ();
   $h = $npc->GetHeading();
   quest::depop();
   $entid1 = quest::spawn2(90183,0,0,$x,$y,$z,$h);
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
    quest::emote("You are not yet worth of this quest!!!");
    plugin::return_items(\%itemcount);
    return;
   }
}

# End of File - NPCID 90174 - #Lord Rak`Ashiir
