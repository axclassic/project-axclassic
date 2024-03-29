## This appears to wait for the client to connect before executing
sub EVENT_CONNECT {
    ## Angelox: First bot is free  
    if(!defined $bot_spawn_limit) {
        quest::setglobal("bot_spawn_limit", 1, 5, "F");
        $bot_spawn_limit = undef;
        $client->Message(6,"You receive a character flag!");
        $client->Message(14,"Your first bot should already be grouped with you, if not, use the '#bot create' command..");
        $client->Message(14,"Talk to Aediles Thrall about adding more bots to your group.");
        quest::setglobal("seen_shadeweaver", 0, 5, "F");
        $seen_shadeweaver = undef;
    }
} # EVENT_CONNECT End

sub EVENT_ENTERZONE {
    no warnings 'all' ;
    $event1 = 0;
    $event2 = 0;
    $event3 = 0;
    $event4 = 0;
    $event5 = 0;
    $clientver = $client->GetClientVersion();
    my $rand1 = int(rand(100));
    my $rand2 = int(rand(100));
    my $rand3 = int(rand(100));
    my $rand4 = int(rand(100));
    ## Set proper spawn in dual-spawn zones
    if($zoneid ==  81) {
        ##Droga
        if($ulevel <=45) {
            quest::spawn_condition("droga",7,0);
            quest::spawn_condition("droga",8,1);
            quest::delglobal("dropop");
            quest::setglobal("dropop",3,3,"F");
        }
        elsif($ulevel >=46) {
            quest::spawn_condition("droga",7,1);
            quest::spawn_condition("droga",8,0);
            quest::delglobal("dropop");
            quest::setglobal("dropop",3,3,"F");
        }
    }
    elsif($zoneid == 107 ) {
        ##Nurga
        if($ulevel <=45) {
            quest::spawn_condition("nurga",7,0);
            quest::spawn_condition("nurga",8,1);
            quest::delglobal("nurpop");
            quest::setglobal("nurpop",3,3,"F");
        }
        elsif($ulevel >=46) {
            quest::spawn_condition("nurga",7,1);
            quest::spawn_condition("nurga",8,0);
            quest::delglobal("nurpop");
            quest::setglobal("nurpop",3,3,"F");
        }
    }
    elsif($zoneid == 48) {
        ##CT
        if(!defined $cazpop) {
            if($ulevel <=45) {
                quest::setglobal("cazpop",1,3,"H3");
                $client->Message(14, "Welcome to The Temple of Cazic Thule.");
                quest::spawn_condition("cazicthule",7,0);
                quest::spawn_condition("cazicthule",8,1);
            }
            elsif($ulevel >=46) {
                quest::setglobal("cazpop",2,3,"H3");
                $client->Message(14, "Welcome to The Accursed Temple of Cazic Thule.");
                quest::spawn_condition("cazicthule",7,1);
                quest::spawn_condition("cazicthule",8,0);
            }
        }
        else {
            if($cazpop eq 1) {
                $client->Message(14, "Welcome to Cazic 1.0");
            }
            if($cazpop eq 2) {
                $client->Message(14, "Welcome to Cazic 2.0");
            }
        }
        $cazpop = undef;
    }
#    elsif($zoneid ==  20 ) {
        ##Kitchicor
#        if(($zonetime >= 0)&&($zonetime <= 800)) {
#            #nighttime
#            quest::spawn_condition("kithicor", 2,0); #live are 2
#            quest::spawn_condition("kithicor", 1,1); #undead are 1
#        }
#        elsif(($zonetime >= 2000)&&($zonetime <= 2359)) {
#            #nighttime
#            quest::spawn_condition("kithicor", 2,0); #live are 2
#            quest::spawn_condition("kithicor", 1,1);#undead are 1
#        }
#        else {
#            #daytime
#            quest::spawn_condition("kithicor",2,1);
#            quest::spawn_condition("kithicor",1,0);
#        }
#    }
    elsif(($zoneid ==  59 ) && ($event3 == 1) && ($williampop == 0)) {
        ##Mistmoore forWilliam spawn
        quest::spawn2(59161,0,0,361.0,-213.0,-136.8,126.0);
        quest::delglobal("williampop");
        quest::setglobal("williampop",2,7,"F");
    }
#    if($ulevel >= 50) {
#        my @zonex = (1..17,19..25,27..31,33..38,40..47,49..63,67..70,73..75,78,82..84,97,98,100,101,104,106,121,156,165,166,189); #Trivial ZoneIDs array
#        my $zoney = $zoneid;
#        if(grep{$_ eq $zoney} @zonex) {
#            $client->Message(15,"This zone is trivial to you since you aquired level 50 - you are only allowed to complete your unfinished quests.");
#        }
#    }
    if ($rand1<=10){
    	if($ulevel >= 15 && !defined($qglobals{Wayfarer}) && $client->GetStartZone()!=$zoneid && $zoneid !=50 && $zoneid !=12) {
    	    $client->Message(15,"A mysterious voice whispers to you, 'If you can feel me in your thoughts, know this -- something is changing in the world and I reckon you should be a part of it. I do not know much, but I do know that in every home city and the wilds there are agents of an organization called the Wayfarers Brotherhood. They are looking for recruits . . . If you can hear this message, you are one of the chosen. Rush to your home city, or search the West Karanas and Rathe Mountains for a contact if you have been exiled from your home for your deeds, and find out more. Adventure awaits you, my friend.'");
    	}
    }
    ## Angelox: I'm gonna put in some random help for new players (new players are our life line :) - feel free to add.).
    if($ulevel <= 3) {
        if($rand2<=25) {
            $client->Message(14,"AXClassic is much harder and challenging than normal EqEmu, you'll depend heavily on  Bot help for advancement."); 
            $client->Message(14,"Use your \"Find\" button and look for Aediles Thrall for Bot (Mercenary) help.");
        }
        elsif($rand2<=50) {
            $client->Message(14,"You best be using the Underfoot client posted at AXClassic Forums; http://forums.axclassic.com."); 
            $client->Message(14,"You will not be able to board the ship that sails from Freeport to Butcher and back without an AXClassic client.");
            $client->Message(14,"You may also have problems with disconnects if not using an AXClassic client.");
        }
        elsif($rand2<=75) {
            $client->Message(14,"Post petitions and requests at http://forums.axclassic.com."); 
            $client->Message(14,"You first bot-helper is free (no quest needed), find and talk to Aediles Thrall about adding more bots.");
            $client->Message(14,"Use the command '#bot create help' for creating your bot.");
        }
        elsif($rand2<=100) {
            $client->Message(14,"Most travel in AXClassic is done by looted or quested moonstones and quested gates or portals for your Druid or Wizard Mercenary Bot."); 
            $client->Message(14,"Use your \"Find\" button and look for the Anita Thrall for gate or portal quests. ");
        }
        ## Angelox: This is for anouncing events
    }
    if($rand2<=2) {
        $client->Message(14,"If you spot a bug while playing, please post the bug report at http://forums.axclassic.com.");
    }
    elsif ($rand2<=4) {
        $client->Message(14,"Ranger Band will upgrade your loose change to the highest coinage possible, hand him what you want converted.");
    }
    # elsif ($random_result<=4){
    #   $client->Message(14,"Don't forget: Rathe server restarts daily at 4:01am eastern time, server will stay down minutes for maintenance, then start again - make sure you're in a safe spot before the restart.");
    # }
    # elsif ($random_result<=15){
    #   $client->Message(14,"The new ladder started on New Years 2012, New characters created on or after this date should talk to Champion Darkwater.");
    # }
    elsif(($event1==1)&&($rand3<=70)) {
        #New Year event
        $client->Message(14,"New Year event is active! Ask Ranger Band about the New [Year]. You must be level 10 or lower for this event.");
    }
    elsif(($event2==1)&&($rand3<=70)) {
        #Easter event
        $client->Message(14,"Easter event is active! Ask Ranger Band about the [Easter] egg hunt.");
    }
    elsif(($event3==1)&&($rand3<=70)) {
        #Bloodhunt event
        $client->Message(14,"Bloodhunt event is active! Ask Countess Zellia about the [bloodhunt].");
    }
    elsif(($event4==1)&&($rand3<=70)) {
        #Bloodhunt event
        $client->Message(14,"Pitch Black event is active! Head on out to Ocean of Tears when it gets dark.");
    }
    elsif(($event5==1)&&($rand3<=70)) {
        #Random Moonstone event
        $client->Message(14,"Ranger Bands dislike for Orcs event is active! Talk to Ranger Band. You must be level 20 or lower for this event.");
    }
    ## Angelox: This is for CR Stone in case of death under level 10;
    #if (($ulevel <= 9) && ($zoneid != 165) && (${$name}!=2)) {
    if ($ulevel <= 9){
      if(!defined $seen_shadeweaver) {
          $client->Message(14,"For game play in Shadeweavers Thicket, Ask Ranger Band about the [Moonstone].");
          quest::setglobal("seen_shadeweaver", 0, 5, "F");
          $seen_shadeweaver = undef;
      }
      if (($zoneid == 165) && ($seen_shadeweaver <= 1)) {
    	  $client->Message(14,"You should bind yourself here if you plan to play in Shadeweavers Thicket.");
    	  $client->Message(14,"If you die,this stone will send you back to Shadeweavers and will work only a few times.");  
    	  quest::summonitem(140); #CR Stone for newbes in Shadeweavers
    	  $client->Message(14,"Ask Ranger Band again about a [Moonstone] for returning.");
    	  quest::setglobal("seen_shadeweaver", 2, 5, "F");
    	  $seen_shadeweaver = undef;
      }
    }
    elsif(($ulevel >= 10 && $ulevel <= 15) && ($seen_shadeweaver >= 1)) {
          $client->Message(14,"There are more Moonstone quests available, ask Champion Darkwater about the [Moonstones].");
          quest::setglobal("seen_shadeweaver", 0, 5, "F");
          $seen_shadeweaver = undef;
    }
    ## Advise the players about our client status.
    if($clientver < 4) {
        if($rand4<=10) {
            $client->Message(15,"AXClassic is compatible with Underfoot and Titanium clients, but best compatible with the Underfoot client.");
            $client->Message(15,"Underfoot client is what the developers work with and we urge you to use.");
            $client->Message(15,"You can download the AXClassic version of Underfoot at the AXClassic Forums.");
            $client->Message(15,"Thank you for playing here!");
        }
        elsif($ulevel == 1) {
            $client->Message(15,"AXClassic is compatible with Underfoot and Titanium clients, but best compatible with the Underfoot client.");
            $client->Message(15,"Underfoot client is what the developers work with and we urge you to use.");
            $client->Message(15,"You can download the AXClassic version of Underfoot at the AXClassic Forums.");
            $client->Message(15,"Thank you for playing here!");
        }
    }
    if($zoneid == 71) {
        ##airplane de-buff
        $client->BuffFadeAll();
    } 
}

sub EVENT_COMBINE_SUCCESS {
    if($recipe_id =~ /^1090[4-7]$/) {
        $client->Message(1,
                         "The gem resonates with power as the shards placed within glow unlocking some of the stone's power. ".
                         "You were successful in assembling most of the stone but there are four slots left to fill, ".
                         "where could those four pieces be?"
                        );
    }
    elsif($recipe_id =~ /^10(903|346|334)$/) {
        my %reward = (
                     melee  =>{
                     10903 => 67665,
                     10346 => 67660,
                     10334 => 67653
                     },
                     hybrid =>{
                     10903 => 67666,
                     10346 => 67661,
                     10334 => 67654
                     },
                     priest =>{
                     10903 => 67667,
                     10346 => 67662,
                     10334 => 67655
                     },
                     caster =>{
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

