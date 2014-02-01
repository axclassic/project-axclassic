#############
#Quest Name: A job for Nanrum
#Author: BWStripes
#NPC's Involved: 1
#Items involved: 3
#############
###NPC 1
#Name: Basher Nanrum
#Race 92 (Troll), Texture of 0, Size 0, gender of 0
#Location: -67.0,-7.0,3.1 in Grobb
#Level: 45
#Type: Quest NPC
#Reward:  Random between: -
# 10351:Brass Earring
# 10026:Cat's Eye Agate
# 10060:Chunk of metal ore
# 10018:Hematite
# 10006:Silver Earring
# 10017:Turquoise
#############
###Item 1,qty3
#Name: Fire beetle eye
#ID: 10307
###

#Description: The point of this quest is to hand out random stuff to new trolls. The desired reward was the brass earring - an AC2 ear was good back then.
#The fire beetle eyes are available locally from Sro and the Ferrott - you just needed some wanderlust!

sub EVENT_AGGRO {
  quest::say("I shall pluck you limb from limb!!");
}

#Quest for Basher Nanrum in Grobb
sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Peh! What am you wanted?! I am Basher Nanrum. You? $name? Heh, you look for works? Hmm, me tinks you too weakling for [job] me need done. Hmm.. You might do, mebbe.");
  }
  if($text=~/job/i){
    quest::say("Me in charge of making torches for basher patrols. But Nanrum is much too mighty for such stupid job and Nanrum get idea. Dem fire bugses in da desert - dem eyes glowed. And dem don't burneded like torches. If $name getted Nanrum three fire beetle eyes me would giveded $name a shiny thingie dat you wanteded. Go ahed, $name , an' get me da eyes.");
  }
}

sub EVENT_ITEM {
if(plugin::check_handin(\%itemcount, 10307 => 1)) { #Fire Beetle Eye from all sorts of beetles
  quest::say("Well dat be some of da eyeballses I askeded for. But you needs ta give me three for da shiny.");
  plugin::return_items(\%itemcount); #function from file plugins/check_handin.pl
  }
if(plugin::check_handin(\%itemcount, 10307 => 3)) { #Fire Beetle Eye from all sorts of beetles
  quest::say("Heh heh. All da eyeballses! I didn't think ya could do it but ya did. Here is da shiny. If you gets more, I always have more shinies.");
  quest::summonitem(quest::ChooseRandom(10351,10026,10060,10018,10006,10017));
  quest::faction(66,10); #Da Bashers
  quest::faction(22,-30); #Broken Skull Clan
  quest::exp("100");
  }
}

sub EVENT_SLAY {
  quest::say("Those who play with da Basher always gets bashed good!!");
}