sub EVENT_SAY {
  if($text =~ /Hail/i) {
    quest::say("Hello there, $name. Pleasure to meet you, I am Governor Tilbok Furrunner. I am tasked with the gathering and security of information for the Concilium Universus, the ruling council of our fine city.");
  }
  if ($text=~/purpose/i) {
    quest::say("The teaching in the city is that Katta feigned his death to blame it on Seru. When in fact Seru actually poisoned Katta. The crusade that Seru leads is false and must be stopped. We must gain access to Seru's [chambers] and destroy him and show the city the truth.");
  }
  if ($text=~/chambers/i) {
    if ($EarringVeracity3 eq "1") {
      quest::say("According to these reports Seru resides in a building called the Arx Seru. It is the large complex in the center of the four Praesertum Consillium. We must take [action] now. Do not underestimate the power of Sanctus Seru for what they do they feel is right.");
    } 
    else {
      quest::say("We do not know much about Seru's Chamber, that is what we need you to find out. This will require great effort on your part. We need you to infiltrate Sanctus Seru and bring back reports from each Consillium. I do not know who will have these reports, and I have only heard rumor that they exist. Return to me with the Satchel full, and your Etched Earring.");
    }
  }

  if (($text=~/action/i) && ($EarringVeracity3 eq "1")) {
    quest::say("You must go see Lcea. She was Tsaph Katta's closest advisor. This matter has escalated greatly and must be placed in her hands. Ask her about the [Arx Key] she will no doubt ask in your service retrieving it. I salute your service to the city and wish you well.");
  }
  if ($text=~/Praesertum/i) {
    quest::say("The four Praesertum can be found in the center of the city. Each has their own building, easily identified by the symbol above the main entrance. Stay clear of the Arx Seru, the central building. This is the resting place of Seru, who does not allow anyone but the Praesertum to disturb him. To venture inside is death for all that are not invited.");
  }
  if ($text=~/Who is Seru/i) {
    quest::say("Seru is the genius behind the Combine Empire. A man of unfailing honor and honesty, he devised the Inquisition, to root out unclean elements in the Empire. His saddest day was when he discovered that Katta himself was a traitor. When confronted with proof of his treachery, Katta feigned his own murder, and fled to Luclin. Seru had no choice but to amass an expedition and follow after him.");
  }
}

sub EVENT_ITEM {

  # 29891 :  Report to Tilbok
  if (plugin::check_handin(\%itemcount,29891=>1)) {
    quest::emote("reads through the report, hands you a small satchel then starts to explain. 'Finally, news from Euzan. I knew that it would take a long time to get planted within Seru, but I still worried about their mission constantly. This report shows that you have earned trust from Euzan, so I in turn will show the same trust. Euzan and Torsten were placed in the city for information. They are deep undercover and risk their life everyday. Every person in that city is ingrained with the [purpose] of either destroying Katta or converting his people.'");
    quest::summonitem(17121); # 17121  Report Satchel
    quest::faction(350,20); # Validus Custodus
    quest::faction(168,20); # Katta Castellum Citizens
    quest::faction(206,20); # Magus Conlegium
    quest::faction(228,20); # Nathyn Illuminious
    quest::faction(55,-50); # Coterie of the Eternal Night
    quest::faction(284,-50); # Seru
    quest::faction(139,-50); # Hand of Seru
    quest::faction(96,-50); # Eye of Seru
    quest::faction(138,-50); # Hand Legionnaries
     quest::ding(); quest::exp(100000);
  }

  # 29858 :  Etched Earring of Veracity
  # 29889 :  Full Satchel
  if (plugin::check_handin(\%itemcount,29858=>1,29889=>1)) {
    quest::summonitem(29859); # 29859  Runed Earring of Veracity
    quest::faction(350,20); # Validus Custodus
    quest::faction(168,20); # Katta Castellum Citizens
    quest::faction(206,20); # Magus Conlegium
    quest::faction(228,20); # Nathyn Illuminious
    quest::faction(55,-50); # Coterie of the Eternal Night
    quest::faction(284,-50); # Seru
    quest::faction(139,-50); # Hand of Seru
    quest::faction(96,-50); # Eye of Seru
    quest::faction(138,-50); # Hand Legionnaries
     quest::ding(); quest::exp(1000000);
    quest::setglobal("EarringVeracity3","1",1,"Y1");
    quest::say("According to these reports Seru resides in a building called the Arx Seru. It is the large complex in the center of the four Praesertum Consillium. We must take [action] now. Do not underestimate the power of Sanctus Seru for what they do they feel is right.");
  }


  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Rogue');

  plugin::return_items(\%itemcount);
}

