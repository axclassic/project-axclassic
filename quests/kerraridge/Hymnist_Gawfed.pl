sub EVENT_ITEM { 
if($itemcount{3659} == 1){
quest::say("Very well met. young friend.  I assume that Gherik has sent you to me for the purpose of training you.  Unforunately. I will not be doing any formal training for the several days.  I'm taking a bit of a holiday to celebrate my wife's birthday.  If you could take this receipt to the merchant for me before my wife gets home. I'd appreciate it.  I'll place you at the top of my training list as well.");
quest::summonitem("5954");
}
if($itemcount{5957} == 1){
quest::summonitem("17611");
 quest::faction(175,1);
    quest::faction(2806,1); 
     quest::faction(175,1);
    quest::faction(2806,1); 
    }
}
#END of FILE Zone:sharvahl  ID:155060 -- Hymnist_Gawfed 

