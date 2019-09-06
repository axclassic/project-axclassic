## Bittles_the_Lost ##
sub EVENT_SAY {
    my $disturbed = quest::saylink("disturbed", 1);
	my $shiny = quest::saylink("shiny", 1);
	my $golems = quest::saylink("golems", 1);
	my $reassembled = quest::saylink("reassembled", 1);
	my $replaced = quest::saylink("replaced", 1);
	   if($text=~/hail/i && !defined $qglobals{"Sleeperawake"}){
        quest::say("Eh, hrm? Who're you? Found yer way in here, 'ave ya? Not the brightest idea in the world, ya know. I hope you weren't planning on going any further, because there are tings here that should not be $disturbed.");
        } 
       elsif($text=~/hail/i && defined $qglobals{"Sleeperawake"} == 1){
        quest::say("So $name, ye did not head my warnings and awakened the $shiny beast!");
        }		
	   elsif($text=~/disturbed/i && !defined $qglobals{"Sleeperawake"}){
        quest::say("Ya know that story about how those two dragons got together and made that premzatica dragon?");
        quest::signalwith(128037,110,300);
		}	
	   elsif($text=~/crazy/i && !defined $qglobals{"Sleeperawake"}){
        quest::say("Them thar four warders. They were the most powerful elemental dragons of their time, and kept that sleeping fella asleep for quite some long time. Names of Nanzata, Tukaarak, Hraashna, and Ventani, if'n my mind serves me correct-like. When they started here, they had some other big-time dragon create the big ice creatures all over the place -- the $golems, don't ya know? "); 	
		}
		elsif($text=~/golems/i && !defined $qglobals{"Sleeperawake"}){
		quest::say("Have ye gone daft man? Once ye open them doors ye shall see that nothing but death awaits ye here.");
		}
		elsif($text=~/shiny/i && defined $qglobals{"Sleeperawake"} == 1){
		quest::say("Them thar four warders. They were the most powerful elemental dragons of their time, and kept that sleeping fella asleep for quite some long time. When they started here, they had some other big-time dragon create the big ice creatures all over the place -- the golems, don't ya know? In any case, they upped and got kilt by some folks like you a while back, causing all kinds of panic and havoc. The ice guys were dismantled by the new guardians of this here lair and $reassembled to serve them. Not that it really matters to me, I got lost here anyway and look what happened ta me!");
        }
		elsif($text=~/reassembled/i && defined $qglobals{"Sleeperawake"} == 1){
        quest::say("Well, that don't matter no more. Since you did not heed my warning and killed them all and set Kerafyrm loose, no place is safe anymore."); 
        quest::say("now the warders have been $replaced... Good luck to ye if'n you wish to tempt faith any farthert.");		
		}
		elsif($text=~/replaced/i && defined $qglobals{"Sleeperawake"} == 1){
          quest::say("Why the ancients of course! They just kinda cropped up when that big shiny fella was awakened by you! Some thought that those four warders were trouble, but believe me, they're like drakelings in comparison. Kal or Jobana over here might know more about them than I do, I'm just a lost little gnome with no where to go.");
        }
		 else{
		 #Do Nothing;
		}
	}
	  sub EVENT_SIGNAL {
my $crazy = quest::saylink("crazy", 1);
       if($signal == 111) {
	    quest::say("Yar, whatever. Anyway, that bugger got made and he went wild all over Velious, making demands and acting all proud and powerful and things like that. Well, he decided he wanted ta have a nice big home in the middle of the mountain. And you know what? That's what he did! Yer standing in the middle of his lair. Well after he went $crazy, some of those other dragon folk decided it would be good ta put him in here and put him ta sleep for all eternity. Four of them kept him sleeping and made sure that no one, such as yerself, could get in here ta wake him up.");
	    }
	}