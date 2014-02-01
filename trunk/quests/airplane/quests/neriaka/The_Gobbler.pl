#########################################
#Quest Name: Preserved Meat Delivery    #
#Author: Asram                          #
#Creation Date: 8/13/2009               #
#########################################
sub EVENT_SAY { 

if($text=~/Hail/i){
  quest::say("Hiya, $name.  Everyone's always after my [recipes].  YOU better not be one of them everyone.");
  }
if($text=~/recipes/i){
  quest::say("Yup. I'm told I'm a great chef like Dooga in my hometown. In fact, she gave me a very special recipe. I lent it to someone and he didn't give it back. Would you go get it? I'm sure I could make you some HEHE meat if you did.  I bet you'd like it, $name.");
  }
if(($text=~/yes/i) && ($faction <5)){
  quest::say("Great. Then all you need to do is deliver this grub locker of dwarf pickles to the guy who has my recipe.");
  quest::summonitem(12203);
 }
}

sub EVENT_ITEM {
 
   if(plugin::check_handin(\%itemcount, 13384 => 1)){
   quest::say("Hmm, now me decide. Do I eat it or sell it? Thanks anyway. Here you go.");
   my $random_result = int(rand(10));
    if($random_result==1) {
      quest::summonitem(13386);
      }
    elsif($random_result==2) {
      quest::summonitem(13385);
      }
    else {
      quest::summonitem(10021);
      }
    
   quest::givecash(0,3,3,0);
   quest::faction(378,10); # Neriak Ogres
    quest::ding();
    quest::exp(875);

 }

 else{
  #do all other handins first with plugin
  plugin::return_items(\%itemcount);
  quest::say("Thanks, but I do not need this...");
  }

}

#END of FILE Zone:neriaka -- The_Gobbler.pl
