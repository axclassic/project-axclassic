## A_Voice 317127##

sub EVENT_SIGNAL {
   if($signal == 900) {
   quest::emote(' echoes from behind the shield');
   quest::ze(14,"Vangl, you are my mightiest guardian, yet you allow these insects to remain in my presence? Destroy them now or I will rend the flesh from your worthless frame!");
   }
   elsif($signal == 901) {
   quest::emote(' echoes from behind the shield');
   quest::ze(14,"You expect to defeat me? I have lived longer than you can begin to comprehend. I walked the realms before your pitiful gods were spawned. I flew the skies in a time before your world's creation and I shall enslave new worlds long after you and your gods are forgotten. You fight only to die. I. . . AM. . . ETERNAL!");
   }
   elsif($signal == 903) {
   quest::emote(' echoes from behind the shield');
   quest::ze(14,"Vangl, do not think that you can escape me in death. After I destroy the infiltrators I will find where you are to spend eternity. Death does not end your obligation to me, wretched thrall!");
   quest::depop(317000);
   quest::spawn2(317109,0,0,507,4969,294.3,128.4);
   quest::signalwith(317109,968,10000);
   }
   else {
   #quest::shout(do nothing);
   }
  }  