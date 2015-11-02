sub EVENT_SAY {
my $young = quest::saylink("young", 1);
    if($text=~/hail/i){
     quest::say("Greetings. $name, I am Brenyon Seng. I was sent here to help young recruits in locating sonic wolves for Pashir.");
     quest::say("Are you looking for $young sonic wolves?");
     }
     if($text=~/young/i){
     quest::say("The young wolves tend to stay in the northern part of the Moor. For the most part they do not hunt in packs as they have not learned the way of the pack as of yet.");
     quest::say("Good luck to you and good hunting.");
     quest::spawn2(166296,0,0,2913.8,-1820.5,-123.3,190.1);
     quest::signalwith(166296,101,0);
     quest::spawn2(166302,0,0,2856,-1781.7,-129.5,204.5);
     quest::spawn2(166297,0,0,705,970.4,17.4,118);
     quest::spawn2(166298,0,0,516,1019,33.4,241.5);
     quest::spawn2(166299,0,0,931.6,1384.9,81.9,209.5);
     quest::spawn2(166300,0,0,271.8,2078.3,118.7,154.6);
     quest::depop();
 }
}
