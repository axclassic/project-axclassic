# Researcher_Akila (394109)

sub EVENT_SAY {
    if($client->GetLevel() > 24) {
        my $training = quest::saylink("training", 1);
        my $recipes = quest::saylink("recipes", 1);
        my $supplies = quest::saylink("supplies", 1);
        my $start = quest::saylink("start", 1);
        my $Research_Skill = $client->GetSkill(58);
        if($text=~/hail/i) {
            quest::say("Yes Yes. I am so excited to see you. You must be here for the $training I can offer. I so love training others as one can learn from teaching others and learning a new thing is a joy to those of us with intellect.");
        }
        if($text=~/training/i) {
            if($Research_Skill >= 54) {
                quest::updatetaskactivity(197, 0, 20);
                quest::updatetaskactivity(197, 1, 20);
                quest::updatetaskactivity(197, 2, 20);
                quest::updatetaskactivity(197, 3, 20);
                quest::say("While we appreciate the offer to help, your skills are high enough that it would be better for you to seek training in a skill where you have less ability. If you have forgotten the recipes or just wish to know them for posterity, I can teach you the $recipes.");
            }
            else {
                quest::say("The Circle of the Crystalwing have decided as a group that the best way to teach is by experience. You will be given a series of tasks that you can use to learn about the skill you are working on. When you are ready, simply tell me that you are ready to $start and I will assign you a task appropriate for your skill.");
            }
        }
        if($text=~/recipes/i) {
            if($Research_Skill >= 54) {
                quest::updatetaskactivity(197, 0, 20);
                quest::updatetaskactivity(197, 1, 20);
                quest::updatetaskactivity(197, 2, 20);
                quest::updatetaskactivity(197, 3, 20);
                quest::say("While we appreciate the offer to help, your skills are high enough that it would be better for you to seek training in a skill where you have less ability. If you have forgotten the recipes or just wish to know them for posterity, I can teach you the $recipes.");
            }
            else {
                quest::say("Here you go.");
                #Recipe 13492: "Simple Quill" 
                $client->LearnRecipe(13492);
                #Recipe 13491: "Simple Ink" 
                $client->LearnRecipe(13491);
                #Recipe 13490: "Simple Book Binding" 
                $client->LearnRecipe(13490);
                #Recipe 13489: "Simple Blank Book" 
                $client->LearnRecipe(13489);
            }
        }
        if($text=~/start/i) {
            if($Research_Skill >= 54) {
                quest::say("While we appreciate the offer to help, your skills are high enough that it would be better for you to seek training in a skill where you have less ability. If you have forgotten the recipes or just wish to know them for posterity, I can teach you the $recipes.");
            }
            else {
                if(!quest::istaskactive(197)) {
                    quest::say("Even the most intelligent of pupils must start at the beginning. Though this task may seem to have nothing to do with learning about creating spells, the skills you learn while doing them will help you in the future. take these supplies and follow the directions give to you carefully. I will have more $supplies available if you need them, just ask me and I shall supply them.");
                    quest::taskselector(197);
                    quest::summonitem(98296, 20);
                    quest::summonitem(98297, 1);
                    #Recipe 13492: "Simple Quill" 
                    #$client->LearnRecipe(13492);
                }
                else {
                    quest::say("Even the most intelligent of pupils must start at the beginning. Though this task may seem to have nothing to do with learning about creating spells, the skills you learn while doing them will help you in the future. take these supplies and follow the directions give to you carefully. I will have more $supplies available if you need them, just ask me and I shall supply them.");
                    if(quest::istaskactivityactive(197,3)) {
                        quest::summonitem(98294, 20);
                        quest::summonitem(98302, 20);
                        quest::summonitem(98303, 20);
                        #Recipe 13489: "Simple Blank Book" 
                        #$client->LearnRecipe(13489);
                    }
                    elsif(quest::istaskactivityactive(197,2)) {
                        quest::summonitem(98299, 20);
                        quest::summonitem(98300, 20);
                        quest::summonitem(98301, 20);
                        #Recipe 13490: "Simple Book Binding" 
                        #$client->LearnRecipe(13490);
                    }
                    elsif(quest::istaskactivityactive(197,1)) {
                        quest::summonitem(98256, 20);
                        quest::summonitem(98298, 20);
                        quest::summonitem(58145, 20);
                        #Recipe 13491: "Simple Ink" 
                        #$client->LearnRecipe(13491);
                    }
                }
            }
        }
        if($text=~/supplies/i) {
            if($Research_Skill >= 54) {
                quest::updatetaskactivity(197, 0, 20);
                quest::updatetaskactivity(197, 1, 20);
                quest::updatetaskactivity(197, 2, 20);
                quest::updatetaskactivity(197, 3, 20);
                quest::say("While we appreciate the offer to help, your skills are high enough that it would be better for you to seek training in a skill where you have less ability. If you have forgotten the recipes or just wish to know them for posterity, I can teach you the $recipes.");
            }
            else {
                quest::say("Here are some more supplies you will need. Do not hesitate to ask if you need more $supplies to complete a task.");
                if(quest::istaskactivityactive(197,3)) {
                    quest::summonitem(98294, 20);
                    quest::summonitem(98302, 20);
                    quest::summonitem(98303, 20);
                }
                elsif(quest::istaskactivityactive(197,2)) {
                    quest::summonitem(98299, 20);
                    quest::summonitem(98300, 20);
                    quest::summonitem(98301, 20);
                }
                elsif(quest::istaskactivityactive(197,1)) {
                    quest::summonitem(98256, 20);
                    quest::summonitem(98298, 20);
                    quest::summonitem(58145, 20);
                }
                elsif(quest::istaskactivityactive(197,0)) {
                    quest::summonitem(98296, 20);
                }
            }
        }
    }
}

sub EVENT_ITEM {
    #Simple Quill
    if(plugin::check_handin(\%itemcount, 98292 => 20) {
        # +Crystalwing
        quest::faction(11981, 20);
        quest::exp(1000);
        quest::ding();
        quest::updatetaskactivity(197, 0, 20);
    }
    #Simple Ink
    elsif(plugin::check_handin(\%itemcount, 98293 => 20) {
        # +Crystalwing
        quest::faction(11981, 20);
        quest::exp(1000);
        quest::ding();
        quest::updatetaskactivity(197, 0, 20);
        quest::updatetaskactivity(197, 1, 20);
    }
    #Simple Book Binding
    elsif(plugin::check_handin(\%itemcount, 98294 => 20) {
       # +Crystalwing
       quest::faction(11981, 20);
       quest::exp(1000);
       quest::ding();
       quest::updatetaskactivity(197, 0, 20);
       quest::updatetaskactivity(197, 1, 20);
       quest::updatetaskactivity(197, 2, 20);
    }
    #Simple Blank Book
    elsif(plugin::check_handin(\%itemcount, 98295 => 20) {
       # +Crystalwing
       quest::faction(11981, 20);
       quest::exp(5000);
       quest::ding();
       quest::updatetaskactivity(197, 0, 20);
       quest::updatetaskactivity(197, 1, 20);
       quest::updatetaskactivity(197, 2, 20);
       quest::updatetaskactivity(197, 3, 20);
    }
    plugin::return_items(\%itemcount);
}

