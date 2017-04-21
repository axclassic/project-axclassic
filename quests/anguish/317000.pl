sub EVENT_SIGNAL {
   if($signal == 904) {
   quest::shout("Vangl, you are my mightiest guardian, yet you allow these insects to remain in my presence? Destroy them now or I will rend the flesh from your worthless frame!");   
   }
   elsif($signal == 905) {
   quest::shout("You expect to defeat me? I have lived longer than you can begin to comprehend. I walked the realms before your pitiful gods were spawned. I flew the skies in a time before your world's creation and I shall enslave new worlds long after you and your gods are forgotten. You fight only to die. I. . . AM. . . ETERNAL!");
   }
   elsif($signal == 906) {
   quest::shout("Vangl, do not think that you can escape me in death. After I destroy the infiltrators I will find where you are to spend eternity. Death does not end your obligation to me, wretched thrall!");
   quest::signalwith(317127,904,50);
   }
    else {
   #quest::shout(Do Nothing);
   }
  }  