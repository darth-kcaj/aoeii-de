void chatFood()
{
int food = xsPlayerAttribute(1,0);
xsChatData("Player one food: %d" , food);
}


//Test Function to get a 'score' based off total resources
int EconScore(int playerID = 1)
{
    int econBase = xsPlayerAttribute(playerID,0) + xsPlayerAttribute(playerID,1) + xsPlayerAttribute(playerID,2) + xsPlayerAttribute(playerID,3);
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

        if(currScore > highscore) { // 'if the score of the current player is greater than the highest score so far'
            highscore = currScore;
            highscorePlayer = i;
        }

    }

    xsChatData("Player %d Has highest Score", highscorePlayer);
    xsChatData("Score: %d", highscore);
}
