## This appears to wait for the client to connect before executing
sub EVENT_CONNECT {
 ## Angelox: First bot is free  
 if (!defined $bot_spawn_limit){
    quest::setglobal("bot_spawn_limit", 1, 5, "F");
    $bot_spawn_limit = undef;
    $client->Message(6,"You receive a character flag!");
    $client->Message(14,"Your first bot should already be grouped with you, if not, use the '#bot create' command..");
    $client->Message(14,"Talk to Aediles Thrall about adding more bots to your group.");
 }
if((defined $event8) && ($event8 == 1)) {
        if(defined($qglobals{'EasterInProgress'})) {
            $client->Message(14, "Another Norrathian is working on the Easter Event in this zone, come back a little later.");
        }
        else {
            if($zoneid == 9) { # West Freeport freportw
			quest::signalwith(9186, $ulevel);
			}
        	if ($zoneid ==  10){  ##East Freeport freporte
			quest::signalwith(10233, $ulevel);
            } 
            if ($zoneid ==  68){ ##Butcherblock butcher
			quest::signalwith(68347, $ulevel);
            } 
            if ($zoneid ==  54){ ##Greater Faydark gfaydark
			quest::signalwith(54330, $ulevel);
            } 
	        if ($zoneid ==  56){ ##Steamfont Mountains steamfont
			quest::signalwith(56228, $ulevel);
            } 
	        if ($zoneid ==  25){ ##Nektulos Forest nektulos
			quest::signalwith(25234, $ulevel);
            } 
	        if ($zoneid ==  3){ ##Surefall Glades qrg
			quest::signalwith(3086, $ulevel);
            } 
	        if ($zoneid ==  30){ ##Everfrost everfrost
			quest::signalwith(30190, $ulevel);
            } 
	        if ($zoneid ==  78){ ##Field of Bone fieldofbone
			quest::signalwith(78250, $ulevel);
            } 
	        if ($zoneid ==  83){ ##Swamp of No Hope	swampofnohope
			quest::signalwith(83382, $ulevel);
            } 
	        if ($zoneid ==  38){ ##Toxxulia Forest tox
			quest::signalwith(38235, $ulevel);
            } 
            if ($zoneid ==  75){ ##Paineel paineel
			quest::signalwith(75192, $ulevel);
            } 
            if ($zoneid ==  46){ ##Innothule Swamp innothule
			quest::signalwith(46126, $ulevel);
            } 
	        if ($zoneid ==  47){ ##The Feerrott	feerrott
			quest::signalwith(47233, $ulevel);
            }  
	        if ($zoneid ==  20){ ##Kithicor	Forest kithicor
			quest::signalwith(20276, $ulevel);
            } 
	        if ($zoneid ==  189){ ##Mines of Glooming Deep	tutorialb
			quest::signalwith(189520, $ulevel);
            } 
        } #end else
    } # Easter Event End
} # EVENT_CONNECT End

##All of the following zones are used in the New Easter Event the signals tell the controller for each zone what level NPC to spawn
  # Easter Event Start
    if($qglobal{'event2'} == 1) { # Easter Event Active
        if(defined($qglobals{'EasterInProgress'})) {
            $client->Message(14, "Another Easter Event is still in progress, come back a little later.");
        }
        else {
            if($zoneid == 9) { # West Freeport freportw
			    quest::spawn2(9165,0,0,-66.5,59.1,-27,101.4); ##Peter Cottontail
                quest::signalwith(9186, $ulevel);
            }
        	if ($zoneid ==  10){  ##FreeportEast freporte
			quest::spawn2(10212,0,0,-638.8,-244.1,-55,208.8); ##Peter Cottontail
                quest::signalwith(10233, $ulevel);
            } 
            if ($zoneid ==  68){ ##Butcherblock butcher
			quest::spawn2(68326,0,0,-329.1,2909.8,-2.2,122.4); ##Peter Cottontail
			quest::signalwith(68347, $ulevel);
            } 
            if ($zoneid ==  54){ ##Greater Faydark gfaydark
			quest::spawn2(54309,0,0,210.6,81.2,-2.8,237.9); ##Peter Cottontail
			quest::signalwith(54330, $ulevel);
            } 
	        if ($zoneid ==  56){ ##Steamfont Mountains steamfont
			quest::signalwith(56228, $ulevel);
            } 
	        if ($zoneid ==  25){ ##Nektulos Forest nektulos
			quest::spawn2(25213,0,0,-990.9,2208.1,-6.4,18); ##Peter Cottontail
			quest::signalwith(25234, $ulevel);
            } 
	        if ($zoneid ==  3){ ##Surefall Glades qrg
			quest::spawn2(3065,0,0,107.3,62.4,1,164.1); ##Peter Cottontail
			quest::signalwith(3086, $ulevel);
            } 
	        if ($zoneid ==  30){ ##Everfrost everfrost
			quest::spawn2(30155,0,0,578.1,3213.4,-63.1,35.1); ##Peter Cottontail
			quest::signalwith(30190, $ulevel);
            } 
	        if ($zoneid ==  78){ ##Field of Bone fieldofbone
			quest::spawn2(78229,0,0,2679.4,-2122.4,12.2,4.6); ##Peter Cottontail
			quest::signalwith(78250, $ulevel);
            } 
	        if ($zoneid ==  83){ ##Swamp of No Hope	swampofnohope
			quest::spawn2(83361,0,0,-1943,-1145.6,25,171.8); ##Peter Cottontail
			quest::signalwith(83382, $ulevel);
            } 
	        if ($zoneid ==  38){ ##Toxxulia Forest tox
			quest::spawn2(38214,0,0,276.7,2373,-48.5,125.4); ##Peter Cottontail
			quest::signalwith(38235, $ulevel);
            } 
            if ($zoneid ==  75){ ##Paineel paineel
			quest::spawn2(75171,0,0,-75.8,1099.8,1,144.8); ##Peter Cottontail
			quest::signalwith(75192, $ulevel);
            } 
            if ($zoneid ==  46){ ##Innothule Swamp innothule
			quest::signalwith(46126, $ulevel);
            } 
	        if ($zoneid ==  47){ ##The Feerrott	feerrott
			quest::signalwith(47233, $ulevel);
            }  
	        if ($zoneid ==  20){ ##Kithicor	Forest kithicor
			quest::signalwith(20276, $ulevel);
            } 
	        if ($zoneid ==  189){ ##Mines of Glooming Deep	tutorialb
			quest::signalwith(189520, $ulevel);
            }
            if($zoneid == 49) { # Oggok oggok
                quest::spawn2(49137,0,0,394.3,250,567,64.6); ##Peter Cottontail
            }
        	if ($zoneid ==  19){  ##Rivervale
                quest::spawn2(19163,0,0,-103.9,-89.1,1,252.4); ##Peter Cottontail
            } 
            if ($zoneid ==  21){ ##North Qeynos qeynos2
			quest::spawn2(2158,0,0,216.9,328.3,0,241.1); ##Peter Cottontail
            } 
            if ($zoneid ==  61){ ##Northern Felwithe felwithea
			quest::spawn2(61100,0,0,75.3,16.2,1,180.4); ##Peter Cottontail
            } 
	        if ($zoneid ==  74){ ##Kerra Isle kerraridge
			quest::spawn(74560,0,0,-717.8,557.4,16.5,76.1); ##Peter Cottontail
            } #end else
        } # Easter Event End
    } # EVENT_CONNECT End


sub EVENT_ENTERZONE {
 no warnings 'all' ;
 $event1 = 0;
 $event2 = 0;
 $event3 = 0;
 $event4 = 0;
 $event5 = 0;
  ## Set proper spawn in dual-spawn zones
  if ($zoneid ==  81){ ##Droga
   if ($ulevel <=45){
      quest::spawn_condition("droga",7,0);
      quest::spawn_condition("droga",8,1);
      quest::delglobal("dropop");
      quest::setglobal("dropop",3,3,"F");}
    elsif ($ulevel >=46){
      quest::spawn_condition("droga",7,1);
      quest::spawn_condition("droga",8,0);
      quest::delglobal("dropop");
      quest::setglobal("dropop",3,3,"F");}
    }
  elsif ($zoneid == 107 ){ ##Nurga
    if ($ulevel <=45){
      quest::spawn_condition("nurga",7,0);
      quest::spawn_condition("nurga",8,1);
      quest::delglobal("nurpop");
      quest::setglobal("nurpop",3,3,"F");}
    elsif ($ulevel >=46){ 
      quest::spawn_condition("nurga",7,1);
      quest::spawn_condition("nurga",8,0);
      quest::delglobal("nurpop");
      quest::setglobal("nurpop",3,3,"F");}
   }
  elsif ($zoneid == 48 ){ ##CT
    if ($ulevel <=45){
	quest::spawn_condition("cazicthule",7,0);
	quest::spawn_condition("cazicthule",8,1);
	quest::delglobal("cazpop");
	quest::setglobal("cazpop",3,3,"F");
    }
    elsif ($ulevel >=46){
	quest::spawn_condition("cazicthule",7,1);
	quest::spawn_condition("cazicthule",8,0);
	quest::delglobal("cazpop");
	quest::setglobal("cazpop",3,3,"F");
   }
  }
  elsif ($zoneid ==  20 ){ ##Kitchicor
    if (($zonetime >= 0)&&($zonetime <= 800)){   #nighttime
	quest::spawn_condition("kithicor", 2,0); #live are 2
	quest::spawn_condition("kithicor", 1,1); #undead are 1
	}
    elsif (($zonetime >= 2000)&&($zonetime <= 2359)){ #nighttime
	quest::spawn_condition("kithicor", 2,0); #live are 2
	quest::spawn_condition("kithicor", 1,1);#undead are 1
	}
    else{	#daytime
	quest::spawn_condition("kithicor",2,1);
	quest::spawn_condition("kithicor",1,0);
	}
  }
  elsif (($zoneid ==  59 ) && ($event3 == 1) && ($williampop == 0)){ ##Mistmoore for William spawn
	quest::spawn2(59161,0,0,361.0,-213.0,-136.8,126.0);
	quest::delglobal("williampop");
	quest::setglobal("williampop",2,7,"F");
  }
 if($ulevel >= 50){
  my @zonex = (1..17,19..25,27..31,33..38,40..47,49..63,67..70,73..75,78,82..84,97,98,100,101,104,106,121,156,165,166,189); #Trivial ZoneIDs array
  my $zoney = $zoneid;
  if (grep {$_ eq $zoney} @zonex){
      $client->Message(15,"This zone is trivial to you since you aquired level 50 - you are only allowed to complete your unfinished quests.");
    }
  }
## Angelox: I'm gonna put in some random help for new players (new players are our life line :) - feel free to add.).
my $random_result = int(rand(100));
  if ($ulevel <= 3){
    if($random_result<=25){
       $client->Message(14,"AXClassic is much harder and challenging than normal EqEmu, you'll depend heavily on  Bot help for advancement."); 
       $client->Message(14,"Use your \"Find\" button and look for Aediles Thrall for Bot (Mercenary) help.");}
	elsif($random_result<=50){
       $client->Message(14,"There are updated client files posted at AXClassic Forums; http://forums.axclassic.com."); 
       $client->Message(14,"You will not be able to board the ship that sails from Freeport to Butcher and back without these files.");}
	elsif($random_result<=75){
       $client->Message(14,"Post petitions and requests at http://forums.axclassic.com."); 
       $client->Message(14,"You first bot-helper is free (no quest needed), find and talk to Aediles Thrall about adding more bots.");
       $client->Message(14,"Use the command '#bot create help' for creating your bot.");}
	elsif($random_result<=100){
       $client->Message(14,"Most travel in AXClassic is done by looted or quested moonstones and quested gates or portals for your Druid or Wizard Mercenary Bot."); 
       $client->Message(14,"Use your \"Find\" button and look for the Anita Thrall for gate or portal quests. ");}
## Angelox: This is for anouncing events
   }
  if ($random_result<=2){
    $client->Message(14,"If you spot a bug while playing, please post the bug report at http://forums.axclassic.com.");
  }
 elsif ($random_result<=4){
   $client->Message(14,"Ranger Band will upgrade your loose change to the highest coinage possible, hand him what you want converted.");
 }
 # elsif ($random_result<=4){
 #   $client->Message(14,"Don't forget: Rathe server restarts daily at 4:01am eastern time, server will stay down minutes for maintenance, then start again - make sure you're in a safe spot before the restart.");
 # }
 # elsif ($random_result<=15){
 #   $client->Message(14,"The new ladder started on New Years 2012, New characters created on or after this date should talk to Champion Darkwater.");
 # }
  elsif (($event1==1)&&($random_result<=70)){ #New Year event
    $client->Message(14,"New Year event is active! Ask Ranger Band about the New [Year]. You must be level 10 or lower for this event.");
  }
  elsif (($event2==1)&&($random_result<=70)){ #Easter event
    $client->Message(14,"Easter event is active! Ask Ranger Band about the [Easter] egg hunt.");
  }
  elsif (($event3==1)&&($random_result<=70)){ #Bloodhunt event
    $client->Message(14,"Bloodhunt event is active! Ask Countess Zellia about the [bloodhunt].");
  }
  elsif (($event4==1)&&($random_result<=70)){ #Bloodhunt event
    $client->Message(14,"Pitch Black event is active! Head on out to Ocean of Tears when it gets dark.");
  }
  elsif (($event5==1)&&($random_result<=70)){ #Random Moonstone event
    $client->Message(14,"Ranger Bands dislike for Orcs event is active! Talk to Ranger Band. You must be level 20 or lower for this event.");
  }
## Angelox: This is for CR Stone in case of death under level 10;
  #if (($ulevel <= 9) && ($zoneid != 165) && (${$name}!=2)) {
  if (($ulevel <= 9) && (!defined(${$name}))) {
   if ($ulevel == 1){
    $client->Message(14,"For game play in Shadeweavers Thicket, Ask Ranger Band about the [Moonstone].");}
   (${$name})=undef;
   quest::delglobal("$name");
   quest::setglobal("$name",0,7,"F");
  }
  elsif (($ulevel <= 9) && ($zoneid == 165) && (${$name}!=2)){
    $client->Message(14,"Ask Ranger Band again about a [Moonstone] for returning.");
    (${$name})=undef;
    quest::delglobal("$name");
    quest::setglobal("$name",2,7,"F");
  }
  elsif (($ulevel >= 10 && $ulevel <= 15) && (${$name}<=2)){
     if (defined (${$name})){
      $client->Message(14,"There are more Moonstone quests available, ask Champion Darkwater about the [Moonstones].");
      quest::delglobal("$name");
      (${$name})=undef;
     }
  }
  elsif ((!plugin::check_hasitem($client, 138)) && (defined ${$name}==2)){
    quest::summonitem(140);
  }
    ## Advise the players about our client status.
    if (($ulevel == 1) && (defined $bot_spawn_limit)){
      $clientver = $client->GetClientVersion();
      if($clientver > 3){
	$client->Message(15,"AXClassic is compatible with Titanium, SoF, SoD, and Underfoot clients.");
	$client->Message(15,"Since AXClassic is based on the Titanium era, some features with newer clients will be disabled.");
	$client->Message(15,"We hope you find AXClassics custom content interesting and stay with us.");
	$client->Message(15,"Thank you for trying us out!");
      }
   }
   elsif ($zoneid == 71){ ##airplane de-buff
      $client->BuffFadeAll();
   } 
  elsif($ulevel >= 15 && !defined($qglobals{Wayfarer}) && $client->GetStartZone()!=$zoneid && $zoneid !=50 && $zoneid !=12) {
      $client->Message(15,"A mysterious voice whispers to you, 'If you can feel me in your thoughts, know this -- something is changing in the world and I reckon you should be a part of it. I do not know much, but I do know that in every home city and the wilds there are agents of an organization called the Wayfarers Brotherhood. They are looking for recruits . . . If you can hear this message, you are one of the chosen. Rush to your home city, or search the West Karanas and Rathe Mountains for a contact if you have been exiled from your home for your deeds, and find out more. Adventure awaits you, my friend.'");
  }
}

sub EVENT_COMBINE_SUCCESS
{
    if ($recipe_id =~ /^1090[4-7]$/) {
        $client->Message(1,
            "The gem resonates with power as the shards placed within glow unlocking some of the stone's power. ".
            "You were successful in assembling most of the stone but there are four slots left to fill, ".
            "where could those four pieces be?"
        );
    }
    elsif ($recipe_id =~ /^10(903|346|334)$/) {
        my %reward = (
            melee  => {
                10903 => 67665,
                10346 => 67660,
                10334 => 67653
            },
            hybrid => {
                10903 => 67666,
                10346 => 67661,
                10334 => 67654
            },
            priest => {
                10903 => 67667,
                10346 => 67662,
                10334 => 67655
            },
            caster => {
                10903 => 67668,
                10346 => 67663,
                10334 => 67656
            }
        );
        my $type = plugin::ClassType($class);
        quest::summonitem($reward{$type}{$recipe_id});
        quest::summonitem(67704);
        $client->Message(1,"Success");
    }
}

sub EVENT_LOOT {
	my @items_list = (82731, 82734, 6639, 6631, 2735, 1619, 1620, 25210, 25212);
	# Karnor's Castle
	# 82731 Fabled_Jade_mace
	# 82734 Fabled_Tranquil staff
	# 6639 Tranquil staff
	# Sebilis
	# 6631 Ton pos bo stick of understanding
	# 2735 Fungus covered scale tunic
	# 1619 siblisian berserker cloak
	# 1620 Runebranded girdle
	# Kael
	# 25210 Blade of Carnage
	# 25212 Flayed Barbarian Skin Leggings
	if(grep(/^$looted_id$/, @items_list)) {
		my $item = quest::varlink($looted_id);
		quest::we(14, "The Rathe server congratulates $name, the uber $class for looting an extremely rare -$item-!");
	}
}  

