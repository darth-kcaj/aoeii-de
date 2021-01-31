void chatFood()
{
int food = xsPlayerAttribute(1,0);
xsChatData("Player one food: %d" , food);
}


//Test Function to get a 'score' based off total resources - gold is multiplied by 3 as it's more valuable
int EconScore(int playerID = 1)
{
    int econBase = xsPlayerAttribute(playerID,0) + xsPlayerAttribute(playerID,1) + xsPlayerAttribute(playerID,2) + (xsPlayerAttribute(playerID,3)*3);
    return(econBase);
}


//chat the 'economy score of P1'
void p1chatEconScore()
{
    int score = EconScore(1);
    xsChatData("Player 1 Economy score: %d" , score);
}

void p2chatEconScore()
{
    int score = EconScore(2);
    xsChatData("Player 2 Economy score: %d" , score);
}

void chatHighestScore()
{
    int highscorePlayer = 0;
    int highscore = 0;
    
    //iterate over all the players, find the highest score
    for( i = 1; < 9 ) {
        
        int currScore = EconScore(i);

        if(currScore > highscore) {
            highscore = currScore;
            highscorePlayer = i;
        }

    }

    xsChatData("Player %d Has highest Score", highscorePlayer);
    xsChatData("Score: %d", highscore);
}


int LowestScorePlayer()
{
    int lowscorePlayer = 1;
    int lowscore = EconScore(1); //Set the inital Lowscore value to the first players
    
    //iterate over all the players, find the lowest score score
    for( i = 1; < 9 ) {
        
        if(EconScore(i) < 0) {
            continue;
        }

        int currScore = EconScore(i);

        if(currScore < lowscore) {
            lowscore = currScore;
            lowscorePlayer = i;
        }

    }

    
    return(lowscorePlayer);
}


void giveResourceGeneration(int playerID = 0, int rate = 60)
{
    xsSetPlayerAttribute(playerID, 230, rate); //food generation
    xsSetPlayerAttribute(playerID, 231, rate); //wood Generation
    xsSetPlayerAttribute(playerID, 232, rate); //stone Generation
    xsSetPlayerAttribute(playerID, 233, rate); //gold generaton
}
void giveResources(int playerID = 0, int rate = 60) // one off resouce addition
{
    xsSetPlayerAttribute(playerID, 0, xsPlayerAttribute(playerID,0) + rate); //food
    xsSetPlayerAttribute(playerID, 1, xsPlayerAttribute(playerID,1) + rate); //wood
    xsSetPlayerAttribute(playerID, 2, xsPlayerAttribute(playerID,2) + rate); //stone
    xsSetPlayerAttribute(playerID, 3, xsPlayerAttribute(playerID,3) + rate); //gold
}


void buffWorstEconomy()
{

    int lowscorePlayer = LowestScorePlayer();
    giveResources(lowscorePlayer, 600);
    xsChatData("Player %d Has Worst Economy", lowscorePlayer);
    xsChatData("Buffing Player %d", lowscorePlayer);
    
}