sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("What you want!!  You make fun of helm of Hukulk?!!  Me smash you!!");
    }
}

sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 18792 => 1)){
    quest::say("Haaah!! Why you here $name? GO HOME!");
    quest::summonitem(18792);
    quest::movepc(52,-954.5,503.6,12.2);
    }
else {
    plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
    quest:say("Me can not eat this... Take back!");
    plugin::return_items(\%itemcount);
   }
}

    #END of FILE Zone:grobb  ID:40023 -- Hukulk