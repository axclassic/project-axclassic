######################################
## NPC: Coriante_Verisue            ##
## Zone: Paineel                    ##
## Erudite Necro note turnin        ##
##    + mini quest                  ##
## Revised by caved for AX-CLASSIC  ##
## EQWorld Server                   ##
######################################
sub EVENT_SAY {
my $miragul = quest::saylink("miragul", 1);
if($text=~/Hail/i){
$client->Message(14,"Greetings, young one! There are many tasks to be performed aside from your studies to truly harness the powers passed down to us by our ancestor $miragul\. The most basic of these tasks is the gathering of bat wings and snake fangs from the yard outside our city. I will reward you for every two bat wings and two snake fangs you bring to me.");
}
if($text=~/miragul/i){
$client->Message(14,"You do not know of Miragul?!! You have more to learn of the heritage of the Dark Truth than at first I thought. Miragul was the first High Man to unlock the secrets of necromancy and is the founder of our city as well as the creator of the treacherous Hole.");
  }
}
sub EVENT_ITEM { 
    if (plugin::check_handin(\%itemcount, 18018=>1)) {
    $client->Message(14,"You are welcomed into the fold. Now go out, and prove yourself, young one. You have much to learn about the Dark Truth. Please visit Shwara Volerno, she will assist you in further training");
    quest::ding(); quest::exp("1000");
    quest::summonitem("13551");
    quest::faction("56","-150");        # Craftkeepers
    quest::faction("60","-150");        # Crimson Hands
    quest::faction("143","450");        # Heretics
    quest::faction("79","-150");        # Deepwater Knights
    quest::faction("112","-150");       # Gate Callers
    }
    
    elsif (plugin::check_handin(\%itemcount, 13068=>2, 13067=>2 )) {
    $client->Message(14,"Very good, young acolyte. Maintain your diligence in your duties and you will quickly learn the secrets of the Dark Truth.");
    quest::ding(); quest::exp("1000");
    quest::summonitem("15338");
    quest::faction("56","-5");        # Craftkeepers
    quest::faction("60","-5");        # Crimson Hands
    quest::faction("143","2");        # Heretics
    quest::faction("79","-5");        # Deepwater Knights
    quest::faction("112","-5");       # Gate Callers
    }
  
  else {
    $client->Message(14,"I have no need for this $name\. Take it back...");
    plugin::return_items(\%itemcount);
  }
}

