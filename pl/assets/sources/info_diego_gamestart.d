instance Info_Diego_Gamestart (C_INFO)
{
    npc         = PC_Thief;
    nr          = 1;
    condition   = Info_Diego_Gamestart_Condition;
    information = Info_Diego_Gamestart_Info;
    permanent   = FALSE;
    important   = TRUE;
};

func int Info_Diego_Gamestart_Condition()
{
    if (Kapitel < 2)
    {
        return TRUE;
    };
    return FALSE;
};

func void Info_Diego_Gamestart_Info()
{
    AI_Output(self,hero,"Info_Diego_Gamestart_11_00"); //I'm Diego.
    AI_Output(hero,self,"Info_Diego_Gamestart_15_01"); //I'm...
    AI_Output(self,hero,"Info_Diego_Gamestart_11_02"); //I'm not interested in who you are. You've just arrived. I look after the new arrivals. That's all for now.
    AI_Output(self,hero,"Info_Diego_Gamestart_11_03"); //If you plan to stay alive for a while, you should talk to me. But of course I won't keep you from choosing your own destruction. Well, what do you think?

    B_Kapitelwechsel(1); // Show the chapter 1 screen
};