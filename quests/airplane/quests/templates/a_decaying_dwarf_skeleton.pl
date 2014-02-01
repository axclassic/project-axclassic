#Kingdom of Hades quest
#All zones
#Angelox
sub EVENT_SAY {
my $haydes = quest::saylink("Haydes", 1);
 if($faction <=4 ){ #should be amailable before anything starts
  if($text=~/hail/i){
     $client->Message(14,"a decaying skeleton says,\"Hail Comrade! The end of Norrath is near but fear not, as you are a follower of $haydes.\"");}
   if($text=~/haydes/i){
     if($faction == 1){ #Must be ally to continue quest
          $client->Message(14,"Seek out a Priest of Discord, he will have your revelation.");}
     else{$client->Message(14,"Although you have done well, you are not fully trustworthy yet.");}
   }
  }
}
