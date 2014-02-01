sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome to my shop. sss.  Only the finessst I have.  I make for you jussst as I make for the emperor's harem.  Many [bristle silk] garmentsss do they need.  Ssss..  Lucky man. the emperor isss.");
}
if($text=~/bristle silk/i){
quest::say("What is bristle silk?!!  Huh?  Where have you been living?  Under the rocksss..  Nahh.  I sssee.  You are a broodling from the common ssstock.  You could never afford bristle silk nor the affectionss of those who drape themselves with it.  Still. commons have much ssservice to offer.  Maybe you would like to earn some [curscale armor].  Hmm?");
}
if($text=~/curscale armor/i){
quest::say("Curscale armor?  I make thisss crude armor from the broodlings of the scaled wolves.  I use the ssskins of the pupsss and cubs.  Those ssskins are ssstill young and thin and are bessst for the young adventurers.  I sssupply them to the Legion of Cabilisss. but for a [small service] I shall make them available to you.");
}
if($text=~/perform a small service/i){
quest::say("Good.  You take thisss pack and fill it all with scaled curskins.  Only the pupsss and cubs of the scaled wolves shall do.  They are not much for one sssuch as you.  Combine all those ssskins and return the full curskin pack and I shall reward you with any available piece of curskin armor and a sssmall amount of coin.  Mossst important is that you shall be proving your allegiance to all of Cabilisss."); 
}
if($text=~/small service/i){
quest::say("I am in need of pup and cub scaled wolf skins to create more [curscale armor].  Many Legionnaires have died in battle.  The Baron demands more sssuits.  I mussst have more ssskins or it is MY HIDE!!  I shall reward pieces of the curscale armor to any who [perform a small service].");
 }
}
#END of FILE Zone:cabeast  ID:3033 -- Klok_Mugruk 

