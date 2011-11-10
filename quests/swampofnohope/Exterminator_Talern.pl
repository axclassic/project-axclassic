#Kill the bugs! 
#froglok town in swampofnohope
#Angelox

sub EVENT_SAY {
  if($text=~/Hail/i){ 
    quest::say("Hail, $name! I'm trying to keep the mosquito population down, but I sure could use some help as there are very many of them. If you [help] me, I will reward you for your efforts"); 
    quest::say("If you are looking for [bat wings] or [spider legs], I can also help you with that.");
  }
elsif ($text=~/help/i){
    quest::say("Bring back four mosquito wings as proof of your work and I shall reward you.");
  }
elsif ($text=~/bat wings/i){
    quest::say("I have many bat wings collected on my trips around Norrath, bring me one small mosquito wing, and I will give you a bat wing in return .");
  }
elsif ($text=~/spider legs/i){
    quest::say("Spider legs were much harder to find, bring me one fine mosquito wing, and I will give you a spider legs in return .");
  }
elsif ($text=~/rare/i){
    quest::say("I'm looking for Fine and Giant mosquito wings, but I need them in pairs.");
  }
}

  #Hand- in: 4 small mosquito wings or 1 small mosquito wing (for batwing quest).
sub EVENT_ITEM{
   my $random_result = int(rand(96));
   if($itemcount{12405} == 1){
    quest::say("Thank you and here is your batwing.");
    quest::say("We still have much work to do!");
    quest::summonitem(13068);  #Batwing
    }
   if($itemcount{97171} == 1){
    quest::say("Thank you and here is your spider legs.");
    quest::say("We still have much work to do!");
    quest::summonitem(13417);  #Spider Legs
    }
   if(plugin::check_handin(\%itemcount, 12405 => 4)){ 
    quest::say("Thank you and here is your reward.");
    quest::say("We still have much work to do!");
    quest::faction(95,15); # +Exiled Frogloks
    quest::faction(106,15); # +Frogloks of Guk
    quest::faction(107,15); # +Frogloks of Krup
    quest::faction(108,15); # +Frogloks of Kunark
    quest::faction(109,15); # +Frogloks of Sebilis
    quest::ding(); quest::exp(5);
    quest::givecash(1,3,1,0);
    quest::say("I also collect [rare] mosquito wings, if you happen to run into any ..."); #Frogloksilk
     if($random_result<12){
       quest::summonitem(573); #wrist
     }elsif($random_result<24){
       quest::summonitem(574); #gloves
     }elsif($random_result<36){ 
       quest::summonitem(575); #slippers
     }elsif($random_result<48){
       quest::summonitem(576); #head
     }elsif($random_result<60){
       quest::summonitem(577); #sleeves
     }elsif($random_result<72){
       quest::summonitem(578); #pants
     }elsif($random_result<84){
       quest::summonitem(579);  #robe
     }else{
       quest::summonitem(573); #wrist
 }
}
  #Hand- in: 2 fine mosquito Wings
  if(plugin::check_handin(\%itemcount, 97171 => 2)){ 
    quest::say("Very nice!");
    quest::say("I can't get enough of these..."); #Froglok Leather
    quest::faction(95,15); # +Exiled Frogloks
    quest::faction(106,15); # +Frogloks of Guk
    quest::faction(107,15); # +Frogloks of Krup
    quest::faction(108,15); # +Frogloks of Kunark
    quest::faction(109,15); # +Frogloks of Sebilis
     quest::ding(); quest::exp(5);
    quest::givecash(3,6,2,0);
    if($random_result<12){
       quest::summonitem(566);
     }elsif($random_result<24){
       quest::summonitem(567);
     }elsif($random_result<36){
       quest::summonitem(568);
     }elsif($random_result<48){
       quest::summonitem(569);
     }elsif($random_result<60){
       quest::summonitem(570);
     }elsif($random_result<72){
       quest::summonitem(571);
     }elsif($random_result<84){
       quest::summonitem(572);
      }else{
       quest::summonitem(566);
 }
}
  #Hand- in: 2 giant mosquito Wings
  if(plugin::check_handin(\%itemcount, 11951 => 2)){ 
    quest::say("Very rare!");
    quest::say("I can take all you can get ...");
    quest::faction(95,15); # +Exiled Frogloks
    quest::faction(106,15); # +Frogloks of Guk
    quest::faction(107,15); # +Frogloks of Krup
    quest::faction(108,15); # +Frogloks of Kunark
    quest::faction(109,15); # +Frogloks of Sebilis
     quest::ding(); quest::exp(5);
    quest::givecash(8,8,3,0); #FrogChain
    if($random_result<12){
       quest::summonitem(559);
     }elsif($random_result<24){
       quest::summonitem(560);
     }elsif($random_result<36){
       quest::summonitem(561);
     }elsif($random_result<48){
       quest::summonitem(562);
     }elsif($random_result<60){
       quest::summonitem(563);
     }elsif($random_result<72){
       quest::summonitem(564);
     }elsif($random_result<84){
       quest::summonitem(565);
     }else{
       quest::summonitem(559);
  }
 }
}
