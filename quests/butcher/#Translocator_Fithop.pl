##Translocator_Fithop.pl
#Zone: butcher

sub EVENT_SAY{
  my $tears = quest::saylink("travel to Ocean of Tears", 1);
  if ($text=~/Hail/i){
  $client->Message(14,"Hello there, $name. There seem to be some strange problems with the boats in this area. The Academy of Arcane Sciences has sent a small team of us to investigate them. If you need to $tears in the meantime, I can transport you to my companion there");
  }
  if($text=~/travel to Ocean of Tears/i)
  {
  $client->Message(14,"Off you go!");   
  quest::selfcast(2279);
  }
}
