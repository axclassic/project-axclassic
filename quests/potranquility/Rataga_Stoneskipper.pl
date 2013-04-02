# Resqu Miplez
# Plane patterns


sub EVENT_SAY{
  if($text=~/hail/i) {
    quest::say("Hello $name, Feel free to browse my wares. Or prehaps you would be interested in making a [deal]?");
  }
  elsif($text=~/deal/i) {
    quest::say("I would be willing to buy any patterns or molds. Well, as long as they are from the [planes]!");
  }
  elsif($text=~/planes/i) {
    quest::say("The Planes hold Ornate or Elemental armor patterns. They are used by the guards to renew their armor. Now what do you say you head off and find me some? I feel the cash rewards are more then fair.");
  }
}

## cash Ornate ##
sub EVENT_ITEM{
  if($item1 == 16290){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
  elsif($item1 == 16291){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
  elsif($item1 == 16292){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
  elsif($item1 == 16293){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
  elsif($item1 == 16294){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
  elsif($item1 == 16295){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
  elsif($item1 == 16296){
    quest::say("Thank you!");
   quest::givecash(0, 0, 0, 200);
  }
  elsif($item1 == 16297){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
  elsif($item1 == 16298){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
  elsif($item1 == 16299){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
  elsif($item1 == 16343){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
  elsif($item1 == 16344){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
  elsif($item1 == 16345){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
  elsif($item1 == 16346){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
  elsif($item1 == 16347){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
  elsif($item1 == 16348){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
  elsif($item1 == 16349){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
  elsif($item1 == 16350){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
  elsif($item1 == 16351){
    quest::say("Thank you!");
   quest::givecash(0, 0, 0, 200);
  }
  elsif($item1 == 16352){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
  elsif($item1 == 16353){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
  elsif($item1 == 16354){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
  elsif($item1 == 16355){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
  elsif($item1 == 16356){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }  
  elsif($item1 == 16357){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
  elsif($item1 == 16358){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
  elsif($item1 == 16359){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
  elsif($item1 == 16360){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 200);
  }
 ## Elemental Patterns ##
  elsif($item1 == 16362){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 400);
  }
  elsif($item1 == 16364){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 400);
  }
  elsif($item1 == 16365{
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 400);
  }
  elsif($item1 == 16366){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 400);
  }
  elsif($item1 == 16367){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 400);
  }
  elsif($item1 == 16368){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 400);
  }
  elsif($item1 == 16369){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 400);
  }
  elsif($item1 == 16370){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 400);
  }
  elsif($item1 == 16371){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 400);
  }
  elsif($item1 == 16372){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 400);
  }
  elsif($item1 == 16373){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 400);
  }
  elsif($item1 == 16374){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 400);
  }
  elsif($item1 == 16376){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 400);
  }
  elsif($item1 == 16378){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 400);
  }
  elsif($item1 == 16379){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 400);
  }
  elsif($item1 == 16380){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 400);
  }
  elsif($item1 == 16381){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 400);
  }
  elsif($item1 == 16382){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 400);
  }
  elsif($item1 == 16383){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 400);
  }
  elsif($item1 == 16385){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 400);
  }
  elsif($item1 == 16386){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 400);
  }
  elsif($item1 == 16387){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 400);
  }
  elsif($item1 == 16388){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 400);
  }
  elsif($item1 == 16389){
    quest::say("Thank you!");
    quest::givecash(0, 0, 0, 400);
  }
else {
    quest::say("This is not what I asked for.");
    plugin::return_items(\%itemcount);
     if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
      quest::givecash($copper, $silver, $gold, $platinum);
	}
  }
}


