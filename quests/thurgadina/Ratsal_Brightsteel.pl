############################################
## NPC: Ratsal Brightsteel                 ##
## Zone: Thurgidan A                      ##
## Quest: Server Challenge Tier Weapons   ##
## Created by Resqu for AXClassic         ##
##                    07-03-2014          ##
############################################
sub EVENT_SAY {
my $help = quest::saylink("help", 1);
my $stronger = quest::saylink("stronger", 1);

if ($text=~/hail/i && $ulevel >= 65) {
    $client->Message(14,"Hello $name , You seem plenty strong enough, maybe you can $help with the cause.");
  }
if ($text=~/hail/i && $ulevel < 65) {
    $client->Message(14,"Take a look around. We have plenty to buy. Maybe one you will be strong enough to help the cause.");
  }
if ($text=~/help/i && $ulevel >= 65) {
    $client->Message(14," As you know the dragons of Norrath have grown stronger and begun to populate the Western Waste. If they are not stopped then our homes will be in danger. We need $stronger weapons and this my friend is were you can help.");
  }
if ($text=~/stronger/i && $ulevel >= 65) {
    $client->Message(14,"Those dragons are made of some tough material so I bet, they will make excellent weapons. I'll tell you what! If you bring one of their heads, I will fiddle around with it and see what I can make from them. Better yet bring me four and I will give you one of the weapons I can make from them.");
  }

}

sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 25118 => 4)) {
    $client->Message(14,"Very Good! $class , Indeed fine products you have here. I am a dwarf of my word here is your Proof DragonSlayer."); #randon Dragonslayer weapon.
    my @items = (119834,119835,119836,119837,119838); #All DragonSlayer Weapons
    my $total = $items[ rand @items ]; #Randomize
    quest::summonitem($total);
    return 1;
 }
else {
    $client->Message(14,"I don't need this $name. Take it back.");
    plugin::return_items(\%itemcount);
    return 1;
 }
}
