
sub EVENT_CLICKDOOR {
    if(($doorid == 2) || ($doorid == 4) || ($doorid == 40) || ($doorid == 42) || ($doorid == 514) || ($doorid == 516) || ($doorid == 260)) {
        if($uguild_id > 0) {
           my $QGlobalValue = $client->GetQGlobal(${uguild_id}.".guildhall");
           if($QGlobalValue) {
               quest::MovePCInstance(345, $QGlobalValue, -1.00, -1.00, 3.34, 0);
           }
           else {
               my @clients;
               if($client->IsGrouped()) {
                   my $the_group = $client->GetGroup();
                   my $nMembers = $the_group->GroupCount();
                   for($i=0; $i<$nMembers; $i++) {
                       my $member = $the_group->GetMember($i);
                       if($the_group->IsClient($member)) {
                           push(@clients, $member);
                       }
                   }
               }
               my $instance_ID = quest::CreateInstance("guildhall", 1, 28800);
               my $arraySize = @clients;
               if($arraySize > 1) {
                   quest::AssignGroupToInstance($instance_ID);
                   quest::setgroupglobal(${uguild_id}.".guildhall", $instance_ID, 7, "H8");
                   quest::MoveGroupInstance(345, $instance_ID, -1.00, -1.00, 3.34, 0);
               }
               else {
                   quest::AssignToInstance($instance_ID);
                   quest::setglobal(${uguild_id}.".guildhall", $instance_ID, 7, "H8");
                   quest::MovePCInstance(345, $instance_ID, -1.00, -1.00, 3.34, 0);
               }
           }
        }
        else {
           $client->Message(13, "You are not in a guild.");
        }
    }
}

