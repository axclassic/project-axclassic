sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("I'm not in any mood for conversation. My favorite [hat] was torn right from my head by a gigantic bat the other night and I am quite upset.");
}
elsif($text=~/other tasks/i){
quest::say("I will sew you your own personal dreadful cap if you bring me the necessary components. I will need the pelt of a feared beast. some gold thread. and an imbued amber.");
}
elsif($text=~/hat/i){
quest::say("It is a marvelous cap sewn from the finest textiles and imbued with the divine power of our lord of fear, Cazic-Thule!");
 }
}

sub EVENT_ITEM { 
   if (plugin::check_handin(\%itemcount, 1528=>1)) {
    quest::say("Well done, $name. I suppose, if you felt you were up to it, I could reward you for some [other tasks]...");
                          # Fanfare
    quest::ding(); quest::exp("51350");                 # 1/20 of level 19
    quest::summonitem("1530");          # Black Lace Sash
    quest::faction("56","-24");         # Craftkeepers
    quest::faction("60","-24");         # Crimson Hands
    quest::faction("143","8");          # Heretics
    quest::faction("79","-24");         # Deepwater Knights
    quest::faction("112","-24");        # Gate Callers
 }
   elsif (plugin::check_handin(\%itemcount, 19076=>1, 12096 =>1, 22502 =>1)) {
    quest::emote("sews the Mighty Bear Paw's pelt with the gold thread and adorns it with the imbued amber of Cazic-Thule!");
    quest::say("There you go, $name. Now wear this Dreadful Hat and inspire fear wherever you go!");
                          # Fanfare
    quest::ding(); quest::exp("51350");                 # 1/20 of level 19
    quest::summonitem("1529");          # Dreadful Cap
    quest::faction("56","-24");         # Craftkeepers
    quest::faction("60","-24");         # Crimson Hands
    quest::faction("143","8");          # Heretics
    quest::faction("79","-24");         # Deepwater Knights
    quest::faction("112","-24");        # Gate Callers
  }
 }
#END of FILE Zone:paineel  ID:75009 -- Azzar_Habbib 

