#############
#NPC: Stanos_Herkanor
#Quest Name: Ragebringer, Rogue Epic Quest
#Quest by: Solid11
#Revised: Olhadon
#NPCs Involved: Anson_McBale, Founy Jestands, Tani N`Mar, Eldreth, General V`Ghera
#Items Involved: Stained Parchment Top ID:28010, Stained Parchment Bottom ID:28011, Stained Parchment ID:18759, General's Pouch ID:28013, Cazic Quill ID:7506, Jagged Diamond Dagger ID:7505, Translated Parchement ID:18961, Sealed Box ID:28057, Ragebringer ID:11057
#zone: highpass

sub EVENT_SPAWN{
  #5 minute timer set for despawn.
  quest::settimer(1,300);
}

sub EVENT_COMBAT{
  #resets depop timer if entering or leaving combat.
  quest::stoptimer(1);
  quest::settimer(1,300); #5 minute timer
  #Note: On live, numerous mobs say 'The boss might need some help!' when fighting Stanos. 
  my $random_result = int(rand(100));
  if(($combat_state == 1) &&($random_result<=25)){
    # Do nothing
  }
  elsif(($combat_state == 1) &&($random_result<=50)){
    quest::say("Filth like you must die!");
  }
  elsif(($combat_state == 1) &&($random_result<=75)){
    quest::say("Filth like you are better left dead than alive.");
  }
  elsif(($combat_state == 1) &&($random_result<=100)){
    quest::say("You have no place in our realm!");
  }   
}

sub EVENT_ATTACK {
  quest::shouts("I will kill you an your lickspittle friends for this!");
}
sub EVENT_SAY {
  # To make Rogue only, add in ($class eq "Rogue") to the if statement
  if($ulevel >= 50){
    if($text=~/hail/i) {
      # checking if Anson McBale is spawned.
      my $npccheck = $entity_list->GetMobByNpcTypeID(5037);
      if ($npccheck == 0) {
        #Text by Solid11
        quest::say("Ah, the pouch. This is the first step. The Circle has to be upset having this taken right out from under them. That speaks well of the person who did the taking. [Hanns] must be even more furious now. I think I might be able to trust you. We could make a [deal]. I have a blade I won't use anymore, and you have those fine looking daggers Vilnius gave you. Of course, you would have to do something for me first. Let me tell you my [story], then you decide.");
      }
      else {
        #Live server text when Anson Mcbale is up.
        quest::say("Ah, the pouch. This is the first step Anson. The Circle has to be upset having this taken right out from under them. That speaks well of the person who did the taking. [Hanns] must be even more furious now <chuckle>.");
      #event_signal for Anson to chat.
      quest::signalwith(5037, 1, 2);
      }
    }
    elsif($text=~/who are you/i) {
      quest::say("<chuckle> You are young, aren't you? I ran [the Circle] out of Qeynos for well over 30 years, and did a right fine job of it. It's a long story, and isn't over yet. I have much to answer for.");
    }
    elsif($text=~/circle/i) {
      quest::say("The Circle of Unseen Hands, you oaf! The largest collection of thieves, murderers, con artists, and rogues in the world. No finer men can be found anywhere.");
    }
    elsif($text=~/deal/i) {
      quest::say("Aye, $name, we could make a deal. I have a blade I won't use anymore, and you have those fine looking daggers Vilnius gave you. Of course, you would have to do something for me first. Let me tell you my [story], then you decide.");
    }
    elsif(($text=~/your story/i) || ($text=~/johann/i)){
      quest::say("Johann Krieghor was the leader of the Circle and I was his second-in-command. He made a dark bargain with a Teir'Dal [General]. The Circle was to assassinate [Joren], the high elf ambassador to Qeynos. Had the plot worked, it would have weakened the alliance between high elves and humans, and possibly caused a war between the two powers. In either case, the Teir'Dal would have profited greatly by this event, and all others would have suffered. I could not stand by and let this happen, but Johann would not be deterred, for the Teir'Dal had promised him much. I had no choice but to kill Johann and the Teir'Dal agent. I made it look like they offed each other, and then I hid the [tools].");
    }
    elsif($text=~/joren/i) {
      quest::say("Joren was the boon companion to the King of Felwithe, a mighty paladin of great reknown, much loved by all the high elves. To slay him, certain. . .items. . .were crafted to make the job possible. With the death of the Teir'dal agent, and my theft of the [tools], the General was forced to abandon the plot");
    }
    elsif($text=~/general/i) {
      quest::say("The General? I know not his true name, only that he is ranked high among the dark elves. He kept his identity secret, and it was only upon the death of his agent that I even learned the smallest amount about him, that of his Generalship. Knowing who he is would aid me greatly.");
    }
    elsif($text=~/hanns/i) {
      quest::say("Hanns Krieghor was a talented young man, in many ways much more of a man than his father. After the death of [Johann], I raised Hanns as my own son, and grew to love him as such. A few years back, to take revenge upon me for his [father's murder], Hanns seized control of the Circle. At the same time, he sent four of his best killers to finish me. The killers failed, I still live. Hanns still leads the Circle in Qeynos, and still seeks [my head].");
    }
    elsif($text=~/father's murder/i) {
      quest::say("Well, it's no great secret now that I was responsible for the death of Johann Krieghor, Hanns Krieghor's father. Johann used to lead the Circle. Hanns was but a pup when his father died at my hand, and became as a son to me. Hanns did not discover that I was the one who killed his father until many years later. For that, he wants [my head].");
    }
    elsif($text=~/head/i) {
      quest::say("Aye, $name, Hanns has wanted me dead for years. He's tried many times, though not personally. He's smart, that one, for not facing me, but foolish for wasting so many good men for naught.");
    }
    elsif($text=~/tools/i) {
      quest::say("To allow the assassin to slay a prince, and fight his way back out, a fell blade was crafted. It was small enough to conceal under a garment and yet large enough to strike a mortal blow through armor. Aided by vile Teir'Dal enchantments, it is much more fearsome than it appears. I would gladly rid myself of it, but I fear I can not until I [clear my name] with Hanns.");
    }
    elsif($text=~/clear your name/i) {
      quest::say("I need proof that what I say about Johann is truth, so that Hanns may forgive me. YOU can gather that proof for me. First, travel to Kaladim and Neriak, and there, upon the persons of the rogue guildmasters, you should find that which I seek, two parts of a document I recovered from the dead agent. I entrusted one to Founy, but that trust is gone, and Founy would betray me to Hanns were I to attempt to reclaim it. Tani N'mar has the other, which he should not possess, and keeps it only to spite me, not knowing its real importance. Steal them both, and bring them back to me. And don't let anyone follow you! If I am not around, tell Anson you want to see me.");
      quest::doanim(64); # point
      quest::depop(5088); #depop Stanos Herkanor      
    }
  }
}  

sub EVENT_ITEM {
  if($ulevel >= 50) {
    # Stained Parchment Top ID:28010, Stained Parchemnt Bottom ID:28011
    if(plugin::check_handin(\%itemcount, 28010 => 1, 28011 => 1)) {
      quest::say("Excellent! With this document I can.. <He pauses for a moment>. Damnation! Curse my tired old mind, I forgot that I could not read the document. It is written in some obscure code or language. I can't decipher it, but I know someone who can. Seek out one called Eldreth, an Erudite who used to do work for me. I know not where he may be found these days, only that he will not be found in Erudin, as they want his head for some misdeed in the past. Give him the complete parchment, and tell him I sent you. He owes me.");
      # Stained Parchment ID:18759
      quest::summonitem(18759);
    }
    # Translated Parchement ID:18961
    elsif(plugin::check_handin(\%itemcount, 18961 => 1)) {
      quest::say("Let me see what you have here. Aha, so that's who.. yes, yes! There is one more thing I need you to do. This document tells me who the originator of the plot really was. His name is General V'ghera, which is interesting, as Anson's men have spotted him in Kithicor recently. He will not be easy to get to, but if you give this box to one of his many aides, the General will HAVE to come to investigate. You see, this box used to contain the tools crafted for the assassination. When he arrives, kill him! I need any documents you find on him - with luck it will be enough evidence to convince Hanns that what I say is true. Bring any documents or dispatch cases you find, along with those blades Vilnius made you work so hard for, and we will make a trade.");
      #Sealed Box ID:28057
      quest::summonitem(28057);
    }
    #General's Pouch ID:28013, Cazic Quill ID:7506, Jagged Diamond Dagger ID:7505
    elsif(plugin::check_handin(\%itemcount, 28013 => 1, 7506 => 1, 7505 => 1)) {
      quest::say("Very well done. I leave now to confront Hanns with this evidence. Even so, it will not be easy to regain his trust. That is why I need those daggers, in case all else fails. Bristlebane grant me luck - I can no longer live like a hunted dog. In any case, I am grateful for your aid. Take this wretched blade, I can bear it no longer. I must warn you, I feel it carries Innoruuk's curse; all who are near it learn the meaning of hate. Ironic, isn't it? You went to all that work to redeem yourself for a rapier, yet the true reward came when you redeemed another..Good luck, $name, for much as I, you will need it.");
      #Ragebringer ID:11057
      quest::summonitem(11057);
    }
    else {
    quest::emote("I have no need for this $name, you can have it back.");
    plugin::return_items(\%itemcount);
    }
    quest::faction(149,10); #Highpass Guards
    quest::faction(31,20);  #Carson McGabe
    quest::faction(214,10); #Merchants of Highpass
    quest::faction(53,10);  #Corrupt Qeynos Guards
    quest::faction(105,10); #The Freeport Militia
    quest::ding(); quest::exp(100000);
    quest::depop();
  }
  else {
    quest::emote("I have no need for this $name, you can have it back.");
    plugin::return_items(\%itemcount);
  }
}

sub EVENT_SIGNAL {
  # event_signal from Anson McBale to continue dialogue
  if ($signal == 1) {
    quest::say("I tend to agree Anson. We could make a [deal]. I have a blade I won't use anymore, and you have those fine looking daggers Vilnius gave you. Of course, you would have to do something for me first. Let me tell you my [story], then you decide.");
  }
}

sub EVENT_TIMER {
    if (($timer == 1) && ($combat_state == 0)) {
      quest::stoptimer(1);
      quest::depop();
    }
}
#END of FILE  Quest by: Solid11  Zone:highpass  ID:5088 -- Stanos_Herkanor

