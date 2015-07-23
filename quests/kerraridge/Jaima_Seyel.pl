sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello Citizen. I am in need of an apprentice.  If you feel that you are capable of assisting me. please show me your Dar Khura Apprentice Cloak and I'll explain the task to you.");
}
if($text=~/challenge/i){
quest::say("You will need to walk into the darkness of the Hollowshade Moor to face this enemy. Unlike the wolves that we have always been able to commune with, the wolves of the moor are oblivious to our attempts at communication.");
quest::say("We have studied them for some time and our determination is that they are too corrupt for us to deal with. Their aggressive behavior and sheer numbers have forced us to research ways to kill them as quickly as possible.");
quest::say("Fill that bag with the paws from one of those wolves. Once that task is complete, please return to me with the evidence of your encounter.");
}
sub EVENT_ITEM {
my $challenge = quest::saylink("challenge", 1);
if(plugin::check_handin(\%itemcount, 5544 => 1)){
quest::emote(' smiles');
quest::say("Very good. I am glad to have you here. I hope your studies have proven to be worthwhile thus far. Our sect is challenging, but we are vital to the survival of our people. Our research and ability to commune with the spirit world has allowed our people to overcome the challenges of the wilderness here.");
quest::say("Here, take this bag. It is time for you to face your first real $challenge.");
quest::summonitem(17116);
}
elsif(plugin::check_handin(\%itemcount, 6264 => 1)){
quest::say("Nicely done $name! It is time for you to increase your brewing skill. Take this strainer it will help you make better potions as you go. Also take this note to Amat Luziq, don't ask questions just do as you are ordered."); 
quest::summonitem(6265);
quest::summonitem(6140);
}
}
#END of FILE Zone:sharvahl  ID:155270 -- Jaima_Seyel 

