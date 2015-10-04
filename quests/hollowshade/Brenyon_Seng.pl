sub EVENT_SAY {
my $young = quest::saylink("young", 1);
    if($text=~/hail/i){
     quest::say("Greetings. $name, I am Brenyon Seng. I was sent here to help young recruits in locating sonic wolves for Pashir.");
     quest::say("Are you looking for $young sonic wolves?");
     }if($text=~/young/i){
     quest::say("The young wolves tend to stay in the northern part of the Moor. For the most part they do not hunt in packs as they have not learned the way of the pack as of yet.");
     quest sayy("Good luck to you and good hunting.");
     quest::spawn2(166296,0,0,2913.8,-1820.5,-123.3,190.1);
     quest::depop();
 }
}