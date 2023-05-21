void ExecuteChunkVoid(object oPlayer, string str) {
    ExecuteScriptChunk(str, oPlayer, 1);
}

void main()
{
    location Area = GetLocation(OBJECT_SELF);
    object subArea = GetAreaFromLocation(Area);
    object oPlayer = GetPCSpeaker();
    ExecuteScript("nui_creator", oPlayer);
    sqlquery x = SqlPrepareQueryCampaign("mydb", "select chunk from cps;" );
    float i = 1.0;
    MusicBackgroundStop(subArea);
    MusicBackgroundChangeDay(subArea, MusicBackgroundGetNightTrack(subArea));
    MusicBackgroundSetDelay(subArea, 1);

    MusicBackgroundPlay(subArea);

    while (SqlStep(x))
    {
        string chunk = SqlGetString(x, 0);

        DelayCommand(i, ExecuteChunkVoid(oPlayer, chunk));
        i += 0.0335;

    }
    int token = NuiFindWindow(oPlayer, "wtf");
    SendMessageToPC(oPlayer, "token = " + IntToString(token));
}

