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

    if($firstword=~/erud/i){
      quest::setglobal("erudboat",100,7,"F");
      quest::movepc(98,3884.3,1097,60);
    }

    if($firstword=~/command/i){
      quest::say("I follow these commands:  [follow],[depop],[getcondition],[setcondition],[open],[close],[setglobal],[getglobal],[delglobal]");
    }

    if($firstword=~/follow/i){
      if(($count==3) && ($secondword=~/on/i)){
        quest::say("I will follow $name");
        quest::follow($userid);
      }elsif(($count==3) && ($secondword=~/off/i)){
        quest::say("I will stop following you.");
        quest::sfollow();
      }else{
        quest::say("Usage:  Follow <on|off>");
        quest::say("This command turns my follow mode on or off.");
      }
    }
    
    if($firstword=~/depop/i){
      quest::say("I will depop.");
      quest::depop();
    }


    if($firstword=~/getcondition/i){
      if($count==4){
        quest::say("You have requested I set get spawn condition $thirdword for zone $secondword.  I will do that now.");
        my $spawnvalue = quest::get_spawn_condition("$secondword",$thirdword+=0);
        quest::say("It is currently set at $spawnvalue");
      }else{
        quest::say("Usage: getcondition <zonename> <id>");
        quest::say("This command tells you the value for the spawn condition <id> for the specified <zonename>.");
      }
    }

    if($firstword=~/setcondition/i){
      if($count==5){
        quest::say("You have requested I set spawn condition $thirdword to $fourthword in zone $secondword.  I will do that now.");
        quest::spawn_condition("$secondword",$thirdword+=0,$fourthword+=0);
      }else{
        quest::say("Usage: setcondition <zonename> <id> <value>");
        quest::say("This command sets the spawn condition for <id> to <value> in the <zonename> you specify.");
      }
      quest::say("Please note:  The target zone MUST be reloaded before the spawn condition change will be recognized, UNLESS the condition you change is for the zone you are currently in.");
    }

    if($firstword=~/open/i){
      if($count==3){
        quest::say("You have requested that I open door $secondword.  I will do so now.");
        quest::forcedooropen($secondword+=0);
      }else{
        quest::say("Usage: Open <doorid>");
        quest::say("This command opens the door specified by <doorid>.  This only works with doors in the current zone.");
      }
    }
    
    if($firstword=~/close/i){
      if($count==3){
        quest::say("You have requested that I close door $secondword.  I will do so now.");
        quest::forcedoorclose($secondword+=0);
      }else{
        quest::say("Usage: Close <doorid>");
        quest::say("This command closes the door specified by <doorid>.  This only works with doors in the current zone.");
      }
    }
    
    if($firstword=~/faction/i){
      if($count==4){
        quest::say("You have requested I change your faction number $secondword by $thirdword.  I will do that now.");
        quest::faction($secondword+=0,$thirdword+=0);
      }else{
        quest::say("Usage: Faction <factionid> <value>");
        quest::say("This command changes your faction with <factionid> by the number of points specified in <value>.  Negative values will reduce faction");
      }
    }
    
    if($firstword=~/setglobal/i){
      if($count==6){
        quest::say("You want me to set qglobal \$$secondword to value $thirdword, with the parameters $fourthword, $fifthword.  I will do that now.");
        quest::setglobal("$secondword",$thirdword,"$fourthword","$fifthword");
      }else{
        quest::say("Usage: setglobal <globalname> <value> <options> <duration>");
        quest::say("I will set global <globalname> to <value> with the specified <options> and <duration>.");
        quest::say("Please Note: Using incorrect <options> may result in changing the wrong global, or creating one no other npcs or zones may see.  Except under certain condiions, it is impractical to use this for options other than 3 or 7.");
      }
    }
    
    if($firstword=~/getglobal/i){
      if($count==3){
        quest::say("Your qgolbal variable \$$secondword is currently set to $qglobals{$secondword}.");
      }else{
        quest::say("Usage: getglobal <globalname>.");
        quest::say("This command tells you the value of <globalname>.");
        quest::say("Please Note:  The global's options must have been set correctly for this to work.  I cannot tell you the value of a global that I do not have access to.");
      }
    }
    
    if($firstword=~/delglobal/i){
      if($count==3){
        quest::say("Your qgolbal variable \$$secondword will be deleted.");
        quest::delglobal("$secondword");
        $qglobals{$secondword} = $undef;
      }else{
        quest::say("Usage:  delglobal <globalname>");
        quest::say("This command deletes the global <globalname>.");
        quest::say("Please Note:  I cannot delete globals that don't belong to me.");
      }
    }
    
  }else{
  }
}

sub EVENT_ITEM{
  plugin::return_items(\%itemcount);
}
