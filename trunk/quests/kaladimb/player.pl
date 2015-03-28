sub EVENT_ENTERZONE {
no warnings 'all' ;
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
if (((defined $Classic2012) && ($Classic2012 < 1)) | (!defined $Classic2012)){
 #$client->Message(14,"AXClassic mode.");
 if($ulevel >= 50){
  my @zonex = (1..17,19..31,33..38,40..47,49..63,67..70,73..75,78,82..84,97,98,100,101,104,106,121,156,165,166,189); #Trivial ZoneIDs array
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
 ## Angelox: First bot is free  
 if (!defined $bot_spawn_limit){
    quest::setglobal("bot_spawn_limit", 1, 5, "F");
    $bot_spawn_limit = undef;
    $client->Message(6,"You receive a character flag!");
    $client->Message(14,"Your first bot should already be grouped with you, if not, use the '#bot create' command..");
    $client->Message(14,"Talk to Aediles Thrall about adding more bots to your group.");
 }
  #elsif (!defined($tswitch)) {
   # quest::setglobal("tswitch",6,5,"F");
   # $taunt_switch = undef;
 # }
 }
elsif ((defined $Classic2012) && ($Classic2012 > 0)) {
 #$client->Message(14,"Classic 2011 mode.");
   if (!defined $bot_spell_6){
    quest::setglobal("bot_spell_1",3,5,"F");
    $bot_spell_1 = undef;
    quest::setglobal("bot_spell_5",6,5,"F");
    $bot_spell_5 = undef;
    quest::setglobal("bot_spell_6",2,5,"F");
    $bot_spell_6 = undef;
    quest::setglobal("bot_spell_2",3,5,"F");
    $bot_spell_2=undef;
    quest::setglobal("bot_spell_3",3,5,"F");
    $bot_spell_3=undef;
    quest::setglobal("bard_spell_1",1,5,"F");
    $bard_spell_1 = undef;
    $client->Message(14,"Bot spells scribed, will become available as you level.");
    quest::setglobal("bot_spawn_limit", 1, 5, "F");
    $bot_spawn_limit = undef;
    $client->Message(6,"You receive a character flag!");
    $client->Message(14,"You have one bot available for creation, use the '#bot create' command.");
    }
   elsif (($ulevel >= 5)&&($ulevel <= 9)&&($qglobals{bot_spawn_limit} <= 1)){ 
    quest::setglobal("bot_spawn_limit", 2, 5, "F");
    $bot_spawn_limit = undef;
    $client->Message(6,"You receive a character flag!");
    $client->Message(14,"You have your second bot available for creation, use the '#bot create' command.");
    }
   elsif (($ulevel >= 10)&&($ulevel <= 14)&&($qglobals{bot_spawn_limit} <= 2)){ 
    quest::setglobal("bot_spawn_limit", 3, 5, "F");
    $bot_spawn_limit = undef;
    $client->Message(6,"You receive a character flag!");
    $client->Message(14,"You have your third bot available for creation, use the '#bot create' command.");
    }
   elsif (($ulevel >= 15)&&($ulevel <= 19)&&($qglobals{bot_spawn_limit} <= 3)){ 
    quest::setglobal("bot_spawn_limit", 4, 5, "F");
    $bot_spawn_limit = undef;
    $client->Message(6,"You receive a character flag!");
    $client->Message(14,"You have your fourth bot available for creation, use the '#bot create' command.");
    }
   elsif (($ulevel >= 20)&&($ulevel <= 50)&&($qglobals{bot_spawn_limit} <= 4)){ 
    quest::setglobal("bot_spawn_limit", 5, 5, "F");
    $bot_spawn_limit = undef;
    $client->Message(6,"You receive a character flag!");
    $client->Message(14,"You have your fifth bot available for creation, use the '#bot create' command.");
    }
    ## Angelox: This is for anouncing events
   my $random_result = int(rand(100));
   $clientver = $client->GetClientVersion();
   if ($random_result<=2 && $clientver > 3){ ##Need to fix this in the hard code
    $client->Message(14,"If you spot a bug while playing, please post it at http://forums.axclassic.com.");
    $client->Message(14,"Petitions can be posted at http://forums.axclassic.com."); 
    }
   elsif ($random_result<=4){
    $client->Message(14,"This server restarts daily at 4:01am eastern time, server will stay down a few minutes for maintenance, then start again - make sure you're in a safe spot before the restart.");
    }
  }
    ## Both Database advisories
    #
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
   elsif ($zoneid == 215){ ##poair de-buff
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