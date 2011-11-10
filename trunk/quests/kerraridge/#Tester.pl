sub EVENT_SAY {

  #initialize variables

  my ($firstword,$secondword,$thirdword,$fourthword) = "";
  my $count = 0;
  
  #adding junk word " done." at the end of the text helps the parser deal with junk whitespaces after in each word.
  
  my $str = $text . " done.";
  my $count = $str =~ s/((^|\s)\S)/$1/g;     #count the number of words used

  if ($status >= 200){                       #must be gm status 200 or higher
    if($str=~/Hail/i){
      quest::say("Hello $name.  You are of GM status, level $status.  I will follow your [commands].");
    }
    if($count==6){
      ($firstword, $secondword,$thirdword,$fourthword,$fifthword,$sixthword) = $str =~ m/(.*\ )(.*\ )(.*\ )(.*\ )(.*\ )(.*)$/;
    }elsif($count==5){
      ($firstword, $secondword,$thirdword,$fourthword,$fifthword) = $str =~ m/(.*\ )(.*\ )(.*\ )(.*\ )(.*)$/;
    }elsif($count==4){
      ($firstword, $secondword,$thirdword,$fourthword) = $str =~ m/(.*\ )(.*\ )(.*\ )(.*)$/;
#      quest::say("First Word = $firstword and Second Word = $secondword and Third Word = $thirdword and Fourth Word = $fourthword");
    }elsif($count==3){
      ($firstword, $secondword,$thirdword) = $str =~ m/(.*\ )(.*\ )(.*)$/;
#      quest::say("First Word = $firstword and Second Word = $secondword and Third Word = $thirdword");
    }elsif ($count==2){
      ($firstword, $secondword) = $str =~ m/(.*\ )(.*)$/;
#      quest::say("First Word = $firstword and Second Word = $secondword");
    }elsif($count==1){
      $firstword = $str;
#      quest::say("You only said $firstword");
    }else{
      quest::say("Too many words");
    }

my $chr = chop($secondword);
my $chr = chop($thirdword);
my $chr = chop($fourthword);
my $chr = chop($fifthword);
my $chr = chop($sixthword);



# command list:  open, close, faction, setglobal, getglobal, delglobal, follow, stop, depop...
# Note: $count will always be one word higher than what was typed due to junk word added

    if($firstword=~/command/i){
      quest::say("I follow these commands:  [follow],[stop],[depop],[getcondition],[setcondition],[open],[close],[setglobal],[getglobal],[delglobal]");
    }

    if($firstword=~/follow/i){
      quest::say("I will follow $userid");
      quest::follow($userid);
    }

    if($firstword=~/stop/i){
      quest::say("I will stop following you.");
      quest::sfollow();
    }
    
    if($firstword=~/depop/i){
      quest::say("I will depop.");
      quest::depop();
    }


    if (($firstword=~/getcondition/i) && ($count==4)){
      quest::say("You have requested I set get spawn condition $thirdword for zone $secondword.  I will do that now.");
      my $spawnvalue = quest::get_spawn_condition("$secondword",$thirdword+=0);
      quest::say("It is currently set at $spawnvalue");
    }

    if (($firstword=~/setcondition/i) && ($count==5)){
      quest::say("You have requested I set spawn condition $thirdword to $fourthword in zone $secondword.  I will do that now.");
      quest::spawn_condition("$secondword",$thirdword+=0,$fourthword+=0);
    }

    if(($firstword=~/open/i) && ($count==3)){
      quest::say("You have requested that I open door $secondword.  I will do so now.");
      quest::forcedooropen($secondword+=0);
    }
    
    if(($firstword=~/close/i) && ($count==3)){
      quest::say("You have requested that I close door $secondword.  I will do so now.");
      quest::forcedoorclose($secondword+=0);
    }
    
    if(($firstword=~/faction/i) && ($count==4)){
      quest::say("You have requested I change your faction number $secondword by $thirdword.  I will do that now.");
      quest::faction($secondword+=0,$thirdword+=0);
    }
    
    if(($firstword=~/setglobal/i) && ($count==6)){
      quest::say("You want me to set qglobal \$$secondword to value $thirdword, with the parameters $fourthword, $fifthword.  I will do that now.");
      quest::setglobal("$secondword",$thirdword,"$fourthword","$fifthword");
    }
    
    if(($firstword=~/getglobal/i) && ($count==3)){
      quest::say("Your qgolbal variable \$$secondword is currently set to $qglobals{$secondword}.");
    }
    
    if($firstword=~/delglobal/i){
      if($count==3){
        quest::say("Your qgolbal variable \$$secondword will be deleted.");
        quest::delglobal("$secondword");
        $qglobals{$secondword} = $undef;
      }else{
        quest::say("Usage:  delglobal <globalname>");
      }
    }
    
  }else{
  }
}

sub EVENT_ITEM{
  plugin::return_items(\%itemcount);
}
