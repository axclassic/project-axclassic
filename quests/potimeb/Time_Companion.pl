#######################################
## NPC: Time_Companion (223228)      ##
## Zone: Plane of Time B             ##
## Threeflies dec 2012               ##
## Revised by Caved for AXClassic    ##
##                    05-05-2014     ##
## Trial mover NPC                   ##
#######################################

sub EVENT_SAY {
my $fire = quest::saylink("fire", 1);
my $water = quest::saylink("water", 1);
my $earth = quest::saylink("earth", 1);
my $air = quest::saylink("air", 1);
my $undead = quest::saylink("undead", 1);

if ($text=~ /hail/i) {
$client->Message(14,"Please choose:| $fire | $water | $air | $undead  | $earth |  as your destination.");
}

################FIRE#####################################
if ($text=~/fire/i) {
  if (defined($qglobals{$name."potimeb"})) {
     $client->Message(14,"Good luck $name , porting you inside your instance.");
     my $QGlobalValue = $qglobals{$name."potimeb"};
     quest::MovePCInstance(223, $QGlobalValue, -59.1, 587.1, 493.9, [64.6]);
     return 1; 
      }
  else {
     $client->Message(14,"Good luck $name , porting inside regular instance.");
     quest::movepc(223, -59.1, 587.1, 493.9, [64.6]);
     return 1;
      }
}

################WATER####################################
if ($text=~/water/i) {
  if (defined($qglobals{$name."potimeb"})) {
     $client->Message(14,"Good luck $name , porting you inside your instance.");
     my $QGlobalValue = $qglobals{$name."potimeb"};
     quest::MovePCInstance(223, $QGlobalValue, -58, 884.8, 493.7, [67.8]);
     return 1;
      } 
  else {
     $client->Message(14,"Good luck $name , Porting inside regular instance"); 
     quest::movepc(223, -58, 884.8, 493.7, [67.8]);
     return 1;
      }
}

################EARTH####################################
if ($text=~/earth/i) {
  if (defined($qglobals{$name."potimeb"})) {
     $client->Message(14,"Going to send you back to your Time B instance now.");
     my $QGlobalValue = $qglobals{$name."potimeb"};
     quest::MovePCInstance(223, $QGlobalValue, -39.13, 1092.13, 495.53, [65.5]);
     return 1;
      }
  else {
     $client->Message(14,"Good luck $name , Porting inside regular instance"); 
     quest::movepc(223, -61.9, 1638.6, 496.1, [65.5]);
     return 1;
      }
}

################AIR######################################
if ($text=~/air/i) {
  if (defined($qglobals{$name."potimeb"})) {
     $client->Message(14,"Good luck $name , porting you inside your instance.");
     my $QGlobalValue = $qglobals{$name."potimeb"};
     quest::MovePCInstance(223, $QGlobalValue, -59.2, 1333.4, 494.1, [56.9]);
     return 1;
      }
  else {
     $client->Message(14,"Good luck $name , Porting inside regular instance"); 
     quest::movepc(223, -59.2, 1333.4, 494.1, [56.9]);
     return 1;
      }
}

################UNDEAD###################################
if ($text=~/undead/i) {
  if (defined($qglobals{$name."potimeb"})) {
     $client->Message(14,"Good luck $name , porting you inside your instance.");
     my $QGlobalValue = $qglobals{$name."potimeb"};
     quest::MovePCInstance(223, $QGlobalValue, -36.5, 1092.4, 495.2, [54.6]);
     return 1;
      }
  else {
     $client->Message(14,"Good luck $name , Porting inside regular instance");
     quest::movepc(223, -36.5, 1092.4, 495.2, [54.6]);
     return 1;
      }
}
}
