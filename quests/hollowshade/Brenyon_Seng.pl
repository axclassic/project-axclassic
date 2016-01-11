sub EVENT_SAY {
    if($text=~/hail/i){
     quest::say("Greetings. $name, I am Brenyon Seng. I was sent here to help young recruits in locating sonic wolves for Pashir.");
     quest::say("Are you looking for $young sonic wolves?");
     }
     if($text=~/young/i){
     quest::say("The young wolves tend to stay in the north eastern part of the Moor near grimling forest. For the most part they do not hunt in packs as they have not learned the way of the pack as of yet.");

 }
}

